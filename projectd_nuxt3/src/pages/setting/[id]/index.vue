<template>
   <v-container>
      <v-card class="pa-3">
         <p class="text-h5 mb-0">カメラ設定</p>
         <v-list nav>
          <v-list-group v-for="(n,i) in spots[index].camera" :key="i">
              <template v-slot:activator="{ props }" nav>
                <v-list-item v-bind="props" :title="n.name"></v-list-item>
              </template>
              <v-list-item title="ラベル登録" :to="'/setting/'+paramsId+'/'+n.id+'/newLabel'" />
              <v-list-item title="削除" @click="deleteCamera(n.id)" />
              <v-list-item title="検出開始" @click="startCamera(n.id)" />
              <v-list-item title="検出停止" @click="stopCamera(n.id)" />
          </v-list-group>
          <v-list-item title="新規登録" :to="'/setting/'+ paramsId +'/newCameraForm'" />
        </v-list>
      </v-card>
      <v-card class="pa-3 mt-6">
         <p class="text-h5 mb-0">駐輪場設定</p>
         <v-list nav>
          <v-list-item title="駐輪場の削除" @click="deleteSpot"/>
        </v-list>
      </v-card>

      <v-snackbar v-model="snackBar" multi-line color="secondary">
      {{snackText}}
        <template v-slot:actions>
          <v-btn variant="text" @click="snackBar = false">Close</v-btn>
        </template>
      </v-snackbar>
   </v-container>
</template>

<script lang="ts">
  export default {
    data: () => ({
      snackText: "",
      snackBar: false,
    }),
    methods:{
      async deleteCamera(e){
        const b = await $fetch( '/api/setting/deleteCamera', {
            method: 'POST',
            body: 1,
            params: { id: e }
        } );
        this.$router.push('/setting/')
      },
      async startCamera(e){
        const b = await $fetch( '/api/setting/startCamera', {
            method: 'POST',
            body: 1,
            params: { id: e }
        } );
        console.log(b);
        this.snackText = b;
        this.snackBar = true;
      },
      async stopCamera(e){
        const b = await $fetch( '/api/setting/stopCamera', {
            method: 'POST',
            body: 1,
            params: { id: e }
        } );
        console.log(b);
        this.snackText = b;
        this.snackBar = true;
      },
      async deleteSpot(){
        const route = useRoute()
        const id = route.params.id
        const c = await $fetch( '/api/setting/deleteSpots', {
            method: 'POST',
            body: 1,
            params: { id: id }
        } );
        location.reload()
      }
    }
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