<template>
   <v-sheet color="grey lighten-3">
      <v-carousel
         hide-delimiter-background
         show-arrows="hover"
         color="white"
      >
         <v-carousel-item
            v-for="(a, i) in camera"
            :key="i"
         >
            <div class="d-flex fill-height justify-center align-center">
               <iframe  width="100%" height="100%" :src=url(a.url) title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
         </v-carousel-item>
      </v-carousel>
   </v-sheet>
</template>

<script setup lang="ts">

interface Props {
   camera: Array
}

const props = withDefaults(defineProps<Props>(), {
  camera: []
})

</script>

<script lang="ts">
export default {
   methods: {
      url(i) {
         return (
            i = i.replace('watch?v=', 'embed/')
         );
      },
   },

}
</script>