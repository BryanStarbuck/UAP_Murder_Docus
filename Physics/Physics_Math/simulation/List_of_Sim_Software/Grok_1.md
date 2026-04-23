**Here’s a comprehensive list of open-source (and a few free/close alternatives) simulation tools/packages that can handle 3D electric and magnetic fields, permanent magnets, coils/currents (including multi-phase or time-varying via AC/harmonic/transient solvers), 3D objects/geometry, and produce quantitative output data (field vectors, forces, torques, energy, etc.) for empirical analysis.**

I prioritized tools that are as close as possible to “Blender for EM physics” — i.e., comprehensive, scriptable or with GUI, 3D-native, and able to take input geometries/currents/magnet strengths and output raw data (grids, CSV, VTK, etc.). Some are full FEM/FDTD solvers, some are fast analytical Python libs, some integrate with FreeCAD/Blender for modeling. None is a perfect 1:1 Blender clone (Blender itself is great for geometry + visualization but not a full physics field solver), but combinations (e.g., FreeCAD CAD → solver → ParaView viz) get very close.

### 1. Fast Analytical / Python-First (Best for Quick Magnet + Coil Prototyping)
These are scriptable like code, super fast for static/quasistatic fields, perfect for iterating magnet arrays + currents in 3D space and exporting field/force data.

- **Magpylib** — Python library for 3D static magnetic fields from arbitrary magnets (cubes, cylinders, spheres, etc.), current loops, line currents, and arbitrary coils. Vectorized, GPU-capable via Numba/PyTorch options. Compute B/H fields on 3D grids, forces/torques between objects. Visualization with Plotly/Matplotlib/PyVista. Ideal starting point for UAP-style magnet propulsion configs.  
  GitHub: https://github.com/magpylib/magpylib  
  Docs: https://magpylib.readthedocs.io/

- **MagnetiCalc** — Interactive GUI + Python tool for static magnetic flux density and vector potential of arbitrary coils in 3D. Great for electromagnets/currents.  
  https://github.com/shredEngineer/MagnetiCalc (Hackaday project)

- **pymagnet** — Python package for 3D magnetic fields from various magnet shapes (including STL imports).  
  https://pypi.org/project/pymagnet/

### 2. Full 3D FEM Solvers (High-Accuracy for Complex Materials, Currents, Forces)
These solve Maxwell’s equations properly (magnetostatics, magnetodynamics, electric currents, electrostatics).

- **Elmer FEM** (top recommendation for your use case) — Open-source multiphysics FEM. Excellent built-in modules for magnetostatics (permanent magnets with remanence), magnetodynamics, electric currents (DC/AC, can model three-phase via harmonic or circuit coupling), electrostatics, and full electromagnetics. Handles 3D objects, forces/torques, eddy currents. GUI + config files + Python scripting. Mesh with Gmsh/FreeCAD/Salome, post-process in ParaView (export field data everywhere). Many tutorials on magnets/coils/motors. Closest to a comprehensive “suite.”  
  https://www.elmerfem.org/

- **GetDP + Gmsh** — GetDP is a general FEM solver for EM problems (magnetostatics, eddy currents, full wave). Gmsh handles 3D CAD/meshing + ONELAB GUI. Scriptable (.geo/.pro files). Widely used for custom magnet/coil devices.  
  Gmsh: https://gmsh.info/  
  GetDP: https://getdp.info/

- **FEniCS / DOLFINx** — Python-based FEM framework for solving custom PDEs (including full Maxwell equations). Extremely flexible for 3D magnetostatics, currents, etc. Script everything; great for automation/optimization.  
  https://fenicsproject.org/

- **FreeFEM** — High-level PDE solver with built-in support for magnetostatics, electrostatics, and multiphysics. Fast 2D/3D.  
  https://freefem.org/

- **Palace** (AWS Labs) — High-performance 3D FEM solver optimized for electromagnetics (cloud/HPC friendly).  
  https://awslabs.github.io/palace/

### 3. FDTD (Time-Domain) Solvers (Great for Dynamic/Transient Currents & Waves)
Perfect if you want time-varying currents (three-phase easy via source definition).

