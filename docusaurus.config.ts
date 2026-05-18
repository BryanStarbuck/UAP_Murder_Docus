import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";

const siteUrl = process.env.DOCUSAURUS_URL || "https://uapmurders.com";
const baseUrl = process.env.DOCUSAURUS_BASE_URL || "/";

const siteDescription =
  "Investigations into suspicious deaths, disappearances, and suppression of UAP/UFO researchers, whistleblowers, energy inventors, and physicists silenced for what they knew.";

const config: Config = {
  title: "Murdering UAP Experts",
  tagline:
    "UAP researchers, whistleblowers, energy inventors, and physicists silenced — three investigations into suspicious deaths.",
  favicon: "img/favicon.ico",

  future: {
    v4: true,
  },

  url: siteUrl,
  baseUrl,
  trailingSlash: true,

  organizationName: "BryanStarbuck",
  projectName: "UAP_Murder_Docus",

  onBrokenLinks: "warn",

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  markdown: {
    format: "detect",
  },

  presets: [
    [
      "classic",
      {
        docs: {
          // Default instance: UAPs Murders (General)
          path: "UAPs",
          routeBasePath: "uaps",
          sidebarPath: "./sidebarsGeneral.ts",
          remarkPlugins: [remarkMath],
          rehypePlugins: [rehypeKatex],
          exclude: ["**/CLAUDE.md", "**/claude.md"],
        },
        blog: false,
        theme: {
          customCss: "./src/css/custom.css",
        },
        sitemap: {
          lastmod: "date",
          changefreq: "weekly",
          priority: 0.7,
          filename: "sitemap.xml",
          ignorePatterns: ["/tags/**"],
        },
      } satisfies Preset.Options,
    ],
  ],

  headTags: [
    {
      tagName: "link",
      attributes: {
        rel: "canonical",
        href: siteUrl + "/",
      },
    },
    {
      tagName: "link",
      attributes: {
        rel: "preconnect",
        href: "https://cdn.jsdelivr.net",
        crossorigin: "anonymous",
      },
    },
    {
      tagName: "meta",
      attributes: {
        name: "robots",
        content: "index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1",
      },
    },
    {
      tagName: "meta",
      attributes: {
        name: "author",
        content: "Bryan Starbuck",
      },
    },
    {
      tagName: "script",
      attributes: {
        type: "application/ld+json",
      },
      innerHTML: JSON.stringify({
        "@context": "https://schema.org",
        "@type": "WebSite",
        name: "Murdering UAP Experts",
        alternateName: "UAP Murders",
        url: siteUrl + "/",
        description: siteDescription,
        inLanguage: "en-US",
        potentialAction: {
          "@type": "SearchAction",
          target: {
            "@type": "EntryPoint",
            urlTemplate: siteUrl + "/search?q={search_term_string}",
          },
          "query-input": "required name=search_term_string",
        },
      }),
    },
    {
      tagName: "script",
      attributes: {
        type: "application/ld+json",
      },
      innerHTML: JSON.stringify({
        "@context": "https://schema.org",
        "@type": "Organization",
        name: "UAP Murders Investigation",
        url: siteUrl + "/",
        logo: siteUrl + "/img/logo.svg",
        description: siteDescription,
        sameAs: [
          "https://intelligencemurders.com/",
        ],
      }),
    },
  ],

  stylesheets: [
    {
      href: "https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css",
      type: "text/css",
      integrity: "sha384-n8MVd4RsNIU0tAv4ct0nTaAbDJwPJzDEaqSD1odI+WdtXRGWt2kTvGFasHpSy3SV",
      crossorigin: "anonymous",
    },
  ],

  plugins: [
    [
      "@docusaurus/plugin-content-docs",
      {
        id: "energy",
        path: "Energy",
        routeBasePath: "energy",
        sidebarPath: "./sidebarsEnergySystems.ts",
        remarkPlugins: [remarkMath],
        rehypePlugins: [rehypeKatex],
        exclude: ["**/CLAUDE.md", "**/claude.md"],
      },
    ],
    [
      "@docusaurus/plugin-content-docs",
      {
        id: "physics",
        path: "Physics",
        routeBasePath: "physics",
        sidebarPath: "./sidebarsPhysics.ts",
        remarkPlugins: [remarkMath],
        rehypePlugins: [rehypeKatex],
        exclude: [
          "**/CLAUDE.md",
          "**/claude.md",
          // Physics_Math research workspace — only publish Tracks, ui/, 2_patents_intl/, top-level overview/Break_thrus
          'Physics_Math/1_Track/**',
          'Physics_Math/attempts/**',
          'Physics_Math/day/**',
          'Physics_Math/images/**',
          'Physics_Math/images_description/**',
          'Physics_Math/ipfs/**',
          'Physics_Math/other/**',
          'Physics_Math/patents_intl/**',
          'Physics_Math/prompts/**',
          'Physics_Math/simulation/**',
          'Physics_Math/Track_2/**',
          'Physics_Math/Track_3/**',
          'Physics_Math/track_4/**',
          'Physics_Math/videos/**',
          'Physics_Math/manual_UAP_Physics.mdx',
          'Physics_Math/Break_thrus.md',
        ],
      },
    ],
  ],

  themeConfig: {
    metadata: [
      { name: 'google-site-verification', content: 'RUz8ukRe1Bq-veydpGR2cFPUvB8con_WUc4RCqIq-5Q' },
      { name: 'description', content: siteDescription },
      {
        name: 'keywords',
        content:
          'UAP murders, UFO whistleblowers killed, suppressed energy inventors, zero-point energy deaths, cold fusion researchers murdered, UAP physics, classified physics, GEC-Marconi scientists, suspicious deaths, AATIP, AAWSAP, David Grusch, Stanley Meyer, Phil Schneider, suppressed technology',
      },
      { name: 'application-name', content: 'Murdering UAP Experts' },
      { name: 'apple-mobile-web-app-title', content: 'UAP Murders' },
      { name: 'theme-color', content: '#0b0b0b' },
      { property: 'og:type', content: 'website' },
      { property: 'og:site_name', content: 'Murdering UAP Experts' },
      { property: 'og:locale', content: 'en_US' },
      { property: 'og:title', content: 'Murdering UAP Experts — UFO Whistleblowers, Energy Inventors & Physicists Silenced' },
      { property: 'og:description', content: siteDescription },
      { property: 'og:image', content: siteUrl + '/img/docusaurus-social-card.jpg' },
      { property: 'og:image:alt', content: 'Murdering UAP Experts — three investigations into suspicious deaths' },
      { property: 'og:url', content: siteUrl + '/' },
      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:title', content: 'Murdering UAP Experts' },
      { name: 'twitter:description', content: siteDescription },
      { name: 'twitter:image', content: siteUrl + '/img/docusaurus-social-card.jpg' },
      { name: 'twitter:image:alt', content: 'Murdering UAP Experts — three investigations into suspicious deaths' },
    ],
    image: "img/docusaurus-social-card.jpg",
    colorMode: {
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: "Murdering UAP Experts",
      logo: {
        alt: "Murdering UAP Experts site logo",
        src: "img/logo.svg",
      },
      items: [
        { to: "/uaps/", label: "UAPs Murders (General)", position: "left", activeBaseRegex: "/uaps/" },
        { to: "/energy/", label: "UAP Energy Systems Murders", position: "left", activeBaseRegex: "/energy/" },
        { to: "/physics/", label: "UAP Physics Murders", position: "left", activeBaseRegex: "^/physics/(?!Physics_Math/ui)" },
        { to: "/physics/Physics_Math/ui/overview/", label: "UAP Propulsion Wiki", position: "left", activeBaseRegex: "/physics/Physics_Math/ui/" },
      ],
    },
    footer: {
      style: "dark",
      copyright: `Copyright © ${new Date().getFullYear()} ACT 3 AI, Inc. All rights reserved.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
