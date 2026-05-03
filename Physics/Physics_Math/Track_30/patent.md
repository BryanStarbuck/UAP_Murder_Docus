# Patent CN118811118A — Concentric Circle Type Lunar Surface Electromagnetic Launch System (CASIC)

## Bibliographic Information

| Field | Details |
|-------|---------|
| **Patent Number** | CN118811118A |
| **Title** | Concentric Circle Type Lunar Surface Electromagnetic Emission System (同心圆式月面电磁发射系统) |
| **Inventors** | Zhang Yanqing (张艳清), Dong Hao (董浩), Zhai Maochun (翟茂春), Bo Jinlong (薄靖龙), Zou Ling (邹玲), Gong Jun (龚珺), Zhou Changbin (周长斌), Pan Nianqiao (潘念侨), Cui Xiao (崔孝), Hou Zihao (侯自豪), Li Ping (李萍) — 11 inventors |
| **Assignee** | China Aerospace Science and Industry Corporation (CASIC) — Feihang Technology Research Institute / Haiying Mechanical and Electronic Research Institute (中国航天科工集团有限公司飞航技术研究院/中国航天科工集团有限公司海鹰机械电子研究院) |
| **Filing Date** | April 20, 2023 |
| **Publication Date** | October 22, 2024 |
| **Status** | Pending |
| **Classifications** | B64G1/002 — Launch systems for cosmonautic vehicles; B64G1/00 — Cosmonautic vehicles |
| **Jurisdiction** | China (CN) |

## Abstract

The invention discloses a concentric circle type lunar surface electromagnetic emission system, which is arranged on a flat lunar surface and has a preset included angle with the lunar surface, and comprises an electromagnetic propulsion device, an electric suspension device, an energy storage device, a current conversion device, a rotary arm supporting device and an emission control device. The rotary arm supporting device is connected with the electromagnetic propulsion device and the electric suspension device, the rotary arm rotates around the rotating shaft, a spacecraft is arranged on the rotary arm, the electromagnetic propulsion device generates propulsion force to drive the rotary arm to accelerate and rotate, acceleration on the spacecraft is realized, the electric suspension device is used for generating suspension force and guiding force, the guiding force is used for balancing centrifugal force when the rotary arm rotates, the suspension force is used for balancing gravity of the rotary arm, and when the spacecraft is accelerated to a preset speed, the spacecraft is separated from the rotary arm and enters an earth orbit in a preset mode.

## Claims (10 Total)

**Claim 1 (Independent):** A concentric circle type lunar surface electromagnetic emission system arranged on a flat lunar surface with a preset included angle, comprising: an electromagnetic propulsion device; an electric suspension device; an energy storage device; a current conversion device; a rotary arm supporting device; and an emission control device; wherein the rotary arm supporting device is connected with the electromagnetic propulsion device and the electric suspension device, the rotary arm rotates around the rotating shaft, a spacecraft is arranged on the rotary arm, the electromagnetic propulsion device generates propulsion force to drive the rotary arm to accelerate and rotate, acceleration on the spacecraft is realized, the electric suspension device generates suspension force and guiding force, the guiding force balances centrifugal force when the rotary arm rotates, the suspension force balances gravity of the rotary arm, and when the spacecraft is accelerated to a preset speed, the spacecraft is separated from the rotary arm and enters the desired orbit.

**Claim 2:** System of claim 1, further including an emission assurance device comprising diagnostic and detection units plus equipment maintenance capabilities.

**Claim 3:** The electromagnetic propulsion device functions as a unilateral superconducting linear synchronous motor with oblong coil windings and circular ring outline stator.

**Claim 4:** The motor rotor is a superconducting magnet with coil windings; direct current excitation creates an excitation magnetic field while alternating current in the stator generates a traveling wave magnetic field.

**Claim 5:** The electric suspension device comprises a levitation stator and mover; the stator includes left and right components as solid metal conductor structure without coil windings.

**Claim 6:** The left and right stators contain concentric circular structures with the rotating shaft located at the center of the concentric circles.

**Claim 7:** The levitation mover and motor rotor share the same superconducting magnet; the generated magnetic field induces eddy currents in the solid conductor stator producing repulsive levitation forces.

**Claim 8:** The superconducting magnet includes a single first magnet positioned at the second end of the rotary arm.

**Claim 9:** The superconducting magnet comprises two magnets (first and second) with alternate positioning options at the arm ends.

**Claim 10:** The superconducting magnet contains three magnets distributed across first end, second end, and symmetric arm position.

## Description / Specification

### System Architecture: Six Primary Components

| Component | Function |
|-----------|---------|
| Electromagnetic propulsion device | Unilateral superconducting linear synchronous motor; drives rotary arm rotation |
| Electric suspension device | Levitation stator (solid metal conductor) + mover (superconducting magnet); provides suspension force (counteracts gravity) and guiding force (counteracts centrifugal loading) |
| Energy storage device | Stores electrical energy for the accelerator sequence (likely flywheel or superconducting energy storage) |
| Current conversion device | Converts stored energy to the required AC waveform for the traveling-wave motor stator |
| Rotary arm supporting device | Structural arm rotating about central shaft; carries spacecraft at tip |
| Emission control device | Sequencing, timing, and separation control |

### Launch Architecture: Centrifugal Rotary Arm

The system is a centrifugal launch accelerator: a long rotary arm anchored at the lunar surface rotates in an inclined plane (preset angle with lunar surface), progressively accelerating the spacecraft at the arm tip through centripetal acceleration. When the tip speed reaches the desired orbital insertion velocity, the spacecraft releases and follows a guided trajectory.

