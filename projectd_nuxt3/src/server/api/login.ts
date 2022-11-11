const config = useRuntimeConfig()
let url: string = config.public.LaravelURL+`/api/login`

export interface login {
  token: string;
  user: User;
}

export interface User {
  id: number;
  name: string;
  email: string;
  email_verified_at: string;
  created_at: string;
  updated_at: string;
}

export default defineEventHandler(async (event) => {
  const body = await useBody(event)
  const result: login[] = await $fetch(url,{
   method: 'POST',
   body: body
  })
  return result
})