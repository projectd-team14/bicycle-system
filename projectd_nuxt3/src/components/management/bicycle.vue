<template>
   <div>
      <v-card width="300px" v-bind="props">
        <v-card-title class="bg-light-blue-lighten-3 text-center" v-if="!bicycle.violatin_status" >{{bicycle.time}}時間</v-card-title>
        <v-card-title class="bg-red-lighten-1 text-center" v-if="bicycle.violatin_status" >{{bicycle.time}}時間</v-card-title>
        <v-img :src="imgURL+'/bicycle/?camera_id=8&bicycle_id='+bicycle.id" height="300" cover></v-img>
        <v-card-title class="bg-grey-lighten-3 text-center">ID: {{bicycle.id}}</v-card-title>
      </v-card>
   </div>
</template>

<script setup lang="ts">
interface Props {
   bicycle: Array
}

const props = withDefaults(defineProps<Props>(), {
  bicycle: []
})

const config = useRuntimeConfig()
const imgURL = config.public.FastURL

</script>

<script lang="ts">
  export default {
    data: () => ({
      overlay: false,
    }),
  }
</script>