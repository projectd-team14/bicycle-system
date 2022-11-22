<template>
  <v-container>
  <v-card class="pa-4">
  <p class="text-h5 mb-5">ラベル登録</p>
  <img id="img_source" :src="imgURL+'/label/?id='+paramsId" v-on:load="setImage" cover>
  <canvas id="canvas" :width=1280 :height=720 @click="drawSquare(event)"></canvas>

  <v-list-item title="エリアの保存" @click="" />
  <v-list-item title="送信" @click="" />
  </v-card>
  </v-container>
</template>

<script lang="ts">
  export default {
    data: () => ({
      checkbox: false,
      points : [],
      coord : [],
      coodarr : []
    }),
    methods: {
      async storeCamera() {
         const route = useRoute()
         const id = route.params.id
         const a = await $fetch( '/api/setting/storeLabel', {
            method: 'POST',
            body: this.camera,
            params: { id: id }
         } );
         this.$router.push('/setting/')
      },
      async setImage() {
        const image = document.getElementById("img_source"); 
        const imageWidth = image.width;
        const imageHeight = image.height
      },
      async drawSquare() {
        console.log("描画")
      },
      async onButtonClick() {

      }
    },
  }
</script>

<script setup lang="ts">
  const route = useRoute()
  const paramsId = route.params.id
  const config = useRuntimeConfig()
  const imgURL = config.public.FastURL
  const image = document.getElementById("img_source"); 
</script>

<style>
#canvas {
  margin-top : -720px;
  
}
#img_source{
  margin-bottom: -25px;
}
</style>
