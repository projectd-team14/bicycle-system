<template>
  <v-container>
    <h1>動作確認</h1>
    <h1>ログイン：{{loginUser.user.name}}</h1>
    <v-btn @click="userLogout">ログアウト</v-btn>
  </v-container>
</template>

<script setup lang="ts">

  const { title } = useArticleTitle()
  onMounted(() => title.value = 'ダッシュボード')

  const { loginUser, logout } = useAuth()

  const userLogout = async () => {
    await logout()
  }

  const { spots } = useSpots()
  const { data: props } = await useFetch('/api/deal',{ params: { id: loginUser.value.user.id  } })
  spots.value = props

</script>