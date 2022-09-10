export default defineEventHandler(async (event) => {
  const spotId = useQuery(event)
  const body = await useBody(event)
  const result: string = await $fetch(`http://host.docker.internal:8000/api/delete_spot/${spotId.id}`,{
    method: 'POST',
    body: body
   })
  return result
})