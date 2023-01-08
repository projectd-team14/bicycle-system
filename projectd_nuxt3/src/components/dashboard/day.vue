<template>
    <v-card class="my-2 pa-3 card all" >
       <v-card-title class="text-h5">
          利用者数推移 - １日間
       </v-card-title>
       <div class="px-8">
          <DashboardDayChart class="chart" :chartData="chartData"/>
       </div>
    </v-card>
 </template>
 
 <script setup lang="ts">
 const { dash } = useDash()
 var spotsCount = 0
 
 interface Props {
    color: Array,
 }
 
 const props = withDefaults(defineProps<Props>(), {
   color:[]
 })
 
 const chartData = computed(() => {
    const datasets = []
    const labels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    dash.value.data[0].spots_count_day1.forEach((e, i) => {

    })
    dash.value.data.forEach((e, i) => {
      if (i > 20) {
         spotsCount = 0
      } else {
         spotsCount = spotsCount + 1
      }

       datasets.push(
          {
             label: e.spots_name,
             backgroundColor: props.color[i],
             borderColor: props.color[i],
             data: e.spots_count_day1
          }
       )
    })
    const Data = {
       labels: labels,
       datasets: datasets
    }
    return Data
 })
 
 </script>
 
 <style lang="sass" scoped>
 .all
    height: 360px
.chart
    height: 320px
  
 </style>