- **openEMS** — Free/open FDTD solver. Full 3D Cartesian + cylindrical. Excellent Python/Matlab/Octave scripting interface. Geometry via CSXCAD (or FreeCAD plugin). Handles currents as sources; export fields over time. Blender/FreeCAD workflows exist for modeling.  
  https://www.openems.de/

- **Meep** — MIT-licensed FDTD with Python interface. 3D, highly scriptable.  
  https://meep.readthedocs.io/

- **flaport/fdtd** — Pure Python 3D FDTD simulator (optional PyTorch GPU backend). Very lightweight.  
  https://github.com/flaport/fdtd

- **gprMax** — 3D FDTD (originally for ground-penetrating radar but fully general EM).  
  https://www.gprmax.com/

### 4. Specialized Magnetics / Other
- **OpenMagnetics** — 100% open-source (MIT) platform for designing/simulating magnetic components (cores, windings, losses, thermal). Great for coils/transformers/electromagnets. Online tools + full code.  
  https://openmagnetics.com/  
  GitHub: https://github.com/OpenMagnetics/

- **OpenParEM** — Suite of 2D/3D frequency-domain EM simulators.  
  https://openparem.org/

- **MaxFem** — Open FEM package for electrostatics, magnetostatics, eddy currents.  
  SourceForge: https://sourceforge.net/projects/maxfem/

### 5. Blender / Visualization Integrations (Closest to Your Blender Wish)
- **ElectroMag Nodes** — Geometry Nodes-based electromagnetics solver directly inside Blender. Calculates and visualizes EM fields using Blender’s procedural workflow. (Limited scope vs full FEM but very “Blender-native.”)  
  https://superhivemarket.com/products/electromag-nodes (forum discussion: https://www.eevblog.com/forum/projects/electromag-nodes-basic-electromagnetics-solver-in-blender/)

- **Blender + openEMS/FreeCAD workflows** — Model complex 3D objects in Blender or FreeCAD, export to openEMS/Elmer, run sim, import fields back into Blender/ParaView for visualization + data export. FreeCAD has an openEMS export plugin: https://github.com/LubomirJagos/FreeCAD-OpenEMS-Export

- **ParaView** (free/open) — Essential post-processor for all the above; load VTK/fields and extract quantitative data.  
  https://www.paraview.org/

### Quick Start Recommendation for Your UAP/Magnet Propulsion Goal
1. **Start here**: Magpylib (Python) — define magnets (size, strength, position/orientation), coils (current, turns, 3-phase waveforms), run on a 3D grid, compute forces/lift directly. Scriptable, instant data output, no meshing hassle.
2. **Validate/scale up**: Elmer FEM or openEMS (with FreeCAD for geometry, like Blender but CAD-focused).
3. **Visualization & data**: Everything exports to ParaView or Python (numpy/CSV) for your “empirical data” needs.

All of these are free/open-source (or have free versions). Most are scriptable so you can automate input → run → output loops for optimization.

**Project integration note**: Under your `~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/simulation/` directory structure, I’d suggest creating subfolders like `simulation/magpylib/`, `simulation/elmer/`, `simulation/openems/` etc., each with `software/` + example scripts/notebooks. We can set up a Python environment/skill to run these and feed results into attempt directories.

If you want me to:
- Pick one and generate starter code/scripts for a specific magnet/current config,
- Create the simulation dir structure + initial files,
- Or continue the work-day checklist (new day, plan, etc.),

just say the word and we’ll kick off the next step in the workflow! Which one(s) do you want to try first?






**Here’s an expanded list of *additional* open-source (or free) 3D electric/magnetic field simulation tools, libraries, and frameworks that were **not** in the previous list.** I focused exclusively on new ones that meet your criteria: 3D space/objects, support for magnets/permanent magnets, currents (including multi-phase/time-varying via scripting), quantitative output data (fields, forces, torques, energy on grids/CSV/VTK/etc.), and scriptable/GUI options. Many are Python-native or have Python interfaces, making them easy to automate for input → simulation → empirical data output, just like a “Blender for physics.”

