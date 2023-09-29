// https://nuxt.com/docs/guide/directory-structure/nuxt.config#nuxt-config-file
export default defineNuxtConfig({
  // General
  app: {
    baseURL: process.env.NODE_ENV === "development" ? "/" : "/projectm/",
    buildAssetsDir: "assets",
    rootId: "app",
  },
  debug: process.env.NODE_ENV === "development",
  experimental: {
    payloadExtraction: false,
  },
  modules: [
    // https://nuxt.com/modules/icon
    "nuxt-icon",

    // https://nuxt.com/modules/content
    "@nuxt/content",

    // https://nuxt.com/modules/color-mode
    "@nuxtjs/color-mode",

    // https://nuxt.com/modules/tailwindcss
    "@nuxtjs/tailwindcss",
  ],
  nitro: {
    prerender: {
      crawlLinks: true,
      failOnError: true,
    },
  },
  router: {
    options: {
      strict: false,
    },
  },
  runtimeConfig: {
    private: {},
    public: {},
  },
  ssr: false,

  // Modules
  devtools: { enabled: process.env.NODE_ENV === "development" },
  colorMode: {
    preference: "system", // default theme
    dataValue: "theme", // activate data-theme in <html> tag
    classSuffix: "",
  },
  content: {
    documentDriven: true,
    experimental: {
      clientDB: true,
    },
    // Configuring code highlighting
    // https://content.nuxtjs.org/api/configuration
    highlight: {
      theme: "github-dark",
      preload: ["c", "cpp"],
    },
    markdown: {
      // Configuring external link processing
      // https://github.com/rehypejs/rehype-external-links
      rehypePlugins: [
        [
          "rehype-external-links",
          {
            target: "_blank",
            rel: "noopener noreferer",
          },
        ],
      ],
    },
  },
  tailwindcss: {
    cssPath: "~/assets/css/tailwind.css",
    injectPosition: "last",
    viewer: false,
  },
});
