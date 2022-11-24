export default defineEventHandler(async (event) => {
  const userId = useQuery(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.LaravelURL+`/api/congestions_spot/${userId.id}`)
  return result
})