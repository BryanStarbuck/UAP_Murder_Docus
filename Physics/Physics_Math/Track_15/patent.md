# Patent RU2565157C1 — Drone with Plasma Stealth System (MKB Raduga / Russian Ministry of Industry)

## Bibliographic Information

| Field | Details |
|-------|---------|
| **Patent Number** | RU2565157C1 |
| **Title** | Drone (Беспилотный летательный аппарат — UAV with plasma radar signature reduction) |
| **Inventors** | Alexandra Sergeevna Mitsyna (Александра Сергеевна Мицына), Anatoly Petrovich Mishchenko (Анатолий Петрович Мищенко), Sergei Pavlovich Polunin (Сергей Павлович Полунин) |
| **Assignee** | Russian Federation, represented by the Ministry of Industry and Trade (Министерство Промышленности и Торговли Российской Федерации); addressed to MKB Raduga |
| **Filing Date** | April 30, 2014 |
| **Publication Date** | October 20, 2015 |
| **Jurisdiction** | Russia (RU) |

## Abstract

The invention addresses unmanned aerial vehicles (UAVs) equipped to absorb radar-emitted waves. The drone contains a sealed, radio-transparent front fairing housing a plasma-forming gas mixture source. Key components include reusable and electrically operated shutters for supply of plasma-forming gas mixture, and a control system with homing capability. The invention "reduces radar visibility and provides sufficient tightness" while lowering manufacturing complexity and operational costs.

## Claims (3 Total)

**Claim 1:** A drone comprising: a housing with an autonomous source of plasma-forming gas mixture in communication with the front fairing cavity through a gas flow limiting device; a sealed radio-transparent front fairing; a homing head with radar antenna located within the fairing cavity; a high-voltage power source with ignition device; electrodes positioned within the fairing cavity; a supply line with reusable electrically controlled shutter; and a discharge line with reusable electrically controlled shutter; wherein the autonomous gas source is configured to maintain stable plasma-forming gas parameters in the fairing cavity during flight operations.

**Claim 2:** The drone of claim 1, wherein the discharge-line shut-off device is reusable, electrically controlled, and connected to the control system.

**Claim 3:** The drone of claim 1, wherein the gas-limiting device functions in the form of a pressure reducer.

## Description / Specification

### Technical Problem

Prior designs required extreme fairing tightness to maintain plasma-forming gas parameters, significantly increasing manufacturing and maintenance costs. Small leaks degraded plasma characteristics during storage and transport, requiring the plasma system to be charged immediately before flight.

### Technical Solution

The patent introduces an autonomous gas source (pressurized cylinder with charging capability) connected through a pressure-reducing device to the fairing cavity. This allows the system to compensate for minor leaks automatically, maintaining stable plasma characteristics throughout the mission. The reusable, electrically-operated shutters allow the plasma system to be activated on demand — only when radar detection is imminent — conserving gas supply.

### Key Components

| Component | Description |
|-----------|-------------|
| Housing | Main UAV body |
| Front fairing | Sealed, radio-transparent material (allows homing radar to function) |
| Radar antenna | Homing head antenna positioned in fairing cavity |
| Autonomous gas source | Pressurized cylinder with recharging capability |
| Supply line (13) | Gas injection line with controllable shutter |
| Discharge line (14) | Gas exhaust line with controllable shutter |
| Pressure reducer | Maintains 1–100 kPa residual pressure in cavity |
| High-voltage source | With ignition/starter device |
| Electrode pairs | Dual pairs to reduce ignition threshold voltage |

### Operational Sequence

1. Prior to deployment: technicians introduce plasma-forming gas mixture and seal the fairing
2. Before entering radar detection zones: control system reopens gas supply, restoring parameters degraded during storage
3. After stabilization: shutters close at specified residual pressure
4. Ignition: electrical discharge initiates plasma from gas mixture
5. Active stealth: plasma absorbs incoming radar waves
6. Target acquisition phase: plasma deactivated to allow homing head antenna to function
7. Terminal phase: sequence may be repeated based on threat environment

### Physics Mechanism: Plasma Radar Absorption

The plasma absorbs radar frequencies by converting microwave energy to thermal energy via free-electron collisions. The absorption condition requires the plasma frequency ω_p to exceed the radar frequency ω:

**ω_p = √(n_e e²/m_e ε₀) > ω_radar**

For X-band radar (10 GHz):

Required: n_e > ~1.2 × 10¹⁸ m⁻³

This electron density is achievable with a glow discharge at modest applied voltage in a low-pressure gas (1–100 kPa range specified by the pressure reducer in Claim 3).

The degree of radar absorption as a function of plasma parameters:

**α = (ω_p² × ν_c) / (c × (ω² + ν_c²))**

where ν_c is the electron-neutral collision frequency. For ν_c ~ ω (collision-dominated regime), absorption is maximized. Adjusting gas pressure and composition optimizes ν_c for the target radar frequency.

### Dual-Use Architecture: Stealth + Operational Transparency

The key architectural achievement: the front fairing is radio-transparent (allowing the drone's own radar homing head to function) while the plasma is confined to the outer cavity — a dual-use architecture where the plasma provides stealth against external radar while leaving the drone's seeker fully operational.

This on-demand plasma stealth activation is architecturally superior to passive stealth materials (RAM coatings, shape optimization) which are always active. Plasma stealth allows:
- Normal operation without structural constraints of geometric stealth shaping
- Activated signatures reduction only when required (near target or radar sites)
- Minimal mass penalty compared to RAM coatings over the entire vehicle
- Operational flexibility — plasma can be cycled on/off during flight

### Assignee Context: MKB Raduga

MKB Raduga (the address on the patent, through the Ministry of Industry and Trade) is the developer of the Kh-22, Kh-55, and Kh-101/102 cruise missile families for the Russian Air Force. The 2014 filing date is contemporaneous with the development period of the Kh-101/102 stealth cruise missile (declared operational 2016). The technical approach matches what would be needed to achieve the reported &lt;0.01 m² radar cross-section of that system.

## Relationship to Other Patents in This Archive

The combination of Lockheed Martin's US8006939B2 (over-wing plasma accelerator, Track_16) with the RU2565157C1 plasma stealth architecture produces a vehicle that is simultaneously propelled and made radar-invisible by its plasma field — no moving parts, no conventional engine, no exhaust plume. This corresponds precisely to observed UAP flight characteristics: no acoustic signature, no radar return, no visible exhaust, instantaneous maneuver capability.

## Classifications

- **Aviation and drone systems** (implied from description)
- Related: B64D43/00 (Arrangements of equipment for use in airborne vehicles)

## Citations

- Google Patents: [RU2565157C1](https://patents.google.com/patent/RU2565157C1/en)
- Kh-101/102 cruise missile development, MKB Raduga, operational 2016
- US8006939B2 (Lockheed Martin plasma accelerator — related US technology, Track_16)

*Patent text compiled from Google Patents. Machine-translated from Russian; original Russian text at the above URL.*
