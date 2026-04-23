"""
Simulation: Halbach Ring Field Map and Kelvin Force Analysis
Attempt 1, Day 1 — UAP Physics Propulsion Research

Purpose: Compute the on-axis magnetic field profile and Kelvin body force
on a ferromagnetic target above two ring configurations:
  Option A: 8 N52 magnets, all +z magnetization (axial array)
  Option B: 8 N52 magnets, 2x Halbach magnetization pattern

Design parameters from Attempt.yaml:
  - N = 8 magnets
  - Ring radius R = 10 cm
  - Magnet dimensions: 20 x 20 x 10 mm
  - Target: 500 g steel disc, B_sat = 2.0 T

Output:
  - B_z(z) profile on symmetry axis for z in [5 mm, 100 mm]
  - dBz/dz gradient profile
  - Kelvin force F_z(z) on ferromagnetic target (saturation limit)
  - Comparison of Option A vs Option B
  - Report whether F_z > m_target * g at any accessible height
"""

import magpylib as magpy
import numpy as np

# ============================================================
# CONSTANTS
# ============================================================
mu_0 = 4.0 * np.pi * 1e-7   # T·m/A

# ============================================================
# MAGNET AND RING PARAMETERS
# ============================================================
Br = 1.48           # T, N52 remanence
M_mag = Br / mu_0   # A/m

N = 8               # number of magnets
R = 0.10            # m, ring radius (magnet centers)
mag_dim = (0.020, 0.020, 0.010)   # W x L x H in meters (20x20x10 mm)

# ============================================================
# TARGET PARAMETERS (500 g steel disc)
# ============================================================
m_target = 0.5       # kg
rho_steel = 7800     # kg/m^3
V_target = m_target / rho_steel   # m^3
B_sat_steel = 2.0    # T (mild steel saturation)
M_sat_steel = B_sat_steel / mu_0  # A/m

g = 9.81             # m/s^2
F_required = m_target * g   # N, required lift force

# ============================================================
# OBSERVER GRID
# ============================================================
z_min = 0.005   # m
z_max = 0.100   # m
n_pts = 100
z_array = np.linspace(z_min, z_max, n_pts)
obs_points = np.column_stack([np.zeros(n_pts), np.zeros(n_pts), z_array])

# ============================================================
# BUILD MAGNET COLLECTIONS
# ============================================================

def build_axial_ring(N, R, mag_dim, M):
    """All magnets pointing +z (Option A)."""
    magnets = []
    for k in range(N):
        phi = 2.0 * np.pi * k / N
        x = R * np.cos(phi)
        y = R * np.sin(phi)
        mag = magpy.magnet.Cuboid(
            magnetization=(0.0, 0.0, M),
            dimension=mag_dim,
            position=(x, y, 0.0),
        )
        magnets.append(mag)
    return magpy.Collection(*magnets)


def build_halbach_ring(N, R, mag_dim, M, p=2):
    """
    2x Halbach pattern (p=2): magnetization direction rotates at 2x
    the position angle. Magnetization lies in the xz plane, rotating as:
        M_x = M * sin(p * phi)
        M_z = M * cos(p * phi)
    For p=2 and N=8: net z-moment = sum of cos(2*k*pi/4) = 0.
    """
    magnets = []
    for k in range(N):
        phi = 2.0 * np.pi * k / N
        angle_mag = p * phi   # magnetization angle (from +z in xz-plane)
        mx = M * np.sin(angle_mag)
        my = 0.0
        mz = M * np.cos(angle_mag)
        x = R * np.cos(phi)
        y = R * np.sin(phi)
        mag = magpy.magnet.Cuboid(
            magnetization=(mx, my, mz),
            dimension=mag_dim,
            position=(x, y, 0.0),
        )
        magnets.append(mag)
    return magpy.Collection(*magnets)


ring_A = build_axial_ring(N, R, mag_dim, M_mag)
ring_B = build_halbach_ring(N, R, mag_dim, M_mag, p=2)

# ============================================================
# COMPUTE FIELDS
# ============================================================
B_A = ring_A.getB(obs_points)   # shape (n_pts, 3)
B_B = ring_B.getB(obs_points)

Bz_A = B_A[:, 2]
Bz_B = B_B[:, 2]

# Numerical gradient of B_z with respect to z
dBz_A_dz = np.gradient(Bz_A, z_array)
dBz_B_dz = np.gradient(Bz_B, z_array)

