import '@mdi/font/css/materialdesignicons.css'
import { createVuetify, ThemeDefinition } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

export default defineNuxtPlugin(nuxtApp => {
  const vuetify = createVuetify({
    components,
    directives,
    theme: {
      defaultTheme: 'myCustomLightTheme',
      themes: {
        myCustomLightTheme,
      }
    }
  })
  nuxtApp.vueApp.use(vuetify)
})

const myCustomLightTheme: ThemeDefinition = {
  dark: false,
  colors: {
    background: '#f8f9fa',
    surface: '#FFFFFF',
    primary: '#B2EDCE',
    secondary: '#F9A825',
    error: '#B00020',
    info: '#2196F3',
    success: '#4CAF50',
    warning: '#FB8C00',
  }
}
