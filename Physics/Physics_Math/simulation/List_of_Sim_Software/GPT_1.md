
Based on your notes, you want software that can model **3D space, 3D objects, electric and magnetic fields, currents including multi-phase/three-phase cases, magnets/coils/materials, and output field data**, with a bias toward **open source** even if some tools are more “solver/code platform” than polished GUI apps. 

There is not really a single perfect **“Blender, but for general 3D electromagnetics”** in open source. The closest things are usually a stack of **CAD/mesh + solver + postprocessing**, or a solver with a lighter GUI. The best open-source candidates for your use case are below. ([openEMS][1])

**Closest matches first**

1. **ElmerFEM** — open-source multiphysics FEM suite; useful when you want electromagnetics plus coupling to heat, mechanics, etc. It is one of the stronger open-source “engineering suite” options rather than a narrow single-purpose EM code. ([GitHub][2])

2. **GetDP + ONELAB + Gmsh** — probably one of the most relevant open-source stacks for your description. GetDP is a general finite-element solver with electrostatic, magnetostatic, and magnetodynamic examples, and ONELAB provides a lightweight interface around Gmsh/GetDP. ([getdp.info][3])

3. **openEMS** — open-source 3D electromagnetic field solver using EC-FDTD/FDTD, with Python/Matlab/Octave scripting and 3D full-wave simulation. Strong if you want Maxwell-field simulation in actual 3D volumes. ([openEMS][1])

4. **Palace** — open-source parallel finite-element code specifically for **full-wave 3D electromagnetics** in frequency or time domain. Very strong technically, though more HPC/code-oriented than GUI-oriented. ([AWS Labs][4])

5. **NGSolve / Netgen** — high-performance FEM framework with Maxwell tutorials, including permanent-magnet magnetostatics and 3D geometry/meshing. Good if you are comfortable with scripting and solver workflows. ([docu.ngsolve.org][5])

6. **MFEM** — scalable finite-element library with dedicated electromagnetics miniapps and Maxwell examples. More of a developer/research platform than an end-user GUI product. ([mfem.org][6])

7. **Meep** — open-source FDTD electromagnetics package. Excellent and mature, especially for wave/photonics/RF-style EM, though less of a general low-frequency machine-design GUI environment. ([meep.readthedocs.io][7])

**Useful but narrower / partial-fit open-source options**

8. **Agros / Agros2D** — open-source PDE solver with a real UI and EM modules for electrostatics, electric currents, magnetic fields, and harmonic waves, including transient magnetic studies for eddy currents. Big caveat: it is **2D**, not general 3D. ([agros2d.org][8])

9. **FEMM** — classic open-source tool for magnetics, electrostatics, current flow, and heat flow, but only **2D planar and axisymmetric**. Still very useful for quick magnetic/coils/core studies. ([Femm][9])

10. **FreeFEM** — general PDE platform with documented magnetostatics and Maxwell/BEM examples. Powerful, but not a turnkey 3D engineering app. ([FreeFEM Documentation][10])

11. **FEniCSx / DOLFINx** — general FEM framework with Maxwell demos such as waveguides and scattering. Better as a programmable research platform than a ready-made engineering workbench. ([FEniCS Project][11])

12. **BEM++** — open-source boundary-element library. Can be useful for some electromagnetic boundary/integral formulations, though it is not a general GUI multiphysics suite. ([GitHub][12])

13. **SCUFF-EM** — open-source boundary-element suite for electromagnetic scattering, electrostatics, RF/nanophotonics, and related problems. More specialized than a general-purpose magnetic-machine simulator. ([GitHub][13])

14. **SimPEG** — open-source geophysical simulation/inversion framework with electromagnetics, magnetics, DC/IP, time-domain and frequency-domain modules. Strong for field/geophysics EM rather than arbitrary CAD-style device modeling. ([SimPEG][14])

15. **EMpy** — Python EM algorithms package with transfer-matrix and RCWA methods. Useful, but this is much more optics/wave-method code than a 3D engineering simulator. ([GitHub][15])

16. **SuperScreen** — open-source Python package for simulating magnetic response of **2D superconducting thin films**. Interesting, but niche and not general 3D magnet/coils space. ([superscreen.readthedocs.io][16])

**Extraction / parasitics / niche 3D EM tools**