# ============================================================
# KELVIN FORCE CALCULATION
# Force on target body at saturation:
#   F_z = V_target * M_sat * (dB_z^ext / dz)
# This gives force on the TARGET; reaction force on ring = -F_z (upward).
# We report |F_z| and its sign convention:
#   dBz/dz > 0 => field increases upward => target pulled upward (force up on target)
#                 => ring is pushed DOWN (not what we want)
#   dBz/dz < 0 => field decreases upward => target pulled downward toward ring
#                 => ring is pushed UP (Sub-approach A: target fixed to ground below ring)
# ============================================================
F_kelvin_A = V_target * M_sat_steel * dBz_A_dz   # N (positive = upward on target)
F_kelvin_B = V_target * M_sat_steel * dBz_B_dz

# For Sub-approach A (target below ring, fixed to ground):
# The ring is pushed UPWARD when F_kelvin_target is downward (negative).
# Lift force on RING = -F_kelvin_A (Newton 3rd law).
# We want |F_kelvin_A| > F_required when F_kelvin_A < 0.
F_lift_A = -F_kelvin_A   # Force on the ring (craft), positive = upward
F_lift_B = -F_kelvin_B

# ============================================================
# OUTPUT
# ============================================================
print("=" * 72)
print("HALBACH RING KELVIN FORCE ANALYSIS — Attempt 1, Day 1")
print("=" * 72)
print(f"  N = {N} N52 magnets, R = {R*100:.0f} cm, magnet = 20x20x10 mm")
print(f"  Target: {m_target*1000:.0f} g steel disc, B_sat = {B_sat_steel} T")
print(f"  Required lift force: {F_required:.3f} N")
print()

# --- Option A table ---
print("OPTION A: All-axial (+z) magnetization")
print(f"  {'z(cm)':>6}  {'Bz(mT)':>8}  {'dBz/dz(T/m)':>12}  {'F_lift(N)':>10}  {'F/mg':>7}")
print(f"  {'-'*6}  {'-'*8}  {'-'*12}  {'-'*10}  {'-'*7}")
for i in range(0, n_pts, 10):
    ratio = F_lift_A[i] / F_required
    print(f"  {z_array[i]*100:6.1f}  {Bz_A[i]*1000:8.3f}  {dBz_A_dz[i]:12.3f}  "
          f"{F_lift_A[i]:10.3f}  {ratio:7.4f}")
print()

max_A_idx = np.argmax(F_lift_A)
print(f"  Peak lift force (Option A): {F_lift_A[max_A_idx]:.3f} N "
      f"at z = {z_array[max_A_idx]*100:.1f} cm  (F/mg = {F_lift_A[max_A_idx]/F_required:.4f})")
print()

# --- Option B table ---
print("OPTION B: 2x Halbach magnetization (net z-moment = 0)")
print(f"  {'z(cm)':>6}  {'Bz(mT)':>8}  {'dBz/dz(T/m)':>12}  {'F_lift(N)':>10}  {'F/mg':>7}")
print(f"  {'-'*6}  {'-'*8}  {'-'*12}  {'-'*10}  {'-'*7}")
for i in range(0, n_pts, 10):
    ratio = F_lift_B[i] / F_required
    print(f"  {z_array[i]*100:6.1f}  {Bz_B[i]*1000:8.3f}  {dBz_B_dz[i]:12.3f}  "
          f"{F_lift_B[i]:10.3f}  {ratio:7.4f}")
print()

max_B_idx = np.argmax(F_lift_B)
print(f"  Peak lift force (Option B): {F_lift_B[max_B_idx]:.3f} N "
      f"at z = {z_array[max_B_idx]*100:.1f} cm  (F/mg = {F_lift_B[max_B_idx]/F_required:.4f})")
print()

# --- Summary ---
print("=" * 72)
print("SUMMARY")
print("=" * 72)

if max(F_lift_A) > F_required:
    z_lift = z_array[np.argmax(F_lift_A > F_required)] * 100
    print(f"  Option A: EXCEEDS target lift force.")
    print(f"  Lift > mg for z <= {z_array[np.where(F_lift_A > F_required)[0][-1]]*100:.1f} cm")
else:
    shortfall = F_required / max(F_lift_A)
    print(f"  Option A: BELOW target. Peak force is {shortfall:.2f}x short.")
    print(f"  Action: increase magnet count, reduce z_gap, or scale magnet size.")

if max(F_lift_B) > F_required:
    print(f"  Option B: EXCEEDS target lift force — UNEXPECTED.")
else:
    ratio_AB = max(F_lift_A) / max(F_lift_B) if max(F_lift_B) > 0 else float('inf')
    print(f"  Option B: below target. Option A is {ratio_AB:.1f}x stronger (expected).")

print()
print("  NOTE: 'F_lift' here is the upward reaction force on the Halbach ring")
print("  when the ferromagnetic target is below the ring and fixed to ground.")
print("  This is Sub-approach A (ground-coupled) geometry.")
print("  The sign convention: F_lift > 0 = craft pushed upward.")
print("=" * 72)
