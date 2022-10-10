<template>
   <v-card class="my-2 pa-3 card" >
      <v-card-title class="text-h5">
         違法駐輪数推移
      </v-card-title>
      <div class="px-8">
         <DashboardViolatinChart class="chart" />
      </div>
   </v-card>
</template>

<script setup lang="ts">

</script>

<style lang="sass">

.chart
  height: 350px

</style>