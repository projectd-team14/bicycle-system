export default defineEventHandler(async (event) => {
    const cameraId = useQuery(event)
    const body = await useBody(event)
    const config = useRuntimeConfig()
    const result: string = await $fetch(config.public.LaravelURL+`/api/labels/${cameraId.id}`,{
       method: 'POST',
       body: body
    })
    return result
  })