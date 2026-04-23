"""
Simulation: Magpylib Validation — N52 Magnet vs. Analytical Dipole Formula
Attempt 1, Day 1 — UAP Physics Propulsion Research

Purpose: Validate that Magpylib computes the static magnetic field of a
permanent magnet correctly before trusting it for Kelvin force analysis.

Test: Single N52 cuboid magnet (10x10x5 mm), z-magnetized.
Compare B_z at z = 10 cm (on symmetry axis) to the analytical far-field
dipole formula: B_z = (mu_0 / 4*pi) * 2*m / r^3

Expected: agreement within 5% (dipole approximation holds at z/height = 20:1).

Success criterion: |error| < 5%
"""

import magpylib as magpy
import numpy as np

mu_0 = 4.0 * np.pi * 1e-7   # T·m/A (magnetic permeability of free space)

# --------------------------------------------------------------------------
# MAGNET PARAMETERS
# --------------------------------------------------------------------------
Br = 1.48       # T, remanence of N52 neodymium magnet
M_mag = Br / mu_0  # A/m, equivalent magnetization (= B_r / mu_0 for NdFeB in free space)

# Magnet dimensions: 10 mm x 10 mm x 5 mm (W x L x H)
# Height (axial dimension) = 5 mm = 0.005 m
mag_dim = (0.010, 0.010, 0.005)  # meters

# Create a z-magnetized cuboid magnet at the origin
magnet = magpy.magnet.Cuboid(
    magnetization=(0.0, 0.0, M_mag),   # A/m, along +z
    dimension=mag_dim,                  # (x, y, z) dimensions in meters
    position=(0.0, 0.0, 0.0),
)

# --------------------------------------------------------------------------
# OBSERVER POINT
# --------------------------------------------------------------------------
z_obs = 0.10    # m (10 cm above center of magnet)
obs_point = np.array([0.0, 0.0, z_obs])

# --------------------------------------------------------------------------
# MAGPYLIB FIELD COMPUTATION
# --------------------------------------------------------------------------
B_vec = magnet.getB(obs_point)
B_z_magpy = B_vec[2]   # T

# --------------------------------------------------------------------------
# ANALYTICAL DIPOLE FORMULA
# Applies in the far field: B_z = (mu_0/4*pi) * 2*m / r^3
# where m = M * V is the magnetic dipole moment in A·m²
# --------------------------------------------------------------------------
V_magnet = mag_dim[0] * mag_dim[1] * mag_dim[2]   # m^3
m_dipole = M_mag * V_magnet                         # A·m^2

# On-axis dipole field at distance r along magnetization axis:
B_z_analytical = (mu_0 / (4.0 * np.pi)) * 2.0 * m_dipole / z_obs**3   # T

# --------------------------------------------------------------------------
# COMPARISON
# --------------------------------------------------------------------------
error_abs = B_z_magpy - B_z_analytical
error_pct = abs(error_abs) / abs(B_z_analytical) * 100.0

# --------------------------------------------------------------------------
# OUTPUT
# --------------------------------------------------------------------------
print("=" * 60)
print("MAGPYLIB VALIDATION: N52 Dipole Field at 10 cm")
print("=" * 60)
print(f"  Magnet:         10 x 10 x 5 mm NdFeB N52")
print(f"  Br:             {Br} T")
print(f"  M_magnetization:{M_mag:.4e} A/m")
print(f"  V_magnet:       {V_magnet:.2e} m^3")
print(f"  m_dipole:       {m_dipole:.6f} A·m^2")
print(f"  Observer z:     {z_obs*100:.0f} cm (on symmetry axis)")
print()
print(f"  B_z (Magpylib):    {B_z_magpy*1e3:.6f} mT")
print(f"  B_z (Analytical):  {B_z_analytical*1e3:.6f} mT")
print(f"  Abs error:         {error_abs*1e6:.4f} µT")
print(f"  Relative error:    {error_pct:.3f}%")
print()
if error_pct < 5.0:
    print("  RESULT: VALIDATION PASSED")
    print(f"  Magpylib agrees with analytical dipole to within {error_pct:.2f}%.")
    print("  Note: Small difference is expected — the dipole formula is a")
    print("  far-field approximation; Magpylib uses exact volume integration.")
else:
    print(f"  RESULT: VALIDATION FAILED — {error_pct:.1f}% error exceeds 5% threshold.")
    print("  Check: magnetization units, dimension units, observer coordinates.")
print("=" * 60)
