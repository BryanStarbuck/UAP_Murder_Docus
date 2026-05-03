# United States Patent US8006939B2: Over-Wing Traveling-Wave Axial Flow Plasma Accelerator (Lockheed Martin)

**Patent Number:** US8006939B2
**Title:** Over the Wing Traveling Wave Axial Flow Plasma Accelerator
**Inventors:** Paul D. McClure, Charles J. Chase
**Assignee:** Lockheed Martin Corp
**Filed:** November 22, 2006; Granted August 30, 2011; EP priority also filed 2007
**Status:** Expired - Fee Related (adjusted expiration 2027-11-18)
**Jurisdiction:** United States (US)
**Source:** [patents.google.com/patent/US8006939B2](https://patents.google.com/patent/US8006939B2)
**Track Directory (Physics_Math):** 1_Track/ — ExB drift traveling-wave surface plasma accelerator; MHD body force propulsion family; directly relevant to Attempt 1 plasma-driven lift research

**Image files:**
- `patents_intl/tweets/raw_download/1974164398903304616_1.jpg` (Google Patents abstract page)
- `patents_intl/tweets/raw_download/1974164398903304616_2.jpg` and `_3.jpg`

## Abstract

"A method to manipulate a fluid flow over a surface is provided. This method may be used to reduce drag, improve the lift to drag (L/D) ratio, attach fluid flow, or reduce flow noise at the surface. This involves flowing a fluid over the surface wherein the fluid contains positively charged ions and electrons. An electric field accelerates ions and electrons in directions parallel to the electric field. A magnetic field at the surface redirects ions and electrons based on their velocity and charge. The magnetic field imparts little force on the relatively heavy and slow moving positive ions but has a significant impact on the relatively fast, light weight electrons. This results in a non-zero net change in the total momentum of the positive ions and electrons allowing thrust to be realized."

## Physics Mechanism: ExB Drift Traveling-Wave Surface Propulsion

The physics is ExB (E-cross-B) drift propulsion — the same mechanism used in Hall-effect ion thrusters but applied to a surface rather than a nozzle. When an electric field E and a magnetic field B are applied in perpendicular directions at the wing surface, charged particles experience the Lorentz force:

F = q(E + v × B)

The electron drift velocity in crossed fields is:

v_drift = E × B/B²

This drift is orthogonal to both fields and independent of particle mass. Since electrons drift much faster than ions at the same field values, a net current is established parallel to the surface in the direction of required thrust. The reaction force on the wing surface drives the fluid — and therefore the vehicle — in the opposite direction.

## Traveling-Wave Implementation

The "traveling wave" implementation drives the E and B fields as a phased array that propagates along the wing chord direction, analogous to a traveling-wave linear motor. The wave velocity determines the maximum achievable flow velocity and the efficiency of momentum transfer to the fluid. At subsonic and transonic speeds, the traveling wave can attach separated boundary layers, dramatically increasing effective lift coefficient and reducing form drag simultaneously.

Lockheed Martin's application of this principle to over-wing propulsion eliminates engine nacelles, inlet geometry, and compressor stages entirely. The patent's 8 drawing sheets show electrode array layouts, field geometry cross-sections, and control circuit architectures for implementing the traveling-wave drive on a wing surface.

## Capabilities and UAP Relevance

The 38 patent citations and 42 citing documents indicate significant subsequent development activity. The combination of the over-wing plasma accelerator (US8006939B2) with the RU2565157C1 plasma stealth architecture produces a vehicle that is simultaneously propelled and made radar-invisible by its plasma field — with no moving parts, no conventional engine, and no exhaust plume. This corresponds precisely to observed UAP flight characteristics.

Key performance advantages over conventional propulsion:
- No moving parts — no acoustic signature from compressors or fans
- No inlet geometry — no radar return from internal cavity
- No exhaust plume — no infrared signature at the aft end
- Boundary layer attachment — laminar flow at angles of attack that would stall conventional wings
- Vectored thrust — wave propagation direction can be modulated for pitch/yaw/roll without control surfaces

## Sources

- [US8006939B2 on Google Patents](https://patents.google.com/patent/US8006939B2)
- Lockheed Martin Corporation, Skunk Works
- Hall-effect thruster literature — ExB drift propulsion physics background

*This information was compiled from Break_thrus.mdx staging file.*
