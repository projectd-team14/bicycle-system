export default defineEventHandler(async (event) => {
   const body = await useBody(event)
   console.log(body)
   const result: string = await $fetch(`http://host.docker.internal:8000/api/register`,{
     method: 'POST',
     body: body
    })
   return result
 })