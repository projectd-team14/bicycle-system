<template>
   <v-sheet color="lighten-3">
      <v-carousel
         hide-delimiter-background
         show-arrows="hover"
         color="white"
         height="auto"
      >
         <v-carousel-item v-for="(a, i) in camera" :key="i">
            <img :id="'img_source'+i" :src="imgURL+'/label/?id='+a.id" v-on:load="setImage(i)" cover>
            <canvas :id="'canvas'+i" :style="('width: 100%;')"></canvas>
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
  var labelData;
  var data;

export default {
   data(){
      return {

      }
   },
   unmounted() {
      // ここに２回目の処理を記述する必要がある
   },
   methods: {
      url(i) {
         i = i.replace('watch?v=', 'embed/')
         const idIndex = i.indexOf('embed/')+6
         const id = i.slice(idIndex)
         i += "?autoplay=1&mute=1&playsinline=1&loop=0&playlist=" + id + "&controls=0&disablekb=1"
         return i;
      },
      setImage(i) {
         cvs = document.getElementById('canvas'+ i);
         ctx = cvs.getContext('2d'); 
         image = document.getElementById("img_source" + i); 
         cvs.width  = image.width;
         cvs.height = image.height;
         ctx.drawImage(image, 0, 0); 
         const element = document.getElementById("img_source" + i); 
         element.remove();

         if (labelData.value[i].labels_json === 'None') {
            // console.log(labelData.value[i].cameras_id)
         } else {
            for (let i2 = 0; i2 < labelData.value[i].labels_json.length; i2++) {
               data = labelData.value[i].labels_json[i2];

               this.createLabel(data);
            }
         }
      },
      createLabel(data) {
         var r = Math.floor(Math.random() * 200) ;
         var g = Math.floor(Math.random() * 200) ;
         var b = Math.floor(Math.random() * 200) ;
         var color = "rgba(" + r + "," + g + "," + b + ",0.5)";

         ctx.beginPath();
         ctx.fillStyle = color;
         ctx.moveTo(data.label_point1X, data.label_point1Y);
         ctx.lineTo(data.label_point2X, data.label_point2Y);
         ctx.lineTo(data.label_point3X, data.label_point3Y);
         ctx.lineTo(data.label_point4X, data.label_point4Y);
         ctx.closePath();
         ctx.fill(); 
      }
   },
   async mounted() {
      const route = useRoute()
      const id = route.params.id
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