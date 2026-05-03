# Patent US8006939B2 — Over-Wing Traveling-Wave Axial Flow Plasma Accelerator (Lockheed Martin)

## Bibliographic Information

| Field | Details |
|-------|---------|
| **Patent Number** | US8006939B2 |
| **Title** | Over the Wing Traveling Wave Axial Flow Plasma Accelerator |
| **Inventors** | Paul D. McClure, Charles J. Chase |
| **Assignee** | Lockheed Martin Corporation |
| **Filing Date** | November 22, 2006 |
| **Publication Date** | August 30, 2011 |
| **Status** | Expired — Fee Related (adjusted expiration November 18, 2027) |
| **EP Priority** | Also filed 2007 |
| **Classifications** | H05H1/54 (Plasma accelerators); B64C23/005 (Aircraft flow control via electromagnetic means); F03H1/00 (Plasma propulsive thrust); F15D1/12 (Boundary layer control) |
| **Jurisdiction** | United States (US) |

## Abstract

A method to manipulate a fluid flow over a surface is provided. This method may be used to reduce drag, improve the lift to drag (L/D) ratio, attach fluid flow, or reduce flow noise at the surface. This involves flowing a fluid over the surface wherein the fluid contains positively charged ions and electrons. An electric field accelerates ions and electrons in directions parallel to the electric field. A magnetic field at the surface redirects ions and electrons based on their velocity and charge. The magnetic field imparts little force on the relatively heavy and slow moving positive ions but has a significant impact on the relatively fast, light weight electrons. This results in a non-zero net change in the total momentum of the positive ions and electrons allowing thrust to be realized.

## Key Technical Claims

**Claim 1:** An aircraft comprising: immovable flight control surfaces on wing trailing edges; embedded geometric grids of alternating electrodes and magnets; electron beam windows creating plasma in boundary layers; a controller managing voltage to electrodes for pitch, roll, and yaw control.

**Claim 13:** An operational method comprising: providing voltage to electrodes; generating a magnetic field; collecting electrons and discharging them; controlling aircraft attitude through boundary layer manipulation.

## Description / Specification

### Core Innovation: ExB Drift Traveling-Wave Surface Propulsion

The physics is ExB (E-cross-B) drift propulsion applied to a surface rather than a nozzle. When an electric field E and a magnetic field B are applied in perpendicular directions at the wing surface, charged particles experience the Lorentz force:

**F = q(E + v × B)**

The electron drift velocity in crossed fields:

**v_drift = E × B / B²**

This drift is orthogonal to both E and B, and is independent of particle mass. Since electrons drift much faster than ions at the same field values (their lower mass allowing much higher mobility), a net current is established parallel to the surface in the direction of required thrust. The reaction force on the wing surface drives the fluid — and therefore the vehicle — in the opposite direction.

### Traveling-Wave Implementation

The "traveling wave" implementation drives the E and B fields as a phased array that propagates along the wing chord direction, analogous to a traveling-wave linear motor. The wave velocity determines the maximum achievable flow velocity and the efficiency of momentum transfer to the fluid. At subsonic and transonic speeds, the traveling wave can:
- Attach separated boundary layers (dramatically increasing effective lift coefficient)
- Reduce form drag simultaneously
- Provide thrust without any moving mechanical components

The electrode/magnet grid is embedded in the wing surface with no exposed moving parts. The "electrodes can be pulsed at frequencies above those that can be achieved with mechanical components," enabling high-bandwidth flow control.

### Boundary Layer Plasma Generation

Electron beam windows in the wing surface create plasma in the boundary layer by ionizing the airflow with directed electron beams. This provides the conducting medium (free electrons and ions) required for the ExB drift mechanism to produce thrust. The electron beam approach ensures plasma generation can be rapidly started or stopped without mechanical intervention.

### Seamless Surface Architecture

The key architectural benefit: "seamless surfaces without mechanical discontinuities." The absence of:
- Inlet geometry (no internal duct or cavity presenting radar return)
- Compressor stages (no rotating machinery, no acoustic signature)
- Nacelles or external pods (no external protuberances disturbing the flow field)
- Exhaust nozzles (no infrared-bright exhaust plume)

These absences correspond precisely to the observed characteristics of UAPs:
- No acoustic signature from compressors or fans
- No radar return from internal cavity geometry
- No exhaust plume visible in infrared
- Boundary layer attachment at extreme angles of attack (impossible for conventional wings)
- Vectored thrust by wave propagation direction modulation — pitch/yaw/roll without control surfaces

### Performance Capabilities

The 38 patent citations and 42 citing documents indicate significant subsequent development activity. Key performance advantages over conventional propulsion:

1. **No moving parts** — zero acoustic signature from compressors or fans
2. **No inlet geometry** — no radar return from internal cavity
3. **No exhaust plume** — no infrared signature at the aft end
4. **Boundary layer attachment** — laminar flow at angles of attack that would stall conventional wings
5. **Vectored thrust** — wave propagation direction can be modulated for pitch/yaw/roll without mechanical control surfaces

### 8 Drawing Sheets

The patent includes 8 drawing sheets showing:
- Electrode array layouts on wing cross-sections
- Field geometry cross-sections at multiple span stations
- Control circuit architectures for the traveling-wave drive
- Flow visualization diagrams showing momentum transfer

## Technical Classifications

- **H05H1/54** — Plasma accelerators (linear type)
- **B64C23/005** — Aircraft flow control via electromagnetic means
- **F03H1/00** — Producing reactive propulsive thrust using plasma
- **F15D1/12** — Influencing flow of fluids on surfaces by using electric or magnetic means (boundary layer control)

## Strategic Significance

Lockheed Martin Corporation (Skunk Works division) is the developer of the SR-71 Blackbird, U-2, F-117 Nighthawk, F-22 Raptor, and F-35. A patent by Lockheed Martin's researchers on wing-surface plasma propulsion and boundary-layer control — eliminating conventional engine requirements — represents a significant disclosure of technology that the Skunk Works was actively developing in the 2006 timeframe.

The combination of this patent's propulsion mechanism (US8006939B2) with the Russian plasma stealth architecture (RU2565157C1, Track_15) produces a vehicle simultaneously propelled and radar-invisible through its plasma field — matching reported UAP flight characteristics in both kinematics and observability signatures.

## Prior Art / Citations

38 prior art references cited, spanning plasma physics, boundary layer control, and electromagnetic flow management literature from 1964 through 2006.

## Related Patents in This Archive

- **RU2565157C1** (Track_15) — Russian plasma stealth drone: complementary technology (stealth + propulsion together)
- **CN111038740A** (Track_7) — Chinese spherical EM propulsion: similar J × B principle in closed geometry
- **RU2017658C1** (Track_9) — Russian disc vehicle: MHD boundary layer management principle

## Citations

- Google Patents: [US8006939B2](https://patents.google.com/patent/US8006939B2)
- Lockheed Martin Corporation (Skunk Works)
- Hall-effect thruster literature: ExB drift propulsion physics background

*Patent text compiled from Google Patents. Full original at the above URL.*