**Geometry:** Circular (concentric circle track) rather than linear — more compact than a linear electromagnetic launch rail, allowing the accelerator radius to be chosen for the available land area.

### Physics: Centrifugal Launch Kinematics

For arm length R and final tip speed v, the centripetal acceleration experienced by the payload:

**a_c = v²/R**

For lunar escape velocity v = 2.38 km/s and arm length R = 500 m:

**a_c = (2.38×10³)²/500 = 11,337 m/s² ≈ 1,157 g**

Survivable for unmanned cargo, not for humans. For human-survivable loading (a_c < 10 g):

**R_required = v²/a_c = (2.38×10³)²/(10×9.8) ≈ 57.8 km**

The CASIC design targets unmanned cargo launches; the 11 inventors and production-engineering level suggests arm lengths of tens to hundreds of meters for cargo delivery.

### Electric Suspension System Analysis

The electric suspension device generates two distinct forces simultaneously:

**1. Suspension force (counteracting rotary arm weight):**
Lunar gravity: g_moon = 1.62 m/s²

For rotary arm mass M_arm:
F_suspension = M_arm × g_moon (vertical)

**2. Guiding force (counteracting centrifugal loading):**

The centrifugal force on the rotary arm during rotation (distributed load):

**F_centrifugal(r) = ṁ_arm × ω² × r = ṁ_arm × v²_tip × r/R²**

For uniform arm of total mass M_arm and length R, total centrifugal tension force at the root:

**F_total = M_arm × v²_tip / (2R)**

At tip speed v_tip = 2 km/s and R = 500 m for M_arm = 1000 kg:

F_total = 1000 × (2000)²/(2×500) = 4×10⁶ N = 4 MN

The electric suspension (Meissner-effect or eddy-current repulsion) must counteract this tension in the arm structure. The superconducting magnet-conductor interaction (Claims 5–7) provides the requisite repulsive force without mechanical contact, eliminating friction and wear.

### Superconducting Linear Synchronous Motor (Claims 3–4)

The electromagnetic propulsion device is specifically designed as a **unilateral superconducting linear synchronous motor**:

- **Stator:** Circular ring outline on the lunar surface with oblong coil windings; the traveling AC waveform produces a circumferentially-traveling magnetic field
- **Rotor (mover):** Superconducting magnet on the rotary arm; DC current excitation creates a static excitation field; the stator's traveling wave field interacts with this excitation field to produce the linear (tangential) driving force

The synchronous motor principle: the rotor is "locked" to the traveling wave velocity. As the wave speed increases (motor frequency increases), the arm tip speed increases proportionally. The energy storage device supplies the increasing energy demand as the arm accelerates.

### Eddy-Current Repulsion Levitation (Claims 5–7)

The levitation mover and motor rotor share the same superconducting magnet (Claim 7). The levitation stators are solid metal conductors (left and right components, no coil windings) — typically aluminum or copper. When the superconducting magnet moves relative to the solid conductor stator:

1. The changing magnetic flux induces eddy currents in the conductor (Lenz's law)
2. The eddy currents create a magnetic field opposing the inducing field
3. The net force is repulsive — the rotor/mover is repelled from the stator

This is the EDS (Electrodynamic Suspension) principle used in maglev trains (e.g., Japan's SCMaglev). The key property: eddy-current repulsion requires relative motion (the conductor must be "cutting" field lines). At rest, there is no levitation force. This means the system must reach a minimum arm rotation speed before stable levitation is achieved.

### Strategic Significance: CASIC and Cislunar Operations

**CASIC (China Aerospace Science and Industry Corporation)** is China's primary strategic missile and aerospace defense corporation — developer of:
- DF series intercontinental ballistic missiles
- Land-attack cruise missiles (various)
- Anti-satellite weapons systems
- Hypersonic glide vehicles

A lunar electromagnetic launch system filed by CASIC in 2023 with 11 inventors — representing two CASIC research institutes — is a production-engineering level project, not a university research exercise. The 2023 filing date and October 2024 publication indicates:

1. CASIC is actively planning concrete lunar surface operations
2. The technical readiness level is sufficient for patent filing (implying simulation and preliminary design are complete)
3. China's cislunar logistics infrastructure planning is at a stage where IP protection for launch systems is warranted

The concentric circle (rotary arm) architecture is likely chosen for compactness — a rotary arm with R = 100–500 m fits within a crater rim or can be constructed on a flat mare surface, versus a linear rail hundreds of kilometers long. The superconducting components (motor and levitation) minimize moving parts wear in the lunar vacuum environment where maintenance is extremely costly.

## Technical Classifications

- **B64G1/002** — Launch systems for cosmonautic vehicles
- **B64G1/00** — Cosmonautic vehicles (general)

## Prior Art Keywords

Stator, magnet, rotary arm, force, spacecraft, levitation, energy storage, acceleration, electromagnetic launch

## Citations

- Google Patents: [CN118811118A](https://patents.google.com/patent/CN118811118A)
- China Aerospace Science and Industry Corporation (CASIC) — Feihang Technology Research Institute
- Lunar escape velocity: 2.38 km/s (standard IAU value)
- Lunar surface gravity: g_moon = 1.62 m/s²
- Japan SCMaglev — electrodynamic suspension principle reference

*Patent text compiled from Google Patents. Machine-translated from Chinese; original Chinese text at the above URL.*
