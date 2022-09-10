<template>
   <div>
      <v-tooltip location="bottom" v-if="!bicycle.violatin_status">
         <template v-slot:activator="{ props }">
         <v-icon
            color="black"
            dark
            v-bind="props"
            class="mr-1"
         >
            mdi-bicycle
         </v-icon>
         </template>
         <span>{{bicycle.time}}時間</span>
      </v-tooltip>

      <v-tooltip location="bottom" v-else>
         <template v-slot:activator="{ props }">
         <v-icon
            color="red"
            dark
            v-bind="props"
            class="mr-1"
            @click="overlay = !overlay"
         >
            mdi-bicycle
         </v-icon>
         </template>
         <span>{{bicycle.time}}時間!!!</span>
      </v-tooltip>

      <v-dialog v-model="overlay" persistent class="align-center justify-center">
         <v-card>
            <v-card-text class="d-flex">
               <img :src="`http://host.docker.internal:8000/${bicycle.violatin_img}`" >
               <v-table density="compact">
                  <tbody>
                     <tr>
                        <td>ID</td>
                        <td>{{ bicycle.id }}</td>
                     </tr>
                     <tr>
                        <td>停車時間</td>
                        <td>{{ bicycle.time }}時間</td>
                     </tr>
                  </tbody>
               </v-table>
            </v-card-text>
            <v-card-actions>
               <v-spacer></v-spacer>
               <v-btn
               color="success"
               @click="overlay = false"
               >
               閉じる
               </v-btn>
            </v-card-actions>
         </v-card>
      </v-dialog>
   </div>
</template>

<script setup lang="ts">
interface Props {
   bicycle: Array
}

const props = withDefaults(defineProps<Props>(), {
  bicycle: []
})

</script>

<script lang="ts">
  export default {
    data: () => ({
      overlay: false,
    }),
  }
</script>