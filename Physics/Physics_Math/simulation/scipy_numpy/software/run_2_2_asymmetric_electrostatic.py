"""
run_2_2_asymmetric_electrostatic.py
Attempt 2, Day 2: Asymmetric Electrostatic Pressure Thrust

Computes the net vertical (z-direction) electrostatic force on a conducting
hemisphere resting on a grounded conducting plane, using the Maxwell stress
tensor formulation.

Physics:
    F_z = integral over hemisphere surface of P_e(theta) * cos(theta) * dA
    P_e = (eps_0 / 2) * E_n^2        electrostatic pressure
    E_n = -dphi/dr at r=R             normal E-field at conductor surface

The potential is computed from the Legendre polynomial expansion for a sphere
with the boundary condition phi = V_0 on upper hemisphere (z>0) and phi = -V_0
on the image lower hemisphere (satisfying the grounded plane at z=0 by
antisymmetry). Expansion truncated at l_max.

Validation test:
    Full sphere at uniform potential V_0 → net force F_z must be exactly zero.

Main test:
    Hemisphere (upper half-sphere) on grounded plane → net F_z should be
    nonzero and upward (positive).

Run this script:
    python3 run_2_2_asymmetric_electrostatic.py

Author: UAP Physics Research AI (Day 2)
Date: 2026-04-23
"""

import numpy as np
from scipy.special import legendre
from scipy.integrate import quad

# =============================================================================
# PHYSICAL CONSTANTS
# =============================================================================
EPS_0 = 8.854187817e-12   # F/m, permittivity of free space

# =============================================================================
# DESIGN PARAMETERS (from Attempt.yaml and math_day_2.mdx)
# =============================================================================
R = 0.10        # m, hemisphere radius
V_0 = 10000.0   # V, applied voltage on hemisphere

# Legendre series truncation
L_MAX = 21      # use odd terms 1, 3, 5, ..., L_MAX-2 (must be odd max)
                # L_MAX=21 gives terms l=1,3,5,...,19 (10 terms)


# =============================================================================
# LEGENDRE EXPANSION COEFFICIENTS
# =============================================================================
# For the sphere with V=+V_0 on upper hemisphere, V=-V_0 on lower hemisphere,
# the potential outside (r > R) is:
#   phi(r, theta) = sum_{l odd} A_l * (R/r)^{l+1} * P_l(cos theta)
#
# Coefficients:
#   A_l = (2l+1) * V_0 * integral_0^1 P_l(x) dx    for l odd
#   A_l = 0                                          for l even
#
# Known integrals int_0^1 P_l(x) dx for odd l:
#   l=1:  1/2
#   l=3:  -1/8
#   l=5:  1/16
#   l=7:  -5/128
#   l=9:  7/256
#   l=11: -21/1024
#   l=13: 33/2048
#   l=15: -429/32768
#   l=17: 715/65536
#   l=19: -2431/262144
# (from Abramowitz & Stegun or direct integration of Legendre polynomials)

def integral_Pl_0_to_1(l):
    """Compute integral_0^1 P_l(x) dx numerically."""
    Pl = legendre(l)
    result, _ = quad(Pl, 0.0, 1.0)
    return result

def compute_coefficients(l_max, V_0):
    """Return dict of A_l coefficients for odd l from 1 to l_max."""
    coeffs = {}
    for l in range(1, l_max + 1, 2):  # odd l only
        I_l = integral_Pl_0_to_1(l)
        A_l = (2 * l + 1) * V_0 * I_l
        coeffs[l] = A_l
    return coeffs


# =============================================================================
# E-FIELD AT HEMISPHERE SURFACE
# =============================================================================
# E_r(R, theta) = -dphi/dr|_{r=R}
#              = sum_{l odd} A_l * (l+1)/R * P_l(cos theta)

def E_r_surface(theta_arr, R, coeffs):
    """
    Compute the normal E-field at r=R for an array of polar angles theta.

    Parameters:
        theta_arr: array of angles in radians, 0 <= theta <= pi/2
        R: sphere radius in meters
        coeffs: dict {l: A_l} from compute_coefficients

    Returns:
        E_r: array of E-field magnitudes [V/m]
    """
    x = np.cos(theta_arr)  # cos(theta)
    E_r = np.zeros_like(theta_arr)
    for l, A_l in coeffs.items():
        Pl = legendre(l)
        E_r += A_l * (l + 1) / R * Pl(x)
    return E_r


