import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";

const siteUrl = process.env.DOCUSAURUS_URL || "https://uapmurders.com";
const baseUrl = process.env.DOCUSAURUS_BASE_URL || "/";

const config: Config = {
  title: "UAP Murder Docus",
  tagline: "",
  favicon: "img/favicon.ico",

  future: {
    v4: true,
  },

  url: siteUrl,
  baseUrl,
  trailingSlash: false,

  organizationName: "BryanStarbuck",
  projectName: "UAP_Murder_Docus",

  onBrokenLinks: "warn",

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
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
        },
        blog: false,
        theme: {
          customCss: "./src/css/custom.css",
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      "@docusaurus/plugin-content-docs",
      {
        id: "energy",
        path: "Energy",
        routeBasePath: "energy",
        sidebarPath: "./sidebarsEnergySystems.ts",
      },
    ],
    [
      "@docusaurus/plugin-content-docs",
      {
        id: "physics",
        path: "Physics",
        routeBasePath: "physics",
        sidebarPath: "./sidebarsPhysics.ts",
      },
    ],
  ],

  themeConfig: {
    image: "img/docusaurus-social-card.jpg",
    colorMode: {
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: "UAP Murder Docus",
      logo: {
        alt: "Site Logo",
        src: "img/logo.svg",
      },
      items: [
        { to: "/uaps/", label: "UAPs Murders (General)", position: "left", activeBaseRegex: "/uaps/" },
        { to: "/energy/", label: "UAP Energy Systems Murders", position: "left", activeBaseRegex: "/energy/" },
        { to: "/physics/", label: "UAP Physics Murders", position: "left", activeBaseRegex: "/physics/" },
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
