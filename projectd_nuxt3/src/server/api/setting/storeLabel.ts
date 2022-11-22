export default defineEventHandler(async (event) => {
  const cameraId = useQuery(event)
  const body = await useBody(event)
  const config = useRuntimeConfig()
  const result: string = await $fetch(config.public.FastURL+`/label/${cameraId.id}`,{
     method: 'POST',
     body: body
  })
  return result
})