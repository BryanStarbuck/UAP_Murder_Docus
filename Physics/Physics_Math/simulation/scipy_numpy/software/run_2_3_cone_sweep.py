"""
run_2_3_cone_sweep.py
Attempt 2, Day 3 — Simulation 3B: Cone Geometry Sweep

PURPOSE:
    Sweep cone half-angle alpha from 5 to 90 degrees (90 = hemisphere).
    At each angle, compute the geometry factor C = F_z / (eps_0 * V^2)
    using Maxwell stress tensor integration. Identify the cone angle
    that maximizes C and hence minimizes the lift voltage for a given
    conductor size.

GEOMETRY:
    Conical conductor with half-angle alpha (measured from vertical axis).
    The cone sits on a grounded infinite plane.
    The cone surface is at potential V_0.
    The apex is at the top, at height h = R/tan(alpha) above the base.

    alpha = 90 degrees: hemisphere (reference case from Day 2)
    alpha = 45 degrees: cone with height = base radius
    alpha = 10 degrees: sharp narrow cone

METHOD:
    For each cone half-angle alpha:
    1. Model the cone surface parametrically: r(theta) is the cone edge in
       spherical coordinates (theta measured from vertical/z-axis).
    2. Use a direct field computation: at each point on the cone surface,
       estimate E-field by solving Laplace's equation numerically on a 2D grid.
    3. Integrate Maxwell stress over the cone surface to get F_z.

    For computational tractability, we use a simplified approximation:
    - Model the cone as a piecewise collection of ring elements at different heights.
    - For each ring, use the hemisphere result scaled by the local geometry.
    - This is approximate but correct to within ~20% for moderate angles.
    - More accurate: finite differences on the (r, theta) Laplace equation.

    This simulation uses a 2D finite difference solution of Laplace's equation
    in cylindrical (rho, z) coordinates:
        d^2 phi/drho^2 + (1/rho) d phi/drho + d^2 phi/dz^2 = 0

    Boundary conditions:
        phi = V_0 on cone surface
        phi = 0 on ground plane (z = 0)
        phi = 0 on far boundary (rho = R_box, z = H_box)
        Neumann BC at z-axis (symmetry): d phi/d rho = 0

OUTPUTS:
    alpha (deg), F_z (mN), C_eff, C_dimensionless, V_lift (kV)
"""

import numpy as np
from scipy.linalg import solve
from scipy.sparse import lil_matrix, csr_matrix
from scipy.sparse.linalg import spsolve
import warnings
warnings.filterwarnings('ignore')

# ============================================================
# Physical constants
# ============================================================
EPS_0 = 8.854187817e-12   # F/m

# ============================================================
# Problem parameters
# ============================================================
V_0  = 10e3    # Applied voltage (10 kV)
R    = 0.10    # Reference length scale (cone base radius, 10 cm)
M_LIFT = 0.5   # Target lift mass (kg)
G    = 9.81    # Gravity (m/s^2)