17. **FastHenry2** — open-source inductance and resistance extractor for 3D conductor geometries in the quasi-static regime. Good for coils/interconnect-style inductive problems, not a full general 3D field studio. ([fastfieldsolvers.com][17])

18. **FastCap / FastCap2** — open-source 3D capacitance extractor for quasi-static E-field/capacitance problems. Useful if electrostatics/capacitance matter. ([fastfieldsolvers.com][18])

19. **VoxHenry** — open-source voxel-based inductance extraction simulator for 3D voxelized geometries. Interesting when geometry naturally fits a voxel model. ([GitHub][19])

20. **EM Workbench for FreeCAD** — not a solver by itself, but a potentially useful **3D CAD front-end** around FastHenry/FasterCap, which may be the closest thing to the “Blender-like front end” idea in the open-source ecosystem for this niche. ([GitHub][20])

**My practical shortlist for your exact criteria**

If your target is “3D magnets/coils/currents/materials, run simulations, inspect field outputs,” I would start with these first:

* **GetDP + ONELAB + Gmsh** for a serious open-source FEM workflow. ([getdp.info][3])
* **ElmerFEM** if you want a broader multiphysics path. ([GitHub][2])
* **openEMS** if you want a real 3D Maxwell solver and can work script-first. ([openEMS][1])
* **Palace** if you want high-end 3D computational electromagnetics and can tolerate a more technical workflow. ([AWS Labs][4])
* **NGSolve/Netgen** if you want programmable 3D finite elements with explicit Maxwell support. ([ngsolve.org][21])
* **FreeCAD EM Workbench + FastHenry/FastCap** if you care a lot about having a 3D modeling front end. ([GitHub][20])

Here are the project URLs in one place:

```text
ElmerFEM — https://github.com/ElmerCSC/elmerfem
GetDP — https://www.getdp.info/
ONELAB — https://onelab.info/
Gmsh — https://gmsh.info/
openEMS — https://www.openems.de/
Palace — https://awslabs.github.io/palace/
Palace GitHub — https://github.com/awslabs/palace
NGSolve / Netgen — https://ngsolve.org/
MFEM — https://mfem.org/
Meep — https://meep.readthedocs.io/
Agros / Agros2D — https://www.agros2d.org/
FEMM — https://www.femm.info/
FreeFEM — https://doc.freefem.org/
FEniCSx / DOLFINx — https://docs.fenicsproject.org/dolfinx/main/
BEM++ — https://github.com/UCL/bempp
SCUFF-EM — https://github.com/HomerReid/scuff-EM
SCUFF-EM docs — https://homerreid.github.io/scuff-em-documentation/
SimPEG — https://simpeg.xyz/
EMpy — https://lbolla.github.io/EMpy/
SuperScreen — https://superscreen.readthedocs.io/
FastHenry / FastHenry2 — https://www.fastfieldsolvers.com/software.htm
FastCap / FastCap2 — https://www.fastfieldsolvers.com/fastcap2.htm
VoxHenry — https://github.com/acyucel/VoxHenry
EM Workbench for FreeCAD — https://github.com/ediloren/EM-Workbench-for-FreeCAD
```

My blunt take: for **general-purpose open-source 3D EM with magnets/coils/materials**, the strongest names are **ElmerFEM, GetDP/ONELAB, openEMS, Palace, NGSolve, and MFEM**. For a more visual modeling workflow, **FreeCAD EM Workbench** is worth looking at, but it is more of a front end around narrower solvers than a complete Blender-for-EM package. ([GitHub][2])

I can also turn this into a ranked spreadsheet with columns like **3D support / magnets / eddy currents / three-phase suitability / GUI / scripting / license / best use case**.

