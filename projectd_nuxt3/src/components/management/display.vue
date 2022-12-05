<template>
   <v-sheet color="lighten-3">
      <v-carousel
         hide-delimiter-background
         show-arrows="hover"
         color="white"
         height="auto"
      >
         <v-carousel-item v-for="(a, i) in camera" :key="i">
            <img id="img_source" :src="imgURL+'/label/?id='+a.id" v-on:load="setImage" cover>
            <canvas id="canvas" :style="('width: 100%;')"></canvas>
         </v-carousel-item>
      </v-carousel>
   </v-sheet>
</template>

<script setup lang="ts">

interface Props {
   camera: Array,
   situation: Array
}

const props = withDefaults(defineProps<Props>(), {
  camera: [],
  situation: []
})

const config = useRuntimeConfig()
const imgURL = config.public.FastURL

</script>

<script lang="ts">
  var image;
  var cvs;
  var ctx;
  var loadCheck = true;
  var labelData;

export default {
   data(){
      return {
         desserts:[0,120,220,20,260,40,100,150],
         label:[]
      }
   },
   unmounted() {
      const element = document.getElementById("canvas"); 
         element.remove();
         console.log("削除")
         loadCheck = false;
   },
   methods: {
      url(i) {
         i = i.replace('watch?v=', 'embed/')
         const idIndex = i.indexOf('embed/')+6
         const id = i.slice(idIndex)
         i += "?autoplay=1&mute=1&playsinline=1&loop=0&playlist=" + id + "&controls=0&disablekb=1"
         return i;
      },
      drawSquare() {
         const cvs = document.getElementById("canvas")
         const context = cvs.getContext('2d')
      },
      clearSquare() {
         const cvs = document.getElementById( "canvas" )
         const context = cvs.getContext('2d')
         context.clearRect(0, 0, 1280, 640)
      },
      setImage() {
         cvs = document.getElementById('canvas');
         ctx = cvs.getContext('2d'); 
         image = document.getElementById("img_source"); 
         cvs.width  = image.width;
         cvs.height = image.height;
         ctx.drawImage(image, 0, 0); 
         const element = document.getElementById("img_source"); 
         element.remove();
        

         for (let i = 0; i < labelData.value.length; i++) {
           
            for (let i2 = 0; i2 < labelData.value[i].labels_json.length; i2++) {
                console.log(labelData.value.length);
               if (labelData.value[i].labels_json[i2].label_mark === 'None') {
                  console.log('aaaa')
               } else {
                  console.log('bbbb')
               }
            }
         }
      }
   },
   async mounted() {
      const route = useRoute()
      const id = route.params.id
      console.log(id);
      const { data: labels } = await useFetch('/api/manage',{ params: { id: id } ,key: "label" + id})
      
      labelData = labels
   }
}
</script>

<style lang="sass" scoped>

.video
   pointer-events: none
   iframe
      width:100%
      aspect-ratio:16/9

.over
   position: absolute
   top:0px
   width:100%
   height:100%
   z-index: 10
   canvas
      width:100%
      height:100%

</style>