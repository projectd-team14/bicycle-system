<template>
   <v-card class="my-2 pa-3 card" >
      <v-card-title class="text-h5">
         混雑度
      </v-card-title>
      <v-row>
         <v-col cols="4">
            <div class="py-8 d-flex flex-column">
               <div class="d-flex justify-center">
                  <v-progress-circular :size="120" :width="20" :model-value="50" bg-color="#FFE8C4" color="#F39C12">
                     50%
                  </v-progress-circular>
               </div>
               <p class="text-center mt-3">○○〇駐輪場</p>
            </div>
         </v-col>
         <v-col cols="4">
            <div class="py-8 d-flex flex-column">
               <div class="d-flex justify-center">
                  <v-progress-circular :size="120" :width="20" :model-value="30" bg-color="#ABD9BF" color="#27AE60">
                     30%
                  </v-progress-circular>
               </div>
               <p class="text-center  mt-3">△△△駐輪場</p>
            </div>
         </v-col>
         <v-col cols="4">
            <div class="py-8 d-flex flex-column">
               <div class="d-flex justify-center">
                  <v-progress-circular :size="120" :width="20" :model-value="10" bg-color="#C2DEF2" color="#3498DB">
                     10%
                  </v-progress-circular>
               </div>
               <p class="text-center mt-3">文教駐輪場</p>
            </div>
         </v-col>
      </v-row>
   </v-card>
</template>

<script setup lang="ts">

</script>