export default defineEventHandler(async (event) => {
   const userId = useQuery(event)
   const body = await useBody(event)
   const result: string = await $fetch(`http://host.docker.internal:8000/api/store_spot/${userId.id}`,{
      method: 'POST',
      body: body
   })
   return result
})