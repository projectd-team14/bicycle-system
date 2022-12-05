<template>
  <v-container>
    <div>
      <DashboardViolatin  :color="color" />
      <v-row>
        <v-col lg="3" cols="6">
          <DashboardRequired />
        </v-col>
        <v-col lg="3" cols="6">
          <DashboardCongestion :color="color" />
        </v-col>
        <v-col lg="6" cols="6">
          <DashboardDay :color="color" />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script lang="ts">
const colorList = [];

for (let i = 0; i < 20; i++) {
  var r = Math.floor(Math.random() * 200) ;
  var g = Math.floor(Math.random() * 200) ;
  var b = Math.floor(Math.random() * 200) ;
  var colorCode = "rgba(" + r + "," + g + "," + b + ",0.6)";

  colorList.push(colorCode);
}

  export default {
    data () {
      return {
        color: colorList
      }
    }
  }
</script>

<script setup lang="ts">

  const { title } = useArticleTitle()
  onMounted(() => title.value = 'ダッシュボード')

  const { loginUser } = useAuth()

  const { spots } = useSpots()
  const { data: props } = await useFetch('/api/deal',{ params: { id: loginUser.value.user.id  } })
  spots.value = props
  
  const { dash } = useDash()
  dash.value = await useFetch('/api/dashboard',{ params: { id: loginUser.value.user.id  } })

</script>