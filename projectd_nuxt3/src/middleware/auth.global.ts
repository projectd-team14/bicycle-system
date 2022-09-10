import { useAuth } from '@/composables/useAuth'

export default defineNuxtRouteMiddleware((to, from) => {
  const { loginUser } = useAuth()
  if (!loginUser.value && to.path !== '/login') {
    const path = '/login'
    return { path }
  }
})