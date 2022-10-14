<template>
  <div>
    <v-app-bar flat border color="primary">
      <v-app-bar-nav-icon @click="drawer=!drawer" />
      <v-app-bar-title class="pl-5">{{title}}</v-app-bar-title>
    </v-app-bar>
    <v-navigation-drawer app v-model="drawer" color="secondary">
      <v-container class="d-flex flex-column h-100 " >
        <v-list nav bg-color="secondary">
          <v-list-item v-for="(navList,i) in navLists" :key="i" :to="navList.to" active-color="primary" >
            <v-list-item-avatar>
              <v-icon :icon="navList.icon" />
            </v-list-item-avatar>
            <v-list-item-title v-text="navList.name"/>
          </v-list-item>
        </v-list>
        <v-divider/>
        <v-list nav bg-color="secondary">
          <v-list-group v-for="(n,i) in spots" :key="i">
              <template v-slot:activator="{ props }" nav>
                <v-list-item v-bind="props" :title="n.name"></v-list-item>
              </template>
              <v-list-item title="管理画面"  :to="'/management/'+n.id" active-color="primary"/>
              <v-list-item title="分析データ"  :to="'/management/'+n.id+'/data'" active-color="primary"/>
          </v-list-group>
        </v-list>
        <v-list nav dense class="mt-auto" bg-color="secondary">
          <v-divider/>
          <v-list-item to="/setting" active-color="primary" class="mt-3">
            <v-list-item-avatar>
              <v-icon icon="mdi-cogs"/>
            </v-list-item-avatar>
            <v-list-item-title>設定</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-container>
    </v-navigation-drawer>
    <v-main>
      <slot />
    </v-main>
  </div>
</template>

<script lang="ts">
export default {
  data(){
    return{
      drawer: null,
      navLists:[
        {name: 'ダッシュボード',icon: 'mdi-vuetify', to: '/'},
        {name: '駐輪場管理',icon: 'mdi-cogs', to: '/management'}
      ],
    }
  }
}
</script>

<script setup lang="ts">

  const { title } = useArticleTitle()
  const { spots } = useSpots()
  
</script>