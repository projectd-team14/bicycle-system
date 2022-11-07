<template>
   <v-container>
      <div class="d-flex flex-column">
         <v-card class="pa-3 mt-2">
            <p class="text-h4">{{name}}</p>
            <div class="mt-2 px-3 pb-3">
               <div class="text-h6">混雑状況：{{ Math.ceil(per) }}%</div>
               <v-progress-linear
                  v-model="per"
                  height="30"
                  color="teal"
               >
                  <strong>{{ Math.ceil(per) }}%</strong>
               </v-progress-linear>
            </div>
         </v-card>
         <v-row class="mt-4">
            <v-col lg="6" cols="12">
               <v-card class="pa-3">
                  <p class="text-h4 my-2">駐輪場カメラ</p>
                  <ManagementCamera :camera="spots[index].camera" />
               </v-card>
            </v-col>
            <v-col lg="6" cols="12">
               <v-card class="pa-3">
                  <p class="text-h4 my-2">放置自転車状況</p>
                  <ManagementSituation :situation="spots[index].situation" />
               </v-card>
            </v-col>
         </v-row>
      </div>
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