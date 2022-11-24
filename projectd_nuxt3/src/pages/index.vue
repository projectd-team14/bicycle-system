<template>
  <v-container>
    <div>
      <DashboardViolatin  :color="color" />
      <v-row>
        <v-col lg="3" cols="6">
          <DashboardRequired />
        </v-col>
        <v-col lg="5" cols="6">
          <DashboardCongestion :color="color" />
        </v-col>
        <v-col lg="4" cols="6">
          <DashboardMonthlyTransition />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script lang="ts">
  export default {
    data () {
      return {
        color: ["red","blue","green","purple","pink","indigo","lime","orange"]
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