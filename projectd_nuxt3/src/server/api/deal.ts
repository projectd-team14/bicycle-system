export default defineEventHandler(async (event) => {
  const userId = useQuery(event)
  const result: string = await $fetch(`http://host.docker.internal:8000/api/get_all/${userId.id}`)
  return result
})