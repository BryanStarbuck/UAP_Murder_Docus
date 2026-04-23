"""
run_2_3_legendre_convergence.py
Attempt 2, Day 3 — Simulation 3A: Legendre Series Convergence Test

PURPOSE:
    Test convergence of the Legendre series expansion for the hemisphere-on-grounded-plane
    electrostatic problem. Run at L_MAX = 5, 11, 21, 51, 101 and record the geometry factor
    C_eff = F_z / (eps_0 * V^2) at each truncation level.

    Day 2 used L_MAX = 21 and obtained F_z = 9.50 mN, C_eff = 10.73 m.
    This simulation determines whether C_eff is converged at L_MAX = 21.

PHYSICS:
    The hemisphere-on-grounded-plane problem is solved via the image-charge method.
    The grounded plane (phi=0 at z=0) is equivalent to having an antisymmetric
    full-sphere: +V_0 on upper hemisphere, -V_0 on lower hemisphere. This gives
    phi = 0 at z = 0 by antisymmetry, satisfying the grounded plane BC.

    The potential in the upper half-space:
        phi(r, theta) = sum_{l odd} A_l * (R/r)^{l+1} * P_l(cos theta)
        A_l = (2l+1) * V_0 * I_l    where I_l = integral_0^1 P_l(x) dx

    Only ODD Legendre terms appear (antisymmetry kills all even terms including l=0).

    E_r at the surface (r = R):
        E_r(R, theta) = sum_{l odd} A_l * (l+1)/R * P_l(cos theta)

    Force (Maxwell stress):
        F_z = 2*pi * R^2 * integral_0^{pi/2} (eps_0/2) * E_r(theta)^2 * cos(theta) * sin(theta) dtheta

VALIDATION:
    At L_MAX = 21, must reproduce Day 2 result: F_z ≈ 9.50 mN at V=10kV, R=0.10m.
"""

import numpy as np
from scipy.special import legendre, eval_legendre
from scipy.integrate import quad
import warnings
warnings.filterwarnings('ignore')

# ============================================================
# Physical constants
# ============================================================
EPS_0 = 8.854187817e-12   # F/m

# ============================================================
# Parameters
# ============================================================
V_0  = 10e3    # Applied voltage (10 kV)
R    = 0.10    # Hemisphere radius (10 cm)
M_LIFT = 0.5   # Target lift mass (kg)
G    = 9.81    # Gravity (m/s^2)

# ============================================================
# Compute I_l = integral_0^1 P_l(x) dx  (numerical)
# ============================================================
def integral_Pl_half(l):
    """Numerical integral of P_l from 0 to 1."""
    Pl = legendre(l)
    result, _ = quad(Pl, 0.0, 1.0)
    return result

# ============================================================
# Compute coefficients A_l for odd l only
# ============================================================
def compute_coefficients(L_max, V_0):
    """
    A_l = (2l+1) * V_0 * I_l    for odd l = 1, 3, 5, ..., L_max
    Returns dict {l: A_l}
    """
    coeffs = {}
    for l in range(1, L_max + 1, 2):   # ODD l only
        I_l = integral_Pl_half(l)
        coeffs[l] = (2 * l + 1) * V_0 * I_l
    return coeffs

# ============================================================
# E_r at surface r = R
# ============================================================
def compute_Er_surface(theta_arr, R, coeffs):
    """
    E_r(R, theta) = sum_{l odd} A_l * (l+1)/R * P_l(cos theta)
    """
    x = np.cos(theta_arr)
    E_r = np.zeros_like(theta_arr)
    for l, A_l in coeffs.items():
        Pl = legendre(l)
        E_r += A_l * (l + 1) / R * Pl(x)
    return E_r

# ============================================================
# Compute F_z (Maxwell stress on hemisphere)
# ============================================================
def compute_Fz(R, coeffs, n_points=20000):
    """
    F_z = 2*pi * R^2 * integral_0^{pi/2} (eps_0/2) * E_r^2 * cos(theta) * sin(theta) dtheta
    """
    theta = np.linspace(1e-10, np.pi/2 - 1e-10, n_points)
    E_r = compute_Er_surface(theta, R, coeffs)
    P_e = (EPS_0 / 2) * E_r**2
    integrand = P_e * np.cos(theta) * np.sin(theta) * R**2
    dtheta = theta[1] - theta[0]
    F_z = 2 * np.pi * np.sum(integrand) * dtheta
    return F_z

