export default defineEventHandler(async (event) => {
  const cameraId = useQuery(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.LaravelURL+`/api/check_labels/${cameraId.id}`)
  return result
})