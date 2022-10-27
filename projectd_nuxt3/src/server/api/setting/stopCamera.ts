export default defineEventHandler(async (event) => {
  const cameraId = useQuery(event)
  const body = await useBody(event)
  const result: string = await $fetch(`http://host.docker.internal:8000/api/stop/${cameraId.id}`)
  return result
})