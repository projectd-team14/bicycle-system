export default defineEventHandler(async (event) => {
  const spotId = useQuery(event)
  const body = await useBody(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.LaravelURL+`/api/delete_spot/${spotId.id}`,{
    method: 'POST',
    body: body
   })
  return result
})