<template>
  <v-container>
    <v-row>
      <v-col v-for="(v, k) in spots" :key="k" lg="6" cols="12">
        <ManagementCard :name="v.name" :address="v.address" :count="v.count" :max="v.max" :camera="v.camera" :to="'/management/'+v.id"/>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup lang="ts">
  const { spots } = useSpots()
  const { title } = useArticleTitle()
  onMounted(() => title.value = '駐輪場管理')
</script>