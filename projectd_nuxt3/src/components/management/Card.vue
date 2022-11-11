<template>
   <v-card class="my-2 card">
      <v-row>
         <v-col>
            <v-card-title class="text-h4 mt-4">
               {{name}}
            </v-card-title>
            <v-card-subtitle>
               {{address}}
            </v-card-subtitle>
            <v-list-item density="compact" class="mt-2">
               <v-list-item class="text-h6 pa-0">混雑状況：</v-list-item>
               <v-list-item class="pa-0">
                  <v-chip class="my-2 " color="cyan" label v-if="count < max">空車</v-chip>
                  <v-chip class="my-2 " color="red" label v-if="count >= max">満車</v-chip>
               </v-list-item>
            </v-list-item>
         </v-col>
         <v-col class="ma-3 cardImg">
            <v-img :src="'http://localhost:9000/label/?id='+ camera[0].id" height="225" cover/>
         </v-col>
      </v-row>
   </v-card>
</template>

<script setup lang="ts">

interface Props {
   name: String,
   address: String,
   count: Number,
   max: Number,
   camera: Array,
}

const props = withDefaults(defineProps<Props>(), {
  name: '駐輪場',
  max: 1,
  count: 1
})

const config = useRuntimeConfig()
const imgURL = config.public.FastURL

</script>