<template>
   <v-card class="my-2 pa-3 card all overflow-auto">
      <v-card-title class="text-h5">
         混雑度
      </v-card-title>
      <v-row>
         <v-col cols="6" v-for="(v, k) in dash.data" :key="k">
            <div class="py-8 d-flex flex-column">
               <div class="d-flex justify-center">
                  <div class="size">
                     <v-progress-circular :size="120" :width="20" :model-value="v.spots_congestion" :bg-color="color[k]+'-lighten-3'" :color="color[k]">
                        {{v.spots_congestion}}%
                     </v-progress-circular>                     
                  </div>
               </div>
               <p class="text-center mt-3">{{v.spots_name}}</p>
            </div>
         </v-col>
      </v-row>
   </v-card>
</template>

<script setup lang="ts">
   const { dash } = useDash()
   const colorList = []
   var spotsCount = 0


   for (let i = 0; i < dash.value.length; i++) {
      if (i > 20) {
         spotsCount = 0
      } else {
         spotsCount = spotsCount + 1
      }
      colorList.push(Array[i])
   }

   interface Props {
      color: colorList
   }

   const props = withDefaults(defineProps<Props>(), {
      color:[]
   })
</script>

<style lang="sass" scoped>
.all
   height: 360px
</style>