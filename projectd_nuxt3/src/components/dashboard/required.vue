<template>
   <v-card class="my-2 pa-3 card" >
      <v-card-title class="text-h5">
         対応が必要な駐輪場
      </v-card-title>
      <div class="pa-8">
        <v-table>
         <tbody>
            <tr
            v-for="item in desserts"
            :key="item.name"
            >
            <td>{{ item.name }}</td>
            <td>{{ item.number }}</td>
            </tr>
         </tbody>
      </v-table>
      </div>
   </v-card>
</template>

<script setup lang="ts">

</script>

<script>
  export default {
    data () {
      return {
        desserts: [
          {
            name: '○○〇駐輪場',
            number: 6,
          },
          {
            name: '△△△駐輪場',
            number: 2,
          },
          {
            name: '文教駐輪場',
            number: 4,
          }
        ],
      }
    },
  }
</script>