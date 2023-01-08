<template>
   <v-card class="my-2 pa-3 card" >
      <v-card-title class="text-h5">
         違法駐輪数推移 - １ヶ月間
      </v-card-title>
      <div class="px-8">
         <DashboardViolatinChart class="chart" :chartData="chartData"/>
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
      const labels = []
      dash.value.data[0].spots_violations.forEach((e, i) => {
         var dt = new Date()
         dt.setDate(dt.getDate() - i)
         labels.unshift(dt.getMonth()+"/"+dt.getDate())
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
               backgroundColor: props.color[spotsCount],
               borderColor: props.color[spotsCount],
               data: e.spots_violations
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

.chart
  height: 400px

</style>