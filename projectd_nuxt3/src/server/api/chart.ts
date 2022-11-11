export default defineEventHandler(async (event) => {
   const spotId = useQuery(event)
   const config = useRuntimeConfig()
   const result: string = await $fetch(config.public.LaravelURL+`/api/get_spot/${spotId.id}`)
   return result
 })