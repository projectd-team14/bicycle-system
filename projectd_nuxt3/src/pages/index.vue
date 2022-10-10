<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <DashboardViolatin />
      </v-col>
    </v-row>
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