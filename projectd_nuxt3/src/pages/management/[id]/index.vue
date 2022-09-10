<template>
   <v-container>
      <v-card class="pa-3">
         <div class="d-flex flex-column">
            <p class="text-h4">{{name}}</p>
            <div class="mt-2 px-3">
               <div class="text-h6">混雑状況：{{ Math.ceil(per) }}%</div>
               <v-progress-linear
                  v-model="per"
                  height="30"
                  color="teal"
               >
                  <strong>{{ Math.ceil(per) }}%</strong>
               </v-progress-linear>
            </div>
            <v-row>
               <v-col lg="6" cols="12">
                  <ManagementCamera :camera="spots[index].camera" />
               </v-col>
               <v-col lg="6" cols="12">
                  <ManagementSituation :situation="spots[index].situation" />
               </v-col>
            </v-row>
         </div>
      </v-card>
   </v-container>
</template>

<script setup lang="ts">
  const { title } = useArticleTitle()
  const { spots } = useSpots()
  onMounted(() => title.value = '駐輪場管理 / '+name)

  const route = useRoute()
  const paramsId = route.params.id
  const index = spots.value.findIndex(({id}) => id == paramsId)
  const name = spots.value[index].name
  const per = (spots.value[index].count / spots.value[index].max)*100
</script>