# ============================================================
# Finite difference Laplace solver in cylindrical coordinates
# ============================================================
def solve_laplace_cone(alpha_deg, N_rho=80, N_z=100, R_ref=0.10):
    """
    Solve Laplace's equation on a (rho, z) grid for a cone of half-angle alpha.

    Parameters:
        alpha_deg : half-angle of the cone from the z-axis (degrees)
                    alpha = 90 => hemisphere-like geometry
        N_rho, N_z: grid resolution
        R_ref: reference scale (cone tip is at top)

    Returns:
        phi: 2D potential array [N_rho x N_z]
        drho, dz: grid spacings
        rho_arr, z_arr: coordinate arrays
        F_z: net upward force on cone (N)
    """
    alpha = np.radians(alpha_deg)

    # For alpha < 90: cone tip is at origin, base at height h = R_ref/tan(alpha)
    # But we want apex pointing up. Set up: cone apex at z = H_cone, base at z = 0.
    # The cone surface in (rho, z): rho = (H_cone - z) * tan(alpha)  for 0 <= z <= H_cone

    # Box dimensions: extend 3x the reference scale
    H_cone = R_ref / np.tan(alpha) if alpha < np.radians(89) else R_ref
    H_cone = min(H_cone, 5 * R_ref)  # Cap to avoid huge domains for very sharp cones

    rho_max = 4 * R_ref
    z_max = max(H_cone * 1.5, 3 * R_ref)

    rho_arr = np.linspace(0, rho_max, N_rho)
    z_arr = np.linspace(0, z_max, N_z)
    drho = rho_arr[1] - rho_arr[0]
    dz = z_arr[1] - z_arr[0]

    N = N_rho * N_z
    A = lil_matrix((N, N))
    b = np.zeros(N)

    def idx(i, j):
        return i * N_z + j

    # Identify cone surface points: rho = (H_cone - z) * tan(alpha)
    def is_cone_surface(i, j):
        rho = rho_arr[i]
        z = z_arr[j]
        if z > H_cone or z < 0:
            return False
        rho_cone = (H_cone - z) * np.tan(alpha)
        # A point is ON the cone surface if its rho is within one cell of the cone
        return abs(rho - rho_cone) < drho

    for i in range(N_rho):
        for j in range(N_z):
            k = idx(i, j)
            rho = rho_arr[i]
            z = z_arr[j]

            # Ground plane: z = 0
            if j == 0:
                A[k, k] = 1.0
                b[k] = 0.0
                continue

            # Far boundary: rho = rho_max or z = z_max
            if i == N_rho - 1 or j == N_z - 1:
                A[k, k] = 1.0
                b[k] = 0.0
                continue

            # Axis symmetry: rho = 0
            if i == 0:
                # At rho = 0: d^2phi/dz^2 + 2/drho^2 * (phi[1,j] - phi[0,j]) = 0
                # From L'Hopital: (1/rho)*dphi/drho -> d^2phi/drho^2 at rho=0
                A[k, k] = -(2.0/drho**2 + 2.0/dz**2)
                A[k, idx(1, j)] = 2.0/drho**2
                A[k, idx(0, j+1)] = 1.0/dz**2
                A[k, idx(0, j-1)] = 1.0/dz**2
                continue

            # Cone surface: apply Dirichlet BC phi = V_0
            if is_cone_surface(i, j):
                A[k, k] = 1.0
                b[k] = V_0
                continue

            # Check if this point is inside the cone (phi = V_0 inside conductor)
            rho_cone_at_z = (H_cone - z) * np.tan(alpha) if z <= H_cone else -1
            if rho <= rho_cone_at_z:
                A[k, k] = 1.0
                b[k] = V_0
                continue

            # Interior: Laplace FD stencil in cylindrical coords
            # d^2phi/drho^2 + (1/rho)*dphi/drho + d^2phi/dz^2 = 0
            A[k, k] = -(2.0/drho**2 + 2.0/dz**2)
            A[k, idx(i+1, j)] = 1.0/drho**2 + 1.0/(2*rho*drho)
            A[k, idx(i-1, j)] = 1.0/drho**2 - 1.0/(2*rho*drho)
            A[k, idx(i, j+1)] = 1.0/dz**2
            A[k, idx(i, j-1)] = 1.0/dz**2

    # Solve
    A_csr = csr_matrix(A)
    phi_flat = spsolve(A_csr, b)
    phi = phi_flat.reshape(N_rho, N_z)

    # Compute F_z from Maxwell stress on the cone surface
    F_z = 0.0
    for i in range(1, N_rho - 1):
        for j in range(1, N_z - 1):
            if not is_cone_surface(i, j):
                continue

            rho = rho_arr[i]
            z = z_arr[j]

            # Normal to the cone surface: (sin(alpha), 0, cos(alpha)) in (rho, phi, z)
            # Pointing outward from the cone
            n_rho = np.sin(alpha)
            n_z = np.cos(alpha)  # Note: cone narrows upward, so outward normal has +z component

            # Approximate E-field at this surface point from FD
            E_rho = -(phi[i+1, j] - phi[i-1, j]) / (2 * drho)
            E_z = -(phi[i, j+1] - phi[i, j-1]) / (2 * dz)

            # Normal component of E
            E_n = E_rho * n_rho + E_z * n_z

            # Maxwell pressure (outward)
            P = EPS_0 * E_n**2 / 2.0

            # Surface element: cone surface ring
            # dA = 2*pi*rho * dL  where dL = sqrt(drho^2 + dz^2) along surface
            dL = np.sqrt(drho**2 + dz**2) / np.sqrt(2)  # diagonal length per cell
            dA = 2 * np.pi * rho * dL

            # z-component of force: F_z contribution = P * n_z * dA
            F_z += P * n_z * dA

    return phi, drho, dz, rho_arr, z_arr, F_z

# ============================================================
# Main sweep
# ============================================================
print("=" * 70)
print("SIMULATION 3B: Cone Geometry Sweep")
print(f"V_0 = {V_0/1e3:.1f} kV,  R_ref = {R*100:.1f} cm")
print("=" * 70)
print(f"{'alpha (deg)':>12} {'F_z (mN)':>12} {'C_eff (m)':>12} {'C_dim':>10} {'V_lift (kV)':>12}")
print("-" * 70)

alpha_values = [10, 20, 30, 45, 60, 75, 90]
results = {}

for alpha_deg in alpha_values:
    try:
        phi, drho, dz, rho_arr, z_arr, F_z = solve_laplace_cone(alpha_deg, N_rho=60, N_z=80, R_ref=R)
        C_eff = F_z / (EPS_0 * V_0**2)
        C_dim = C_eff / R  # dimensionless
        V_lift = np.sqrt(M_LIFT * G / (EPS_0 * C_eff)) if C_eff > 0 else float('inf')
        results[alpha_deg] = {'F_z': F_z, 'C_eff': C_eff, 'C_dim': C_dim, 'V_lift': V_lift}
        print(f"{alpha_deg:>12d} {F_z*1e3:>12.4f} {C_eff:>12.4f} {C_dim:>10.4f} {V_lift/1e3:>12.2f}")
    except Exception as e:
        print(f"{alpha_deg:>12d}  ERROR: {e}")
        results[alpha_deg] = {'F_z': None, 'error': str(e)}

print("-" * 70)

# ============================================================
# Find optimal angle
# ============================================================
valid = {a: r for a, r in results.items() if r.get('F_z') is not None and r['F_z'] > 0}
if valid:
    best_alpha = max(valid, key=lambda a: valid[a]['C_eff'])
    best = valid[best_alpha]
    print(f"\nOPTIMAL CONE ANGLE: alpha = {best_alpha} degrees")
    print(f"  C_eff = {best['C_eff']:.4f} m")
    print(f"  C_dim = {best['C_dim']:.4f}")
    print(f"  V_lift = {best['V_lift']/1e3:.2f} kV")

    # Compare to hemisphere (alpha=90)
    if 90 in valid:
        hemi = valid[90]
        improvement = 100 * (best['C_eff'] - hemi['C_eff']) / hemi['C_eff']
        print(f"\n  Improvement over hemisphere: {improvement:.1f}%")
        print(f"  Hemisphere V_lift: {hemi['V_lift']/1e3:.2f} kV")
        print(f"  Best-angle V_lift: {best['V_lift']/1e3:.2f} kV")

print("\nDone.")
