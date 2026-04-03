import React from 'react';
import Link from '@docusaurus/Link';
import styles from './styles.module.css';

interface Person {
  name: string;
  path: string;
  blurb: string;
}

const people: Person[] = [
  {
    name: "Phil Schneider",
    path: "/uaps/Details/Phil_Schneider",
    blurb: "Age 48. Catheter wrapped three times around neck\u2014no fingerprints found. Warned audiences: \u2018If I ever commit suicide, I was murdered.\u2019 Wilsonville, Oregon.",
  },
  {
    name: "Vimal Dajibhai",
    path: "/uaps/Details/Vimal_Dajibhai",
    blurb: "Age 24. Fell 331 feet from bridge. Unexplained needle puncture mark. Pants around ankles. Marconi torpedo guidance engineer. Bristol, England.",
  },
  {
    name: "Arshad Sharif",
    path: "/uaps/Details/Ashad_Sharif",
    blurb: "Age 26. Tied rope from neck to tree and drove at speed\u2014decapitated. Marconi satellite programmer, about to be promoted. Bristol, England.",
  },
  {
    name: "Peter Ferry",
    path: "/uaps/Details/Peter_Ferry",
    blurb: "Age 60. Electrocuted\u2014stripped wires jammed into his tooth fillings. Retired Army Brigadier and Marconi marketing director. England.",
  },
  {
    name: "Alistair Beckham",
    path: "/uaps/Details/Alistair_Beckham",
    blurb: "Age 50. Electrocuted with bare mains wires around chest, handkerchief stuffed in mouth. Wife denied depression. Marconi defense engineer. England.",
  },
  {
    name: "Shani Warren",
    path: "/uaps/Details/Shani_Warren",
    blurb: "Age 26. Drowned\u2014gagged, hands bound, noose around neck. Ruled \u2018suicide.\u2019 Employer acquired by Marconi weeks later. Buckinghamshire, England.",
  },
  {
    name: "Ron Rummel",
    path: "/uaps/Details/Ron_Rummel",
    blurb: "Ex-Air Force intelligence. Gunshot to mouth\u2014no blood on barrel. Gun wiped clean. Suicide note written left-handed; he was right-handed. Portland, Oregon.",
  },
  {
    name: "Stanley Meyer",
    path: "/uaps/Details/Stanley_Meyer",
    blurb: "Age 57. Last words: \u2018They poisoned me.\u2019 Water fuel cell inventor with multiple patents. Collapsed at restaurant. Twin brother Stephen survived. Ohio.",
  },
  {
    name: "Todd Sees",
    path: "/uaps/Details/Todd_Sees",
    blurb: "Age 39. Left home hunting in full gear. Found next day in underwear\u2014emaciated, white, expression of horror. UFO seen over ridge that morning. Pennsylvania.",
  },
  {
    name: "Mark McCandlish",
    path: "/uaps/Details/Mark_McCandlish",
    blurb: "Age 65. Gunshot to head days before Senate testimony on antigravity craft. Ruled suicide. Disclosure Project witness. Redding, California.",
  },
  {
    name: "James Forrestal",
    path: "/uaps/Details/James_Forrestal",
    blurb: "Age 57. First U.S. Secretary of Defense. Fell from 16th-floor window with bathrobe cord around neck. Navy never ruled it suicide. Bethesda, Maryland.",
  },
  {
    name: "Richard Pugh",
    path: "/uaps/Details/Richard_Pugh",
    blurb: "Plastic bag on head, feet bound, rope around body. MOD consultant. Ruled \u2018sexual misadventure.\u2019 Death method repeated three months later. England.",
  },
  {
    name: "Mark Wisner",
    path: "/uaps/Details/Mark_Wisner",
    blurb: "Age 24. Plastic sack and cling film over face\u2014nearly identical to Richard Pugh\u2019s death three months earlier. MOD software engineer. England.",
  },
  {
    name: "Dorothy Kilgallen",
    path: "/uaps/Details/Dorothy_Kilgallen",
    blurb: "Age 52. Only journalist to interview Jack Ruby privately. Found dead\u2014wrong room, fully dressed, JFK investigation notes vanished. Manhattan, New York.",
  },
  {
    name: "Eugene Mallove",
    path: "/uaps/Details/Eugene_Mallove",
    blurb: "Age 56. Beaten to death\u201432 lacerations, crushed trachea. MIT cold fusion whistleblower. Founded Infinite Energy magazine. Norwich, Connecticut.",
  },
  {
    name: "Roger Hill",
    path: "/uaps/Details/Roger_Hill",
    blurb: "Age 49. \u2018Suicide\u2019 by shotgun\u2014with four separate wounds. Marconi radar designer working on classified naval systems. Surrey, England.",
  },
  {
    name: "Tom Ogle",
    path: "/uaps/Details/Tom_Ogle",
    blurb: "Age ~25. Demonstrated 100+ MPG on live TV. Shot months before death. Told attorney people were drugging his drinks. Ruled overdose. El Paso, Texas.",
  },
  {
    name: "Peter Peapell",
    path: "/uaps/Details/Peter_Peapell",
    blurb: "Age 46. Carbon monoxide death, body jammed underneath car in position police called impossible. Classified defense scientist. Oxfordshire, England.",
  },
  {
    name: "Keith Bowden",
    path: "/uaps/Details/Keith_Bowden",
    blurb: "Age 46. Car plunged off bridge. Tires swapped with worn ones. First of 25+ Marconi defense scientist deaths in the 1980s. Essex, England.",
  },
  {
    name: "David Sands",
    path: "/uaps/Details/David_Sands",
    blurb: "Age 37. Car loaded with extra petrol cans hit wall at speed. Body burned beyond recognition. Marconi satellite projects manager. Surrey, England.",
  },
  {
    name: "Wilhelm Reich",
    path: "/uaps/Details/Wilhelm_Reich",
    blurb: "Age 60. Six tons of his books burned by U.S. government order\u2014only federal book burning in history. Died in prison one day before parole.",
  },
  {
    name: "Amy Eskridge",
    path: "/uaps/Details/Amy_Eskridge",
    blurb: "Age 34. Ruled suicide. Intelligence officer told Congress she was \u2018murdered with directed energy weapons by an aerospace company.\u2019 Antigravity researcher. Huntsville, Alabama.",
  },
  {
    name: "Zigmund Adamski",
    path: "/uaps/Details/Zigmund_Adamski",
    blurb: "Age 56. Missing five days, only one day\u2019s beard growth. Unexplained burns, unidentified ointment on skin, shirt gone. Coal miner buying potatoes. Yorkshire, England.",
  },
  {
    name: "Max Spiers",
    path: "/uaps/Details/Max_Spiers",
    blurb: "Age 39. Father of two. Texted mother: \u2018If anything happens to me, investigate.\u2019 Vomited two liters of black fluid before dying. Warsaw, Poland.",
  },
  {
    name: "Jonathan Walsh",
    path: "/uaps/Details/Jonathan_Walsh",
    blurb: "Age 29. Fell from hotel window in Ivory Coast. Had told colleagues he feared for his life before traveling. GEC defense communications expert.",
  },
  {
    name: "Carl Grillmair",
    path: "/uaps/Details/Carl_Grillmair",
    blurb: "Age 67. Shot by a man whose charges were dismissed eleven days earlier. Caltech astrophysicist, infrared detection specialist. Llano, California.",
  },
  {
    name: "Uyrange Hollanda",
    path: "/uaps/Details/Uyrange_Hollanda",
    blurb: "Brazilian Air Force captain. Led UFO investigation producing 500 photos. Broke 20-year silence in interview\u2014found hanged three months later. Brazil.",
  },
  {
    name: "James McDonald",
    path: "/uaps/Details/James_McDonald",
    blurb: "Age 51. Most credentialed UFO scientist of the 1960s. Career and marriage systematically destroyed. First attempt left him blind. Found dead in Arizona desert.",
  },
  {
    name: "Thomas Mantell",
    path: "/uaps/Details/Thomas_Mantell",
    blurb: "Age 25. First pilot to die chasing a UFO. P-51 crashed pursuing bright circular object over Kentucky. Air Force blamed Venus, later retracted. WWII hero.",
  },
  {
    name: "Felix Moncla",
    path: "/uaps/Details/Felix_Moncla",
    blurb: "Age 27. Fighter scrambled to intercept radar target over Lake Superior. His blip merged with the unknown object\u2014no wreckage ever found. Had a newborn daughter.",
  },
  {
    name: "Frederick Valentich",
    path: "/uaps/Details/Frederick_Valentich",
    blurb: "Age 20. Radioed: \u2018It is not an aircraft.\u2019 Described metallic craft with green light above his plane. Transmission ended in scraping sounds. Never found. Australia.",
  },
  {
    name: "Monica Jacinto Reza",
    path: "/uaps/Details/Monica_Jacinto_Reza",
    blurb: "Age 60. Mondaloy superalloy co-inventor for military rockets. Vanished hiking\u2014declared dead four days later while search teams were still looking. Angeles National Forest, California.",
  },
  {
    name: "William McCasland",
    path: "/uaps/Details/William_McCasland",
    blurb: "Retired Major General. Commanded $4.4 billion Air Force Research Lab. Vanished from Albuquerque home, February 2026. Left phone, glasses, all devices behind. FBI searching.",
  },
  {
    name: "Viktor Schauberger",
    path: "/uaps/Details/Viktor_Schauberger",
    blurb: "Age 73. Vortex energy inventor. Forced to sign away all rights in America. Said: \u2018They took everything from me.\u2019 Died five days later. Austria.",
  },
  {
    name: "Lester Hendershot",
    path: "/uaps/Details/Lester_Hendershot",
    blurb: "Fuelless motor inventor\u2014Lindbergh witnessed demo. Carbon monoxide, ruled suicide. His son died the exact same way ten years later. Cypress, California.",
  },
  {
    name: "Fred Bell",
    path: "/uaps/Details/Fred_Bell",
    blurb: "Age 68. Nuclear physicist. Died 48 hours after filming interview about classified directed energy weapons with Jesse Ventura. Sudden heart failure.",
  },
  {
    name: "Dean Warwick",
    path: "/uaps/Details/Dean_Warwick",
    blurb: "Age 62. Collapsed on stage mid-sentence, about to reveal who killed RFK. Told organizers he felt a \u2018beam\u2019 on the side of his head. Blackpool, England.",
  },
  {
    name: "Morris Jessup",
    path: "/uaps/Details/Morris_Jessup",
    blurb: "Age 59. UFO researcher\u2014Navy reprinted his annotated book at classified facility. Ruled suicide. Friends said he was in \u2018high spirits\u2019 the night before. Florida.",
  },
  {
    name: "Karl Wolfe",
    path: "/uaps/Details/Karl_Wolfe",
    blurb: "Age 74. USAF veteran who testified about artificial structures on the Moon at the National Press Club. Struck by tractor trailer while cycling. New York.",
  },
  {
    name: "Karla Turner",
    path: "/uaps/Details/Karla_Turner",
    blurb: "Age 48. Ph.D. researcher documenting the dark side of alien abductions. Publicly threatened. Fast-acting cancer, no family history. Same month as Schneider. Texas.",
  },
  {
    name: "Nikola Tesla",
    path: "/uaps/Details/Nikola_Tesla",
    blurb: "Age 86. 300+ patents. FBI seized ~80 trunks of papers within hours of death. Hoover classified it top secret. Twenty trunks never returned. New York.",
  },
  {
    name: "Mae Brussell",
    path: "/uaps/Details/Mae_Brussell",
    blurb: "Age 66. Radio host\u2014851 broadcasts over 17 years. Investigating military base child abuse scandal. Death threats in March. Dead of fast-acting cancer by October. California.",
  },
  {
    name: "Jim Keith",
    path: "/uaps/Details/Jim_Keith",
    blurb: "Age 49. Conspiracy author. Fell at Burning Man, needed knee surgery. Told friends he feared he wouldn\u2019t survive the hospital. Died during surgery. Reno, Nevada.",
  },
  {
    name: "John Mack",
    path: "/uaps/Details/John_Mack",
    blurb: "Age 74. Pulitzer Prize\u2013winning Harvard psychiatrist. Most credentialed academic to take alien abductions seriously. Struck and killed by drunk driver walking home. London.",
  },
  {
    name: "Rudolf Diesel",
    path: "/uaps/Details/Rudolf_Diesel",
    blurb: "Age 55. His engine could run on vegetable oil. Vanished from ship en route to meet British Navy about submarine engines. Body found in English Channel.",
  },
  {
    name: "Nuno Loureiro",
    path: "/uaps/Details/Nuno_Loureiro",
    blurb: "Age 47. MIT fusion center director. Shot by former classmate who attacked Brown University two days prior\u2014then killed himself. Father of young children. Massachusetts.",
  },
  {
    name: "Jacob Prichard",
    path: "/uaps/Details/Jacob_Prichard",
    blurb: "Age 34. AFRL scientist at Wright-Patterson. Killed wife and colleague then himself\u2014no motive ever established. Three young children left behind. West Milton, Ohio.",
  },
  {
    name: "Jaime Gustitus",
    path: "/uaps/Details/Jaime_Gustitus",
    blurb: "Age 25. Air Force Academy grad, Top Secret clearance. Shot 5\u20137 times by colleague Jacob Prichard\u2014no motive found. Wright-Patterson AFB cluster. Ohio.",
  },
  {
    name: "Jaymee Prichard",
    path: "/uaps/Details/Jaymee_Prichard",
    blurb: "Age 33. Mother of three young children. Strangled by husband\u2014an AFRL scientist\u2014who then killed a colleague and himself. No motive established. Ohio.",
  },
  {
    name: "Paul Brown",
    path: "/uaps/Details/Paul_Brown",
    blurb: "Nuclear battery inventor. Home robbed three times, vandalized four times. Mother\u2019s car pipe-bombed. Then died in a car accident. Boise, Idaho.",
  },
  {
    name: "Thomas Henry Moray",
    path: "/uaps/Details/Thomas_Henry_Moray",
    blurb: "Radiant energy device producing 50 kilowatts. Shot at multiple times. Lab ransacked. His own assistant destroyed the device with an ax. Salt Lake City.",
  },
  {
    name: "Gianni Dotto",
    path: "/uaps/Details/Gianni_A_Dotto",
    blurb: "Anti-aging device inventor. FDA ordered his machines destroyed at Sloan-Kettering. Reportedly run over by a vehicle multiple times. Former WWII fighter pilot.",
  },
  {
    name: "Stefan Marinov",
    path: "/uaps/Details/Stefan_Marinov",
    blurb: "Age 66. Physicist challenging Einstein\u2019s relativity. Fell from university staircase in Graz, Austria. A Russian colleague publicly stated: \u2018He was thrown.\u2019",
  },
  {
    name: "Andrija Puharich",
    path: "/uaps/Details/Andrija_Puharich",
    blurb: "Age 76. Held water-splitting patent. Home burned by arson. CIA/MKULTRA connections. 50+ patents. Died of heart attack after falling down stairs. North Carolina.",
  },
  {
    name: "Ning Li",
    path: "/uaps/Details/Ning_Li",
    blurb: "Anti-gravity physicist, DOD grant, top secret clearance. Emailed \u2018successful experiments\u2019 then went silent. Car accident destroyed her brain. Husband died witnessing it. Alabama.",
  },
  {
    name: "Melissa Casias",
    path: "/uaps/Details/Melissa_Casias",
    blurb: "Age 53. LANL employee on DOE advisory board. Factory-reset both personal and government phones before vanishing\u2014four days after Monica Reza disappeared. Talpa, New Mexico.",
  },
  {
    name: "Paul Bennewitz",
    path: "/uaps/Details/Paul_Bennewitz",
    blurb: "Age 75. Intercepted classified signals near Kirtland AFB. Air Force deliberately drove him insane with disinformation\u2014documented in official AFOSI files. Albuquerque, New Mexico.",
  },
  {
    name: "Rory Johnson",
    path: "/uaps/Details/Rory_Johnson",
    blurb: "Invented 525 HP motor needing no fuel. Greyhound signed a contract. DOE placed a gag order. Reportedly #1 on an alleged OPEC hit list. California.",
  },
  {
    name: "Philip Haney",
    path: "/uaps/Details/Philip_Haney",
    blurb: "Age 66. DHS founding member and counterterrorism whistleblower. Found shot in his car while writing a follow-up book. Was engaged to be married. Amador County, California.",
  },
  {
    name: "John Bedini",
    path: "/uaps/Details/John_Bedini",
    blurb: "Age 67. Electromagnetic energy device inventor. Died suddenly\u2014four hours after his brother Gary also died unexpectedly. Survived by wife Ronda.",
  },
  {
    name: "Ann Livingston",
    path: "/uaps/Details/Ann_Livingston",
    blurb: "MUFON investigator. Published on electronic harassment and alien abductions. Attacked by five \u2018faceless\u2019 men in parking lot. Died of sudden ovarian cancer. Chicago.",
  },
  {
    name: "David Greenhalgh",
    path: "/uaps/Details/David_Greenhalgh",
    blurb: "Age 46. Fell 40 feet from railway bridge. Survived briefly but could never explain what happened. Died the same day as another defense scientist. England.",
  },
  {
    name: "Victor Moore",
    path: "/uaps/Details/Victor_Moore",
    blurb: "Age 46. Marconi engineer on infrared satellite systems. Drug overdose. MI5 investigated his death as part of the defense scientist cluster. England.",
  },
  {
    name: "Trevor Knight",
    path: "/uaps/Details/Trevor_Knight",
    blurb: "Age 52. Carbon monoxide, car in garage. The eighth Marconi defense scientist to die in eighteen months. Computer engineer on classified systems. Berkshire, England.",
  },
  {
    name: "Andrew Hall",
    path: "/uaps/Details/Andrew_Hall",
    blurb: "Age 33. Carbon monoxide, hosepipe from exhaust. No suicide note. The last recorded death in the Marconi scientist cluster. British Aerospace engineer. England.",
  },
  {
    name: "Michael Baker",
    path: "/uaps/Details/Michael_Baker",
    blurb: "Age 22. Car crashed through barrier. Plessey digital communications expert and part-time SAS Signals Corps member. Part of Marconi defense cluster. Dorset, England.",
  },
  {
    name: "David Skeels",
    path: "/uaps/Details/David_Skeels",
    blurb: "Age 43. Carbon monoxide poisoning. Marconi avionics engineer. One of 25+ British defense scientists to die under questionable circumstances in the 1980s. England.",
  },
  {
    name: "Stuart Gooding",
    path: "/uaps/Details/Stuart_Gooding",
    blurb: "Age 23. Head-on collision with lorry. Classified defense researcher at Royal College of Military Science. Died the exact same day as David Greenhalgh. Cyprus.",
  },
  {
    name: "Russell Smith",
    path: "/uaps/Details/Russell_Smith",
    blurb: "Age 23. Fell from cliff at Boscastle, Cornwall. Nuclear lab technician at Harwell. No motive for suicide ever established. England.",
  },
  {
    name: "Jason Thomas",
    path: "/uaps/Details/Jason_Thomas",
    blurb: "Age 45. Novartis chemical biology director. Left without phone or wallet. Found in frozen lake three months later. Both parents died weeks before. Massachusetts.",
  },
  {
    name: "John Brittan",
    path: "/uaps/Details/John_Brittan",
    blurb: "Age 52. Carbon monoxide, car in garage. Top-secret MOD work. Recently returned from the United States. No documented history of depression. England.",
  },
  {
    name: "George Kountis",
    path: "/uaps/Details/George_Kountis",
    blurb: "Defense analyst. Car went into River Mersey. Sister demanded fresh inquest: \u2018Things didn\u2019t add up.\u2019 Died same day as Shani Warren. Liverpool, England.",
  },
  {
    name: "Floyd Sweet",
    path: "/uaps/Details/Floyd_Sweet",
    blurb: "Age 83. Device produced 500 watts from 33 microwatts input. Man showed surveillance photo of his apartment: \u2018Unfortunate things happen.\u2019 Research confiscated after death.",
  },
  {
    name: "Arie DeGeus",
    path: "/uaps/Details/Arie_DeGeus",
    blurb: "Age 67. Zero-point energy battery inventor with multiple patents. Found dead in airport parking lot en route to meet European investors. Charlotte, North Carolina.",
  },
  {
    name: "Frank Jennings",
    path: "/uaps/Details/Frank_Jennings",
    blurb: "Age 60. Heart attack. Plessey electronic weapons engineer on SDI programs. No inquest held. His colleague Michael Baker died the month before. England.",
  },
  {
    name: "Philip Corso",
    path: "/uaps/Details/Philip_Corso",
    blurb: "Eisenhower\u2019s NSC member. Said he gave Roswell artifacts to defense contractors\u2014seeding fiber optics, lasers, Kevlar. Heart attack one year after publishing. Filed sworn affidavit.",
  },
  {
    name: "Brian Lynch",
    path: "/uaps/Details/Brian_Lynch",
    blurb: "Young psychic recruited by intelligence-linked firm for \u2018psychic warfare\u2019 experiments. Found dead of overdose. Note referenced \u2018$5 million from Pentagon for Project Scanate.\u2019",
  },
  {
    name: "Wilbert Smith",
    path: "/uaps/Details/Wilbert_Smith",
    blurb: "Age 52. Canadian government engineer who ran official UFO program. Classified memo confirmed U.S. programs. Cancer. Told wife to hide all files. Three nations sought them.",
  },
];

export default function TOC(): React.ReactElement {
  return (
    <div className={styles.sidebar}>
      <div className={styles.header}>The Dead &amp; Missing</div>
      {people.map((person, i) => (
        <div key={i} className={styles.entry}>
          <Link className={styles.name} to={person.path}>
            {person.name}
          </Link>
          <p className={styles.blurb}>{person.blurb}</p>
        </div>
      ))}
      <div className={styles.count}>
        80 profiles from 290+ documented cases
      </div>
    </div>
  );
}
