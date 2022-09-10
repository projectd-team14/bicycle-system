<template>
<div>
  <v-card class="pa-6 card ma-auto mt-6" v-show="!register">
    <h1 class="mb-4">ログイン</h1>
    <v-form @submit.prevent="login1">
      <v-text-field v-model="user.email" label="mail" required/>
      <v-text-field v-model="user.password" label="password" type="password" required />
      <v-btn :disabled="!user.password" color="success" class="mr-4" type="submit">ログイン</v-btn>
    </v-form>
    <p class="text-right" @click="register = true">新規登録はこちら</p>
  </v-card>
  <v-card class="pa-6 card ma-auto mt-6" v-show="register">
    <h1 class="mb-4">会員登録</h1>
    <v-form @submit.prevent="register1">
      <v-text-field v-model="registerUser.name" label="name" required/>
      <v-text-field v-model="registerUser.email" label="mail" required/>
      <v-text-field v-model="registerUser.password" label="password" required />
      <v-btn :disabled="!registerUser.password" color="success" class="mr-4" type="submit">登録</v-btn>
    </v-form>
    {{registerUser.name}}
    <p class="text-right" @click="register = false">ログインはこちら</p>
  </v-card>
</div>
</template>

<script lang="ts">
  export default {
    data(){
      return {
        user:{
          email:'',
          password:''
        },
        register:false,
        registerUser:{
          name:'',
          email:'',
          password:''
        }
      }
    },
    methods:{
      async login1(){
        const a = await $fetch( '/api/login', {
            method: 'POST',
            body: this.user,
        } );
        const { login } = useAuth();
        const userLogin = await login(a);
      },
      async register1(){
        const b = await $fetch( '/api/register', {
          method: 'POST',
          body: this.registerUser,
        } );
        location.reload();
      }
    }
  }
</script>

<script setup lang="ts">
  definePageMeta({
    layout: false,
  });
</script>

<style lang="sass" scoped>

.card
  min-width: 200px
  max-width: 600px
  p
    cursor: pointer

</style>