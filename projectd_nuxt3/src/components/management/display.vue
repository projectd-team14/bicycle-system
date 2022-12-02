<template>
   <v-sheet color="grey lighten-3">
      <v-carousel
         hide-delimiter-background
         show-arrows="hover"
         color="white"
         height="auto"
      >
         <v-carousel-item v-for="(a, i) in camera" :key="i" ref="a">
            <div class="video d-flex justify-center align-center">
               <iframe :src=url(a.url) title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen/>
            </div>
            <div class="over">
               <canvas id="canvas"  width="1280" height="640" @mouseover="drawSquare" @mouseout="clearSquare"/>
            </div>
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
</script>

<script lang="ts">
export default {
   data(){
      return {
         desserts:[0,120,220,20,260,40,100,150]
      }
   },
   methods: {
      url(i) {
         i = i.replace('watch?v=', 'embed/')
         const idIndex = i.indexOf('embed/')+6
         const id = i.slice(idIndex)
         i += "?autoplay=1&mute=1&playsinline=1&loop=1&playlist=" + id + "&controls=0&disablekb=1"
         return i;
      },
      con(i){
         return i * 4.25
      },
      drawSquare() {
         const cvs = document.getElementById( "canvas" )
         const context = cvs.getContext('2d')
         context.beginPath()
         context.moveTo(this.con(this.desserts[0]), this.con(this.desserts[1]))
         context.lineTo(this.con(this.desserts[2]), this.con(this.desserts[3]))
         context.lineTo(this.con(this.desserts[4]), this.con(this.desserts[5]))
         context.lineTo(this.con(this.desserts[6]), this.con(this.desserts[7]))
         context.fill()
         context.closePath()
         context.stroke()

         context.fillStyle = "rgb(0,0,0)"
         context.textAlign = "center"
         context.font = 'bold 140px "ＭＳ ゴシック"'
         context.fillText('A', (this.con(this.desserts[0]+this.desserts[4]))/2+100, (this.con(this.desserts[1]+this.desserts[5]))/2)
         context.fillStyle = "rgba(0,0,255,0.3)"
      },
      clearSquare() {
         const cvs = document.getElementById( "canvas" )
         const context = cvs.getContext('2d')
         context.clearRect(0, 0, 1280, 640)
      }
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