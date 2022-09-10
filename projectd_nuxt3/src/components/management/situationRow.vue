<template>
   <v-sheet  v-if="n != 0" color="grey" class="flex-grow-1">
   </v-sheet>
   <v-sheet color="white" class="flex-grow-1 d-flex flex-row align-center ma-1" style="position: relative;" border >
      <p style="position: absolute; top: 0px;">{{row}}列</p>
      <ManagementBicycle v-for="(n,i) in bicycle" :key="i" :bicycle="n" /> 
   </v-sheet>
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