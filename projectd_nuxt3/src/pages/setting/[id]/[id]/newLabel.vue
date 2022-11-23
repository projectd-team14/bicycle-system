<template>
  <v-container>
  <v-card class="pa-4">
  <p class="text-h5 mb-5">ラベル登録</p>
  <img id="img_source" :width=1280 :height=720  :src="imgURL+'/label/?id='+paramsId" v-on:load="setImage" cover>
  <canvas id="canvas" :width=1280 :height=720 @click="drawSquare"></canvas>

  <v-list-item title="エリアの保存" @click="" />
  <v-list-item title="送信" @click="" />
  </v-card>
  </v-container>
</template>

<script lang="ts">
  var points = [];
  var image;
  var cvs;
  var ctx;
  var coord=[];
  var coordarr={};

  export default {
    data: () => ({
      checkbox: false,
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
        cvs = document.getElementById('canvas');
        ctx = cvs.getContext('2d'); 
        image = document.getElementById("img_source"); 
        cvs.width  = image.width;
        cvs.height = image.height;
        ctx.drawImage(image,0,0); 
      },
      async drawSquare(e) {
        var rect = e.target.getBoundingClientRect()
        var x = e.clientX - rect.left
        var y = e.clientY - rect.top
        points.push([x,y]);

        if (points.length > 4){
          points.shift();
        }

        ctx.clearRect(0, 0, cvs.width, cvs.height);
        ctx.strokeStyle = "#14ff10";
        ctx.fillStyle   = "#ff6b6b";
        ctx.lineWidth   = 2;

        for (let i in points){
          ctx.drawImage(image,0,0); 
          ctx.beginPath();
          ctx.arc(points[i][0], points[i][1], 3, 0, Math.PI*2, true);
          ctx.fill();
        }
        
        if (points.length === 4) {
          // 四角を描く
          let p = points.slice(0, points.length);
          let s = [];
          let is_cross = function(line1, line2) {
              var l1_from  = line1[0];
              var l1_to    = line1[1];
              var l2_from  = line2[0];
              var l2_to    = line2[1];
              var line_formula = function(l){
                  return l[1]-l1_from[1]-(l[0]-l1_from[0])*(l1_to[1]-l1_from[1])/(l1_to[0]-l1_from[0]);
                  
              }
              return line_formula(l2_from)*line_formula(l2_to)<0;
              
            }

            if (is_cross([p[0], p[1]] , [p[2], p[3]])){
                s = [p[0], p[2], p[1] , p[3]];
            }
            else if (is_cross([p[0], p[2]] , [p[1], p[3]])){
                s = [p[0], p[1], p[2] , p[3]];
            }
            else {
                s = [p[0], p[1], p[3] , p[2]];
            }
            
            for (let i=0,j=s.length; i<j; i++){
                ctx.beginPath();
                ctx.moveTo(s[i][0] , s[i][1]);
                let k = (i === s.length -1 ? 0 : i + 1);
                ctx.lineTo(s[k][0] , s[k][1]);
                ctx.stroke();
            }
            coord =[s[0],s[1],s[2],s[3]];
            points=[];
          }
        console.log(coord);
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
