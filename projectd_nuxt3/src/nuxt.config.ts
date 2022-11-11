import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  runtimeConfig: {
    public:{
      LaravelURL: process.env.LARAVEL_URL,
      FastURL: process.env.FAST_URL
    }
  },
  css: ["vuetify/lib/styles/main.sass"],
  build: {
    transpile: ["vuetify","chart.js"],
  },
  vite: {
    define: {
      "process.env.DEBUG": false,
    },
  },
})
