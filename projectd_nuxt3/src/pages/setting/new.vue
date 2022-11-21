<template>
<v-container>
<v-card class="pa-4">
<p class="text-h5 mb-5">新規登録用フォーム</p>
  <v-form @submit.prevent="storeSpot">
    <v-text-field
      v-model="spots.spots_name"
      label="Name"
      required
    ></v-text-field>

    <v-text-field
      v-model="spots.spots_url"
      label="URL"
      required
    ></v-text-field>

   <v-text-field
      v-model="spots.spots_address"
      label="Address"
      required
    ></v-text-field>

   <v-text-field
      v-model="spots.spots_over_time"
      label="Over Time"
      required
    ></v-text-field>

    <v-text-field
      v-model="spots.spots_max"
      label="Capacity"
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
      spots:{
         spots_name: '',
         spots_url: 'https://www.youtube.com/embed/9plqYTT-3w8',
         spots_address: '',
         spots_img: '',
      }
    }),

    methods: {
      async storeSpot(){
         const { loginUser } = useAuth();
         const a = await $fetch( '/api/setting/storeSpot', {
            method: 'POST',
            body: this.spots,
            params: { id: loginUser.value.user.id }
         } );
         location.reload()
      }
    },
  }
</script>

<script setup lang="ts">
  const { title } = useArticleTitle()
  onMounted( async () => {title.value = '設定'})
</script>