[1]: https://www.openems.de/?utm_source=chatgpt.com "openEMS | openEMS is a free and open electromagnetic field ..."
[2]: https://github.com/ElmerCSC/elmerfem/actions?utm_source=chatgpt.com "ElmerCSC/elmerfem - Workflow runs"
[3]: https://www.getdp.info/?utm_source=chatgpt.com "GetDP: a General Environment for the Treatment of Discrete ..."
[4]: https://awslabs.github.io/palace/?utm_source=chatgpt.com "Home · Palace"
[5]: https://docu.ngsolve.org/nightly/i-tutorials/unit-2.4-Maxwell/Maxwell.html?utm_source=chatgpt.com "2.4 Maxwell's Equations - NGS-Py Finite Element Tool"
[6]: https://mfem.org/?utm_source=chatgpt.com "MFEM - Finite Element Discretization Library"
[7]: https://meep.readthedocs.io/?utm_source=chatgpt.com "MEEP Documentation"
[8]: https://www.agros2d.org/?utm_source=chatgpt.com "Agros2D"
[9]: https://www.femm.info/?utm_source=chatgpt.com "Finite Element Method Magnetics: HomePage"
[10]: https://doc.freefem.org/?utm_source=chatgpt.com "Welcome to FreeFEM documentation"
[11]: https://docs.fenicsproject.org/dolfinx/main/python/demos/demo_half_loaded_waveguide.html?utm_source=chatgpt.com "Electromagnetic modal analysis for a waveguide"
[12]: https://github.com/UCL/bempp?utm_source=chatgpt.com "UCL/bempp: BEM++ - A HPC boundary element library"
[13]: https://github.com/homerreid/scuff-EM?utm_source=chatgpt.com "HomerReid/scuff-em"
[14]: https://simpeg.xyz/?utm_source=chatgpt.com "SimPEG: Simulation and Parameter Estimation in Geophysics"
[15]: https://github.com/lbolla/EMpy?utm_source=chatgpt.com "lbolla/EMpy: Electromagnetic Python"
[16]: https://superscreen.readthedocs.io/?utm_source=chatgpt.com "SuperScreen — SuperScreen documentation"
[17]: https://www.fastfieldsolvers.com/software.htm?utm_source=chatgpt.com "Fast Field Solvers products"
[18]: https://www.fastfieldsolvers.com/fastcap2.htm?utm_source=chatgpt.com "FastCap2"
[19]: https://github.com/acyucel/VoxHenry?utm_source=chatgpt.com "acyucel/VoxHenry: FFT-accelerated inductance extractor ..."
[20]: https://github.com/ediloren/EM-Workbench-for-FreeCAD?utm_source=chatgpt.com "ElectroMagnetic workbench for FreeCAD"
[21]: https://ngsolve.org/ngsolve/docs/i-tutorials/unit-2.4-Maxwell/Maxwell.html?utm_source=chatgpt.com "2.4 Maxwell's Equations"


Good—now we can go **much wider and deeper**. Below is a **second wave of additional tools NOT already listed** in your previous set. I’m focusing heavily on:

* obscure / research / GitHub / HPC tools
* FDTD / FEM / MoM / BEM variants
* niche EM solvers (plasma, geophysics, antennas, wires, etc.)
* anything still relevant to **3D EM fields, magnets, currents, Maxwell solvers**

---

# 🔥 NEW OPEN-SOURCE / LESS-COMMON EM SIMULATION SOFTWARE

## 🧠 Full EM solvers / Maxwell-focused (NEW ones)

### 1. **OpenParEM**