# ============================================================
# Main convergence test
# ============================================================
print("=" * 70)
print("SIMULATION 3A: Legendre Series Convergence Test")
print(f"V_0 = {V_0/1e3:.1f} kV,  R = {R*100:.1f} cm")
print("=" * 70)
print(f"{'L_MAX':>8} {'# terms':>8} {'F_z (mN)':>12} {'C_eff (m)':>12} {'E_apex (kV/m)':>15}")
print("-" * 70)

L_max_values = [5, 11, 21, 51, 101]
results = {}

for L_max in L_max_values:
    coeffs = compute_coefficients(L_max, V_0)
    n_terms = len(coeffs)
    F_z = compute_Fz(R, coeffs)
    C_eff = F_z / (EPS_0 * V_0**2)

    # E-field at apex (theta = 0, cos theta = 1, P_l(1) = 1 for all l)
    E_apex = sum(A_l * (l + 1) / R for l, A_l in coeffs.items())  # P_l(1) = 1

    results[L_max] = {'F_z': F_z, 'C_eff': C_eff, 'E_apex': E_apex, 'n_terms': n_terms}
    print(f"{L_max:>8d} {n_terms:>8d} {F_z*1e3:>12.4f} {C_eff:>12.4f} {E_apex/1e3:>15.2f}")

print("-" * 70)

# ============================================================
# Convergence analysis relative to L_MAX = 21 (Day 2 reference)
# ============================================================
C_21 = results[21]['C_eff']
F_21 = results[21]['F_z']
print(f"\nDay 2 reference (L_MAX=21): F_z = {F_21*1e3:.4f} mN, C_eff = {C_21:.4f} m")
print(f"\nConvergence relative to L_MAX = 21:")
print(f"{'L_MAX':>8} {'C_eff':>12} {'Delta from L21 (%)':>22} {'Status':>10}")
for L_max, res in results.items():
    delta = 100 * abs(res['C_eff'] - C_21) / abs(C_21)
    status = "converged" if delta < 2.0 else "not converged"
    print(f"{L_max:>8d} {res['C_eff']:>12.4f} {delta:>22.3f}% {status:>10}")

# ============================================================
# True converged value and lift voltage
# ============================================================
C_converged = results[max(L_max_values)]['C_eff']
V_lift = np.sqrt(M_LIFT * G / (EPS_0 * C_converged))

print(f"\n{'=' * 70}")
print(f"CONVERGED RESULTS (L_MAX = {max(L_max_values)}):")
print(f"  C_eff (dimensioned)   = {C_converged:.4f} m")
print(f"  C_dimensionless = C_eff/R = {C_converged/R:.3f}")
print(f"  V_lift (0.5 kg)       = {V_lift/1e3:.2f} kV")
coeffs_lift = compute_coefficients(max(L_max_values), V_lift)
E_apex_lift = sum(A_l * (l + 1) / R for l, A_l in coeffs_lift.items())
print(f"  Apex E at lift        = {E_apex_lift/1e6:.3f} MV/m")
print(f"  Air breakdown         = 3.0 MV/m  -> {'EXCEEDS air' if E_apex_lift/1e6 > 3.0 else 'OK in air'}")
print(f"  Vac field emission    = ~100 MV/m -> {'EXCEEDS vacuum!' if E_apex_lift/1e6 > 100 else 'OK in vacuum'}")

# Day 2 lift voltage for comparison
C_21 = results[21]['C_eff']
V_lift_21 = np.sqrt(M_LIFT * G / (EPS_0 * C_21))
print(f"\n  Day 2 estimate (L_MAX=21): V_lift = {V_lift_21/1e3:.2f} kV")
print(f"  Delta V_lift: {100*abs(V_lift - V_lift_21)/V_lift_21:.1f}%")

# ============================================================
# Gibbs ringing check
# ============================================================
print(f"\nGibbs ringing check at L_MAX = 101 (near theta = pi/2 edge):")
coeffs_101 = compute_coefficients(101, V_0)
theta_edge = np.linspace(np.radians(80), np.radians(90), 20)
E_r_edge = compute_Er_surface(theta_edge, R, coeffs_101)
n_sign_changes = sum(1 for i in range(len(E_r_edge)-1) if E_r_edge[i] * E_r_edge[i+1] < 0)
print(f"  Sign changes in E_r near edge (80-90 deg): {n_sign_changes}")
print(f"  E_r range: [{E_r_edge.min()/1e3:.1f}, {E_r_edge.max()/1e3:.1f}] kV/m")
print(f"  (Sign changes = Gibbs ringing; cos(theta->pi/2) -> 0, so ringing has")
print(f"   minimal effect on F_z integral)")
print("=" * 70)
