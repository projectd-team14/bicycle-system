<template>
  <v-container>
  <v-card class="pa-4">
  <p class="text-h5 mb-5">ラベル登録</p>
  <img id="img_source" :src="imgURL+'/label/?id='+paramsId" v-on:load="setImage" cover>
  <canvas id="canvas" :style="('width: 100%; height: 100%;')" @click="drawSquare"></canvas>
  <v-list-item title="エリアの保存" @click="onClickSaveButton" />
  <v-list-item title="送信" @click="onClickPostButton" />
  </v-card>
  </v-container>
</template>

<script lang="ts">
  var points = [];
  var post_poins = [];
  var rate_w;
  var rate_h;
  var image;
  var cvs;
  var ctx;
  var coord = [];
  var coordarr = {};
  var data = [];

  export default {
    data: () => ({
      checkbox: false,
    }),
    methods: {
      async storeLabel() {
        const route = useRoute()
        const id = route.params.id
        const a = await $fetch( '/api/setting/storeLabel', {
          method: 'POST',
          body: data,
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
        ctx.drawImage(image, 0, 0); 

        const element = document.getElementById("img_source"); 
        element.remove();
      },
      async drawSquare(e) {
        // 縦横比の変換処理を入れる
        var client_w = document.getElementById('canvas').clientWidth;
        var client_h = document.getElementById('canvas').clientHeight;
        rate_w = client_w / image.width; 
        rate_h = client_h / image.height; 
        var rect = e.target.getBoundingClientRect()
        var x = (e.clientX - rect.left) / rate_w
        var y = (e.clientY - rect.top) / rate_h
        console.log("点の位置",x,y)
        console.log("増加量",rate_w,rate_h)
        console.log(image.width);
        console.log(image.height);
        console.log(client_w);
        console.log(client_h);

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
          var r = Math.floor(Math.random() * 200) ;
          var g = Math.floor(Math.random() * 200) ;
          var b = Math.floor(Math.random() * 200) ;
          var color = "rgba(" + r + "," + g + "," + b + ",0.5)";
          coord =[s[0],s[1],s[2],s[3], color];
          points=[];
        }
        for (var i = 0; i<post_poins.length; i++) {
          ctx.beginPath();
          ctx.fillStyle = post_poins[i][4];
          ctx.moveTo(post_poins[i][0][0], post_poins[i][0][1]);
          ctx.lineTo(post_poins[i][1][0], post_poins[i][1][1]);
          ctx.lineTo(post_poins[i][2][0], post_poins[i][2][1]);
          ctx.lineTo(post_poins[i][3][0], post_poins[i][3][1]);
          ctx.closePath();
          ctx.fill();          
        }
      },
      async onClickSaveButton() {
        if (coord.length === 5){
          post_poins.push(coord);
        }
        console.log(post_poins);
      },
      async onClickPostButton() {
        data =[];

        for (var i = 0; i<post_poins.length; i++) {
          var json_template = {
            "label_mark": i,
            "label_point1X" : post_poins[i][0][0],
            "label_point1Y" : post_poins[i][0][1],
            "label_point2X" : post_poins[i][1][0],
            "label_point2Y" : post_poins[i][1][1],
            "label_point3X" : post_poins[i][2][0],
            "label_point3Y" : post_poins[i][2][1],
            "label_point4X" : post_poins[i][3][0],
            "label_point4Y" : post_poins[i][3][1]
            };
            data.push(json_template);
        }

        this.storeLabel();
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
}
#img_source{
}
</style>