# =============================================================================
# FORCE INTEGRAL
# =============================================================================
# F_z = pi * eps_0 * R^2 * integral_0^{pi/2} E_r(theta)^2 * cos(theta) * sin(theta) d theta
#     = pi * eps_0 * R^2 * integral_0^1 E_r(arccos x)^2 * x dx     [x = cos theta]

def compute_Fz_hemisphere(R, V_0, coeffs, n_points=10000):
    """
    Compute net vertical force on hemisphere using the Maxwell stress tensor.

    Numerical integration: midpoint rule over theta in [0, pi/2].

    Parameters:
        R: hemisphere radius [m]
        V_0: applied voltage [V]
        coeffs: dict of Legendre coefficients
        n_points: number of integration points

    Returns:
        F_z: net vertical force [N], positive = upward
    """
    # Integrate over theta from 0 to pi/2
    theta = np.linspace(1e-10, np.pi / 2 - 1e-10, n_points)

    E_r = E_r_surface(theta, R, coeffs)
    P_e = (EPS_0 / 2) * E_r**2                  # electrostatic pressure [Pa]
    integrand = P_e * np.cos(theta) * np.sin(theta) * R**2  # force density per dtheta dphi / (2pi)

    dtheta = theta[1] - theta[0]
    F_z = 2 * np.pi * np.sum(integrand) * dtheta  # integrate over phi gives 2*pi factor

    return F_z


def compute_Fz_sphere(R, V_0, n_points=10000):
    """
    Validation: compute net vertical force on a FULL sphere at uniform potential V_0.
    For a full sphere, E_r = V_0/R (uniform, from standard Laplace solution).
    F_z must be zero by symmetry.

    Integrate over theta from 0 to pi:
        F_z = pi * eps_0 * R^2 * integral_0^pi (V_0/R)^2 * cos(theta) * sin(theta) dtheta
            = pi * eps_0 * V_0^2 * integral_0^pi cos(theta) * sin(theta) dtheta
            = pi * eps_0 * V_0^2 * [sin^2(theta)/2]_0^pi = 0
    """
    theta = np.linspace(1e-10, np.pi - 1e-10, n_points)
    E_r = np.full_like(theta, V_0 / R)           # uniform E_r for sphere
    P_e = (EPS_0 / 2) * E_r**2
    integrand = P_e * np.cos(theta) * np.sin(theta) * R**2

    dtheta = theta[1] - theta[0]
    F_z = 2 * np.pi * np.sum(integrand) * dtheta

    return F_z


# =============================================================================
# PARAMETRIC SWEEPS
# =============================================================================

def voltage_sweep(R, voltages, coeffs_fn, l_max):
    """Compute F_z for a range of voltages at fixed R."""
    results = []
    for V in voltages:
        c = coeffs_fn(l_max, V)
        F = compute_Fz_hemisphere(R, V, c)
        results.append((V, F))
    return results


# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    print("=" * 60)
    print("SIMULATION: Asymmetric Electrostatic Pressure Thrust")
    print("Attempt 2, Day 2 — UAP Physics Research")
    print(f"R = {R*100:.1f} cm, V_0 = {V_0/1000:.1f} kV, L_MAX = {L_MAX}")
    print("=" * 60)

    # ------------------------------------------------------------------
    # VALIDATION TEST: Full sphere at uniform potential — must give F_z = 0
    # ------------------------------------------------------------------
    print("\n--- VALIDATION: Full sphere (F_z must be zero) ---")
    F_z_sphere = compute_Fz_sphere(R, V_0)
    print(f"Full sphere F_z = {F_z_sphere:.6e} N")
    if abs(F_z_sphere) < 1e-10:
        print("VALIDATION: PASS — F_z is zero for symmetric sphere (< 1e-10 N)")
    elif abs(F_z_sphere) < 1e-6:
        print(f"VALIDATION: PASS (numerical) — |F_z| = {abs(F_z_sphere):.3e} N < 1 uN")
    else:
        print(f"VALIDATION: WARNING — |F_z| = {abs(F_z_sphere):.3e} N, check integration")

    # ------------------------------------------------------------------
    # COEFFICIENT COMPUTATION
    # ------------------------------------------------------------------
    print(f"\n--- Legendre Coefficients (odd l, up to l={L_MAX}) ---")
    coeffs = compute_coefficients(L_MAX, V_0)
    for l in sorted(coeffs.keys()):
        print(f"  A_{l:2d} = {coeffs[l]:+.6f} V")

    # ------------------------------------------------------------------
    # MAIN TEST: Hemisphere on grounded plane
    # ------------------------------------------------------------------
    print("\n--- MAIN TEST: Hemisphere on grounded plane ---")
    F_z_hemi = compute_Fz_hemisphere(R, V_0, coeffs)
    print(f"Hemisphere F_z = {F_z_hemi:.6e} N = {F_z_hemi*1000:.4f} mN")

    analytic_l1 = (9.0 / 4.0) * np.pi * EPS_0 * V_0**2
    print(f"Analytical l=1 only estimate: {analytic_l1:.6e} N = {analytic_l1*1000:.4f} mN")

    ratio = F_z_hemi / analytic_l1 if analytic_l1 != 0 else float('nan')
    print(f"Numerical / l=1 ratio = {ratio:.4f}")

    # ------------------------------------------------------------------
    # E-FIELD PROFILE
    # ------------------------------------------------------------------
    print("\n--- E-field at surface vs polar angle ---")
    thetas_deg = [0, 10, 20, 30, 45, 60, 75, 90]
    thetas_rad = np.radians(thetas_deg)
    E_profile = E_r_surface(thetas_rad, R, coeffs)
    print(f"  {'theta':>8s}  {'E_r [V/m]':>14s}  {'P_e [Pa]':>14s}  {'cos(theta)':>10s}")
    for theta_d, theta_r, E in zip(thetas_deg, thetas_rad, E_profile):
        P = (EPS_0 / 2) * E**2
        print(f"  {theta_d:8.1f}  {E:14.2f}  {P:14.6e}  {np.cos(theta_r):10.4f}")

    # ------------------------------------------------------------------
    # VOLTAGE SCALING
    # ------------------------------------------------------------------
    print("\n--- Voltage scaling: F_z vs V_0 at R = 10 cm ---")
    voltages = [1e3, 5e3, 10e3, 20e3, 50e3, 100e3, 280e3]
    print(f"  {'V [kV]':>10s}  {'F_z [mN]':>12s}  {'F_z/V^2 * 1e12':>16s}")
    for V in voltages:
        c = compute_coefficients(L_MAX, V)
        F = compute_Fz_hemisphere(R, V, c)
        ratio_V2 = F / (V**2) * 1e12
        print(f"  {V/1000:10.1f}  {F*1000:12.4f}  {ratio_V2:16.4f}")

    # ------------------------------------------------------------------
    # FORCE FOR LIFT TARGET
    # ------------------------------------------------------------------
    print("\n--- Force for lift target ---")
    m_target = 0.5    # kg
    F_target = m_target * 9.81  # N
    print(f"Target lift mass: {m_target} kg  →  F_target = {F_target:.3f} N")

    # Solve for required voltage: F_z ~ C_eff * V^2, find C_eff first
    C_eff = F_z_hemi / (V_0**2)  # slope from main test
    V_for_lift = np.sqrt(F_target / C_eff)
    print(f"Effective coefficient C_eff = F_z / V^2 = {C_eff:.4e} N/V^2")
    print(f"Required voltage for lift:  V_lift = {V_for_lift/1000:.1f} kV")
    E_apex_lift = 3 * V_for_lift / R
    print(f"Apex E-field at V_lift:     E_apex = {E_apex_lift/1e6:.2f} MV/m")
    print(f"Air breakdown field:        ~3 MV/m")
    print(f"Vacuum field emission limit: ~100-500 MV/m")
    if E_apex_lift < 3e6:
        print("STATUS: FEASIBLE IN AIR — below air breakdown")
    elif E_apex_lift < 100e6:
        print("STATUS: REQUIRES VACUUM — exceeds air breakdown, below vacuum limit")
    else:
        print("STATUS: CHALLENGING — exceeds typical vacuum field emission limit")

    print("\n" + "=" * 60)
    print("Simulation complete.")
    print("=" * 60)