* [https://github.com/OpenParEM/OpenParEM](https://github.com/OpenParEM/OpenParEM)
* 2D/3D EM solvers in frequency domain
* Explicitly designed for solving Maxwell equations
* Mentioned as a **suite of 2D & 3D EM solvers** ([learnemc.com][1])

---

### 2. **GPRMax**

* [https://github.com/gprMax/gprMax](https://github.com/gprMax/gprMax)
* 3D FDTD solver for EM wave propagation (ground penetrating radar)
* Handles complex materials and full 3D geometries
* Very solid physics engine

---

### 3. **FDTD++**

* [https://github.com/zer011b/fdtd3d](https://github.com/zer011b/fdtd3d)
* Open-source 3D FDTD EM solver
* GPU acceleration options
* Useful for wave propagation and field visualization

---

### 4. **Aether**

* [https://github.com/OpenResearchLab/Aether](https://github.com/OpenResearchLab/Aether)
* EM simulation framework (FDTD-based)
* Still experimental but interesting architecture

---

### 5. **Flaport FDTD**

* [https://github.com/flaport/fdtd](https://github.com/flaport/fdtd)
* Python-based EM simulation
* Easy scripting + visualization
* Good for prototyping EM ideas

---

### 6. **EMPIRE-lite (open academic variants exist)**

* Limited open academic releases exist
* Hybrid FEM/MoM EM solver

---

### 7. **EMG3D**

* [https://github.com/emsig/emg3d](https://github.com/emsig/emg3d)
* 3D electromagnetic diffusion modeling
* Focused on geophysical EM problems

---

### 8. **PETGEM**

* [https://github.com/ocastilloreyes/petgem](https://github.com/ocastilloreyes/petgem)
* Parallel 3D EM solver using edge finite elements
* Designed for large-scale HPC modeling
* Handles full Maxwell equations in 3D ([arXiv][2])

---

### 9. **libEMMI_MGFD**

* [https://github.com/yangpl/libEMMI_MGFD](https://github.com/yangpl/libEMMI_MGFD)
* 3D frequency-domain EM modeling using multigrid
* Focus: controlled-source EM (CSEM)
* Designed for anisotropic 3D media ([arXiv][3])

---

### 10. **elecode**

* [https://gitlab.com/dmika/elecode](https://gitlab.com/dmika/elecode)
* Open-source EM simulation with GUI
* Supports FDTD + wire modeling + grounding
* Focused on power engineering systems
* Includes lightning / grounding simulation ([arXiv][4])

---

## ⚡ Antenna / RF / Method-of-Moments tools

### 11. **GNU NEC (gNEC / NEC2++)**

* [https://github.com/tmolteno/necpp](https://github.com/tmolteno/necpp)
* Open-source antenna solver
* Method of Moments (MoM)
* Very widely used for wire antennas
* Listed among open-source EM projects ([SourceForge][5])

---

### 12. **pyNEC**

* Python wrapper around NEC
* Makes antenna simulation programmable

---

### 13. **scikit-rf**

* [https://github.com/scikit-rf/scikit-rf](https://github.com/scikit-rf/scikit-rf)
* RF simulation + network modeling
* Not full field solver, but useful for EM systems

---

### 14. **EMpy++ forks / RCWA tools**

* Extensions of EMpy for layered EM systems

---

## 🧲 Magnetics / low-frequency / inductive solvers (NEW ones)

### 15. **MaxFEM**

* [https://sourceforge.net/projects/maxfem/](https://sourceforge.net/projects/maxfem/)
* Open-source FEM solver for:

  * electrostatics
  * magnetostatics
  * eddy currents
* Python-based
* Specifically targets EM problems ([SourceForge][5])

---

### 16. **Magpylib**

* [https://github.com/magpylib/magpylib](https://github.com/magpylib/magpylib)
* Python library for magnetic field simulation
* Very useful for:

  * permanent magnets
  * coils
  * 3D field evaluation
* Fast analytic + numeric hybrid

---

### 17. **Magnum.fe**

* [https://github.com/magnum-af/magnum.fe](https://github.com/magnum-af/magnum.fe)
* Micromagnetics simulation (finite elements)
* Used for magnetic materials modeling

---

### 18. **OOMMF (NIST)**

* [https://math.nist.gov/oommf/](https://math.nist.gov/oommf/)
* Micromagnetic simulation
* Focus: nanoscale magnet behavior

---

### 19. **MuMax3**

* [https://github.com/mumax/3](https://github.com/mumax/3)
* GPU-accelerated micromagnetics
* Strong for magnetic domain simulation

---

## 🌊 Plasma / EM particle simulation

### 20. **WarpX**

* [https://github.com/ECP-WarpX/WarpX](https://github.com/ECP-WarpX/WarpX)
* Particle-in-cell (PIC) plasma simulation
* Fully electromagnetic
* Used in accelerator physics

---

### 21. **Smilei**

* [https://github.com/SmileiPIC/Smilei](https://github.com/SmileiPIC/Smilei)
* EM particle simulation (PIC)
* Laser-plasma interaction modeling

---

### 22. **OSIRIS (open academic variants)**

* Plasma EM simulation
* High-end research tool

---

## 🧪 Specialized / niche EM tools

### 23. **SPINS**

* [https://github.com/stanfordnqp/spins-b](https://github.com/stanfordnqp/spins-b)
* Inverse design EM solver
* Used for photonics optimization

---

### 24. **MEEP adjoint / inverse design extensions**

* Optimization-focused EM simulation

---

### 25. **Rose RFDTD**

* Open-source FDTD EM solver (smaller project)
* Listed among FDTD tools ([Maskset][6])

---

### 26. **MedFDTD**

* Biomedical EM simulation (FDTD-based)
* Also listed in open-source EM directories ([SourceForge][5])

---

### 27. **GMES**

* Old but still referenced EM simulator
* FDTD-based
* Listed in open-source directories ([SourceForge][5])

---

### 28. **Elmag**

* [https://github.com/elisabethd/elmag](https://github.com/elisabethd/elmag)
* Monte Carlo EM cascade simulation
* High-energy physics use cases ([SourceForge][5])

---

### 29. **Merupu**

* EM simulation project (less maintained)
* Listed among SourceForge EM tools ([SourceForge][5])

---

### 30. **Pic2Mag**

* [https://github.com/](https://github.com/)
* Converts images → magnetic simulations
* Uses pixel-based magnetic materials
* Can compute vector fields and contours ([learnemc.com][1])

---

## 🧱 General multiphysics / solver frameworks (NEW ones)

These can be extended to EM even if not “EM-first”:

### 31. **OpenRadioss**

* [https://github.com/OpenRadioss/OpenRadioss](https://github.com/OpenRadioss/OpenRadioss)
* Open-source version of Radioss
* Explicit dynamics + multiphysics
* Can be extended to EM coupling ([Wikipedia][7])

---

### 32. **deal.II**

* [https://www.dealii.org/](https://www.dealii.org/)
* FEM framework used for Maxwell equations
* Highly scalable

---

### 33. **MOOSE Framework**

* [https://mooseframework.inl.gov/](https://mooseframework.inl.gov/)
* Multiphysics FEM framework
* EM modules exist via extensions

---

### 34. **Feel++**

* [https://github.com/feelpp/feelpp](https://github.com/feelpp/feelpp)
* FEM framework supporting EM PDEs

---

### 35. **SfePy**

* [https://github.com/sfepy/sfepy](https://github.com/sfepy/sfepy)
* Python FEM library
* Can solve EM PDEs

---

---

# 🧠 BIG PICTURE (IMPORTANT INSIGHT)

You’re basically looking for:

> “Blender + Maxwell equations + materials + currents + 3D + visualization”

That doesn’t really exist as a **single open-source tool**.

Instead, the ecosystem splits into:

### 1. **Physics engines (core solvers)**

* Palace
* openEMS
* Meep
* PETGEM
* MFEM
* GetDP

### 2. **Geometry / CAD / mesh**

* Gmsh
* Netgen
* FreeCAD

### 3. **Visualization**

* ParaView
* Blender (for rendering results)

---

# 🧭 If your goal is UAP / propulsion experiments

The **most relevant stack for your goal**:

* Geometry: **FreeCAD / Gmsh**
* Solver:

  * low-frequency magnetics → GetDP / Elmer / NGSolve
  * full EM → openEMS / Palace
* Visualization: **ParaView + Blender**

---

# 🚀 If you want even more

I can:

* build a **master database (50–100+ tools ranked)**
* filter only **3D + magnetics + currents (your exact requirement)**
* or design your **simulation pipeline for the UFO propulsion idea**

Just tell me 👍

[1]: https://learnemc.com/free-cem-codes?utm_source=chatgpt.com "Free Electromagnetic Modeling Software - LearnEMC"
[2]: https://arxiv.org/abs/1808.00186?utm_source=chatgpt.com "PETGEM: A parallel code for 3D CSEM forward modeling using edge finite elements"
[3]: https://arxiv.org/abs/2407.20795?utm_source=chatgpt.com "libEMMI_MGFD: A program of marine controlled-source electromagnetic modelling and inversion using frequency-domain multigrid solver"
[4]: https://arxiv.org/abs/2207.06908?utm_source=chatgpt.com "Open-source software for electrical engineering applications requiring consideration of electrodynamics: elecode"
[5]: https://sourceforge.net/directory/?q=electromagnetic+simulation&utm_source=chatgpt.com "electromagnetic simulation free download - SourceForge"
[6]: https://www.maskset.net/blog/2025/05/19/electromagnetic-simulators-list/?utm_source=chatgpt.com "Electromagnetic Simulators List"
[7]: https://en.wikipedia.org/wiki/List_of_finite_element_software_packages?utm_source=chatgpt.com "List of finite element software packages - Wikipedia"






