export default defineEventHandler(async (event) => {
   const spotId = useQuery(event)
   const result: string = await $fetch(`http://host.docker.internal:8000/api/get_spot/${spotId.id}`)
   return result
 })