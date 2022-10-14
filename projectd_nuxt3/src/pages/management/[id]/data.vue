<template>
  <v-container>
    <v-row class="pa-4">
      <v-col cols="12">
        <v-card class="pa-3">
          <div class="d-flex">
            <div>
              <p class="text-h4 pb-4">{{name}} の分析データ</p>
              <p class="text-h5">時間別 - 混雑状況</p>
              <p class="text-h5">{{situationChartData2}}</p>
            </div>
            <div class="w-25  ml-auto">
              <v-select class="pa-4" :items="items" label="期間" v-model="select"/>
            </div>
          </div>
          <ManagementCongestionSituationChart :chartData="chartData.situationChartData[0]" v-if="select == '1日間'" class="chart"/>
          <ManagementCongestionSituationChart :chartData="chartData.situationChartData[1]" v-if="select == '7日間'" class="chart"/>
          <ManagementCongestionSituationChart :chartData="chartData.situationChartData[2]" v-if="select == '1か月間'" class="chart"/>
          <ManagementCongestionSituationChart :chartData="chartData.situationChartData[3]" v-if="select == '3か月間'" class="chart"/>
        </v-card>
      </v-col>
      <v-col cols="12">
        <v-card class="pa-3">
          <p class="text-h5">利用時間別 - 台数分布</p>
          <ManagementNumberChart :chartData="chartData.numberChartData[0]" v-if="select == '1日間'" class="chart"/>
          <ManagementNumberChart :chartData="chartData.numberChartData[1]" v-if="select == '7日間'" class="chart"/>
          <ManagementNumberChart :chartData="chartData.numberChartData[2]" v-if="select == '1か月間'" class="chart"/>
          <ManagementNumberChart :chartData="chartData.numberChartData[3]" v-if="select == '3か月間'" class="chart"/>
        </v-card>
      </v-col>
    </v-row>
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

  const { data: chartData, refresh } = await useFetch('/api/chart',{ params: { id: paramsId  } })
  refresh()
  
</script>

<script lang="ts">
export default {
  data() {
    return {
      items: ['1日間', '7日間', '1か月間', '3か月間'],
      select: '',
    }
  },
  mounted() {
    clearTimeout(this.timeoutID)
    this.timeoutID = setTimeout(() => {
      this.select = "1日間";
    }, 300);
  }
}
</script>

<style lang="sass">

.chart
  height: 350px

</style>