I prioritized relevance to your UAP/magnet-propulsion goal (forces between magnet arrays + coils, lift/thrust computation). All are distinct from the prior set (no Magpylib, Elmer, openEMS, Meep, FEniCS, GetDP, Palace, etc.).

### 1. Fast/Quasi-Static Analytical & PEEC Solvers (Excellent for Quick Magnet + Coil Arrays + Forces)
These are lightweight, scriptable, and fast for prototyping 3D magnet configurations and currents without heavy meshing.

- **PyPEEC** — 3D quasi-magnetostatic FFT/PEEC solver (voxel-based). Handles coils, inductors, transformers, busbars, magnetic materials, and currents. GPU/FFT-accelerated for large systems. Outputs fields, forces, inductance. Perfect Python workflow for your magnet-current propulsion sims.  
  GitHub: https://github.com/otvam/pypeec  
  Docs/site: https://pypeec.otvam.ch

- **Radia (Python interface / RadiaSoft fork)** — Specialized 3D magnetostatics framework from ESRF (originally for undulators). Models permanent magnets (arbitrary shapes, magnetization), coils/currents, saturated iron. Computes fields, forces, torques, integrals. Python-native with strong support for magnet arrays and levitation/WPT applications.  
  Original: https://github.com/ochubar/Radia  
  Python package: https://pypi.org/project/radia/  
  Examples: https://github.com/radiasoft/Radia-Examples

- **PyCharge** — Python package for self-consistent electrodynamics of moving point charges and Lorentz-oscillator dipoles. Computes full EM fields/potentials in 3D. Great for dynamic current/magnet interactions or charged systems.  
  Paper/repo: https://arxiv.org/pdf/2107.12437 (code linked in paper)

- **HelmholtzSim** — Open-source Python package for simulating/optimizing Helmholtz coil cages (uniform B-fields) with Biot-Savart + genetic algorithms. Supports mission simulation and 3D visualization; extensible to custom coil/magnet setups.  
  Paper: https://www.sciencedirect.com/science/article/pii/S2352711025003954 (GitHub linked therein)

### 2. Specialized FEM & Force-Focused Tools (Ideal for Actuators, Solenoids, Propulsion Forces)
These shine at computing magnetic forces/lift in 3D with magnets + currents.

- **DoSA-3D** — Dedicated 3D open-source actuator/solenoid simulator. Predicts magnetic forces in voice-coil motors, solenoids, etc., with permanent magnets + coils. Uses GetDP/Gmsh backend but has its own GUI + workflow for easy 3D geometry, currents, and force output. Extremely relevant for magnet-based lift/propulsion testing.  
  GitHub: https://github.com/OpenActuator/DoSA-3D  
  Site/download: https://solenoid.or.kr/openactuator/dosa_open_3d_eng.htm

- **ThinCurr (part of Open FUSION Toolkit)** — 3D thin-wall eddy-current modeling code. Handles inductively-coupled currents in complex 3D conducting structures (coils, magnets, plasmas). Boundary FEM, CAD import, forces/torques. Great for dynamic magnet-current interactions.  
  arXiv/paper + repo: https://arxiv.org/html/2412.14962v2 (GitHub: https://github.com/openfusiontoolkit/OpenFUSIONToolkit)

- **FiQuS / Pancake3D** — Open-source 3D FE quench/magnetodynamic simulator for HTS (high-temp superconductor) pancake coils. Full transient magnetodynamics, thermal coupling, forces in coil stacks. Useful if your designs involve strong electromagnets.  
  Paper: https://iopscience.iop.org/article/10.1088/1361-6668/ad3f83 (CERN/STEAM framework, code open-source via STEAM)

### 3. General-Purpose High-Performance FEM Frameworks (Flexible for Custom Maxwell/Magnetostatics)
Scriptable for any 3D EM problem with magnets/currents.

- **MFEM (LLNL)** — Modular high-performance FEM library (C++ with Python bindings). Strong support for magnetostatics, Maxwell equations, coils, and parallel/GPU scaling. Includes miniapps/examples for Tesla fields and EM. Excellent for large-scale 3D simulations and force extraction.  
  https://mfem.org/

