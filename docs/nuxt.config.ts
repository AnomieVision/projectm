// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  app: {
    baseURL: process.env.NODE_ENV === "development" ? '/' : '/projectm/',
    buildAssetsDir: 'assets'
  },
  modules: ['@nuxt/content']
})
