export default defineEventHandler(async (event) => {
  const cameraId = useQuery(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.LaravelURL+`/api/start/${cameraId.id}`)
  return result
})