- **NGSolve / Netgen** — High-performance multiphysics FEM (Python-first). Full electromagnetics, magnetostatics, eddy currents. Great geometry/meshing + scripting for custom 3D magnet/coil setups.  
  https://ngsolve.org/

- **Sparselizard** — High-performance C++ FEM library for multiphysics (electric, magnetic, electromagnetic, piezoelectric). hp-adaptive, runs on Linux/Mac/Windows. User-friendly Python-like scripting for 3D fields.  
  https://www.sparselizard.org/

- **MOOSE Electromagnetics Module** — Part of the MOOSE framework. Simulates EM waves, magnetostatics, and multiphysics coupling (thermal/structural). 3D support with time-harmonic/transient solvers.  
  https://mooseframework.inl.gov/modules/electromagnetics/

### 4. FDTD & Time-Domain Solvers (For Dynamic/Three-Phase Currents & Transients)
- **AngoraFDTD** — Open-source 3D FDTD electromagnetic simulator. Full-wave, highly scriptable, good for time-varying currents and wave propagation.  
  https://backmanlab.github.io/AngoraFDTD/

- **GSVIT** — GPU-accelerated 3D FDTD with CUDA. General EM simulations, currents as sources.  
  http://gsvit.net/

### 5. Other Notable Specialized / Niche Tools
- **MicEMD** — Python toolbox (GUI + API) for frequency/time-domain EM forward modeling, inversion, and classification (underground metal detection). 3D staggered FD/FEM.  
  GitHub: https://github.com/UndergroundDetection/MICEMD

- **emg3d / empymod / elfe3D (emsig suite)** — Open-source 3D EM modeling codes (diffusion, layered media, finite-element total-field). Python/Matlab interfaces; great for custom current sources and field output.  
  Site: https://emsig.xyz/ (individual repos linked)

- **Fast Field Solvers suite** (FastHenry, etc.) — Open-source tools for 3D inductance, capacitance, and quasi-static EM of conductors/coils. Permissive licenses, fast and accurate.  
  https://www.fastfieldsolvers.com/

- **Virtual Magnetic Sensor** (or similar Biot-Savart/magnetostatic Python libs) — Simple 3D magnetostatic simulators for magnets + sensors (extensible to coils).  
  Example: https://github.com/mts-public/virtual_magnetic_sensor (and many related GitHub repos)

- **FEMM** (with Lua scripting) — Mature free magnetics/electrostatics simulator (primarily 2D/axisymmetric but extremely powerful for quick validation of magnet + current designs; many users script 3D-like stacks).  
  https://www.femm.info/

- **Bempp** — Python boundary-element method (BEM) library for electrostatics and EM scattering/fields. Lightweight alternative for certain 3D problems.  
  http://bempp.com/

### Quick Recommendations for Your UAP Goal
- **Start with these three new ones** (all Python-friendly, force-capable):  
  1. **PyPEEC** or **Radia** — for rapid magnet-array + coil prototyping and force/lift data.  
  2. **DoSA-3D** — if you want GUI-driven force simulations for actuator-like propulsion configs.  
  3. **MFEM** or **NGSolve** — for scaling up to high-fidelity 3D with arbitrary geometries.

All output raw field/force data you can feed into analysis scripts. Most integrate with ParaView (or Python plotting) for visualization, just like your Blender wish.

**Project integration**: Under `~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/simulation/`, we can immediately create new subfolders like `simulation/pypeec/`, `simulation/radia/`, `simulation/dosa-3d/`, `simulation/mfem/`, etc., each with `software/` + example input scripts/notebooks for your first magnet-current test case. I can generate starter code for any of these (e.g., define 3D magnet array + three-phase coils → compute lift force on grid → CSV output).

Just tell me which 1–3 you want to try first, or if you want me to set up the directory structure + initial files in your workflow (and continue the work-day checklist). We’re building a full simulation toolkit for the winning attempt! Which direction next?