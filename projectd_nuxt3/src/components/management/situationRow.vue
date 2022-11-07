<template>
   <v-sheet  v-if="n != 0" color="white" class="flex-grow-1">
   </v-sheet>

   <v-sheet color="#7bbfec" class="flex-grow-1 d-flex flex-colum justify-center align-center " border @click="overlay = !overlay">
      <p class="text-h2 text-white">{{row}}</p>
      <!-- <ManagementBicycle v-for="(n,i) in bicycle" :key="i" :bicycle="n" /> -->
   </v-sheet>

   <v-dialog v-model="overlay" >
      <v-card class="pa-4">
         <v-row class="pa-3">
            <v-card-title class="text-h4 mb-2">{{row}}エリアの状況</v-card-title>
            <v-spacer></v-spacer>
            <v-btn icon dark @click="overlay = false" class="mr-6"><v-icon>mdi-close</v-icon></v-btn>
         </v-row>
         <v-divider class="mb-6"/>
         <v-row>
            <v-col lg="3" md="6" cols="6" v-for="(n,i) in bicycle" class="d-flex justify-center align-center">
               <ManagementBicycle :key="i" :bicycle="n" />
            </v-col>
         </v-row>
      </v-card>
   </v-dialog>
</template>

<script setup lang="ts">

interface Props {
   n: number,
   row: String,
   bicycle: Array
}

const props = withDefaults(defineProps<Props>(), {
  n: 0,
  row: 0,
  bicycle: []
})

</script>

<script lang="ts">
  export default {
    data: () => ({
      overlay: false,
    }),
  }
</script>