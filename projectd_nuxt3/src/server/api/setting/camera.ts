export default defineEventHandler(async (event) => {
  const spotId = useQuery(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.LaravelURL+`/api/edit_camera/${spotId.id}`)
  return result
})