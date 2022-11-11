export default defineEventHandler(async (event) => {
   const body = await useBody(event)
   const config = useRuntimeConfig()
   const result: string = await $fetch(config.public.LaravelURL+`/api/register`,{
     method: 'POST',
     body: body
    })
   return result
 })