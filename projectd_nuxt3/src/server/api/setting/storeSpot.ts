export default defineEventHandler(async (event) => {
   const userId = useQuery(event)
   const body = await useBody(event)
   const config = useRuntimeConfig()
   const result: string = await $fetch(config.public.LaravelURL+`/api/store_spot/${userId.id}`,{
      method: 'POST',
      body: body
   })
   return result
})