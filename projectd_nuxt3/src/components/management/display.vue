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

export default {
   data(){
      return {
         desserts:[0,120,220,20,260,40,100,150],
         label:[]
      }
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
         context.beginPath()
         context.moveTo(this.label[0].data[0].label_point1X , this.label[0].data[0].label_point1Y)
         context.lineTo(this.label[0].data[0].label_point2X , this.label[0].data[0].label_point2Y)
         context.lineTo(this.label[0].data[0].label_point3X , this.label[0].data[0].label_point3Y)
         context.lineTo(this.label[0].data[0].label_point4X , this.label[0].data[0].label_point4Y)
         context.fillStyle = "rgba(0,0,255,0.3)"
         context.fill()
         context.closePath()
         context.stroke()

         context.fillStyle = "rgb(0,0,0)"
         context.textAlign = "center"
         context.font = 'bold 140px "ＭＳ ゴシック"'
         context.fillText('A', this.label[0].data[0].label_point1X , this.label[0].data[0].label_point1Y)
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
      },
   },
   async mounted(){
      const route = useRoute()
      const id = route.params.id
      console.log(id);
      const { data: labels } = await useFetch('/api/manage',{ params: { id: id } ,key: "label" + id})
      console.log(labels.value[0])
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