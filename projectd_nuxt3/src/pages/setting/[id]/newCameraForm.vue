<template>
<v-container>
<v-card class="pa-4">
<p class="text-h5 mb-5">新規登録用フォーム</p>
  <v-form @submit.prevent="storeCamera">
    <v-text-field
      v-model="camera.cameras_name"
      label="Name"
      required
    ></v-text-field>

    <v-text-field
      v-model="camera.cameras_url"
      label="URL"
      required
    ></v-text-field>

   <v-checkbox
      v-model="checkbox"
      :rules="[v => !!v || 'You must agree to continue!']"
      label="Do you agree?"
      required
    ></v-checkbox>

    <v-btn :disabled="!checkbox" color="success" class="mr-4" type="submit">送る</v-btn>

  </v-form>
</v-card>
</v-container>
</template>

<script lang="ts">
  export default {
    data: () => ({
      checkbox: false,
      camera:{
         cameras_name: '',
         cameras_url: 'https://www.youtube.com/watch?v=9plqYTT-3w8',
      }
    }),
    methods: {
      async storeCamera(){
         const route = useRoute()
         const id = route.params.id
         const a = await $fetch( '/api/setting/storeCamera', {
            method: 'POST',
            body: this.camera,
            params: { id: id }
         } );
         this.$router.push('/setting/')
      }
    },
  }
</script>

<script setup lang="ts">
  const { title } = useArticleTitle()
  const { spots } = useSpots()
  onMounted( async () => {title.value = '設定 / '+name})

  const route = useRoute()
  const paramsId = route.params.id
  const index = spots.value.findIndex(({id}) => id == paramsId)
  const name = spots.value[index].name

</script>