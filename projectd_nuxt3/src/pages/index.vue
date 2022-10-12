<template>
  <v-container>
    <div>
      <DashboardViolatin />
      <v-row>
        <v-col lg="3" cols="6">
          <DashboardRequired />
        </v-col>
        <v-col lg="5" cols="6">
          <DashboardCongestion />
        </v-col>
        <v-col lg="4" cols="6">
          <DashboardMonthlyTransition />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script setup lang="ts">

  const { title } = useArticleTitle()
  onMounted(() => title.value = 'ダッシュボード')

  const { loginUser } = useAuth()

  const { spots } = useSpots()
  const { data: props } = await useFetch('/api/deal',{ params: { id: loginUser.value.user.id  } })
  spots.value = props

</script>