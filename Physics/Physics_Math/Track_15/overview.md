# Russia Patent RU2565157C1: Plasma Stealth Drone (MKB Raduga / Russian Ministry of Industry)

**Patent Number:** RU2565157C1
**Title:** Drone (Plasma Stealth Configuration)
**Assignee:** Ministry of Industry and Trade of the Russian Federation (Министерство Промышленности и Торговли Российской Федерации); addressed to MKB Raduga
**Filed:** April 30, 2014; Granted October 20, 2015
**Jurisdiction:** Russia (foreign)
**Source:** [patents.google.com/patent/RU2565157C1/en](https://patents.google.com/patent/RU2565157C1/en)
**Track Directory (Physics_Math):** Track_2/ — plasma gas injection and electrostatic ionization for RCS reduction; closest to Track_2 (electrostatic/plasma control); plasma-based stealth via electron-density management

**Image files:**
- `patents_intl/tweets/raw_download/1972434327964381436_1.jpg` (Google Patents abstract page)
- `patents_intl/tweets/raw_download/1972434327964381436_2.jpg` and `_3.jpg`

## Abstract

"FIELD: aviation. SUBSTANCE: drone contains the housing with independent source of plasma-forming mix of gases, a tight radiotransparent front fairing with lines with reusable and electrically operated shutters for supply of plasma-forming mix of gases into a cavity and dumping, a control system with a homing head with a radar antenna, a high voltage power source with a starter, electrodes, a gas flow limiting device in the form of a pressure reducer, electric connections. EFFECT: invention allows to reduce a radar visibility and provide sufficient degree of tightness of the drone front fairing."

## Physics Mechanism: Plasma Radar Absorption

The key claim is radar-signature reduction via plasma: a plasma-forming gas mixture is injected into a cavity surrounding the front fairing, and high voltage electrodes ionize the gas to create a plasma shell. The plasma absorbs radar frequencies because free electron collisions convert microwave energy to heat rather than reflecting it.

The degree of radar absorption depends on plasma density (n_e, electrons/m³) and collision frequency (ν_c). For complete absorption of X-band (10 GHz) radar, the plasma frequency must exceed the radar frequency:

ω_p = √(n_e e²/m_e ε₀) > ω_radar

This requires n_e > ~1.2 × 10¹⁸ m⁻³, achievable with a glow discharge at modest applied voltage in a low-pressure gas.

## Dual-Use Architecture: Stealth + Operational Transparency

The front fairing is radiotransparent (allowing the drone's own radar homing head to function) while the plasma is confined to the outer cavity — a dual-use architecture where the plasma provides stealth against external radar while leaving the drone's seeker fully operational. The reusable, electrically-operated shutters controlling gas injection mean the plasma can be switched on only when radar stealth is required (near target), and off when not needed (during transit, to conserve plasma gas supply).

This on-demand plasma stealth activation is architecturally superior to passive stealth materials (RAM coatings, shape optimization) which are always active. Plasma stealth allows the vehicle to operate with minimal signatures when required and without the structural constraints of geometric shaping optimized for stealth.

## Assignee: MKB Raduga and Operational Context

MKB Raduga (address on patent) is the developer of the Kh-22, Kh-55, and Kh-101/102 cruise missile families for the Russian Air Force. A plasma stealth drone filed through the Ministry of Industry and Trade with MKB Raduga's address is almost certainly a classified cruise missile or loitering munition variant with reduced radar cross-section.

The 2014 filing date is contemporaneous with the development period of the Kh-101/102 stealth cruise missile (declared operational 2016), and the technical approach matches what would be needed to achieve the reported <0.01 m² RCS of that system.

## Connection to US8006939B2 (Lockheed Plasma Accelerator)

The combination of the Lockheed over-wing plasma accelerator (US8006939B2) with this plasma stealth architecture produces a vehicle that is simultaneously propelled and made radar-invisible by its plasma field — with no moving parts, no conventional engine, and no exhaust plume. This corresponds precisely to observed UAP flight characteristics: no acoustic signature, no radar return, no visible exhaust, instantaneous maneuver capability.

## Sources

- [RU2565157C1 on Google Patents](https://patents.google.com/patent/RU2565157C1/en)
- Kh-101/102 cruise missile development, MKB Raduga, operational 2016

*This information was compiled from Break_thrus.mdx staging file.*
