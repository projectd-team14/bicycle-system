<template>
   <v-card class="my-2 pa-3 card" >
      <v-card-title class="text-h5">
        違法駐輪の数(月)
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
            <td>{{ item.ratio }}</td>
            </tr>
         </tbody>
      </v-table>
      </div>
   </v-card>
</template>

<script setup lang="ts">

</script>

<script lang="ts">
  export default {
    data () {
      return {
        desserts: [
          {
            name: '○○〇駐輪場',
            number: 1,
            ratio: '先月比▲',
          },
          {
            name: '△△△駐輪場',
            number: 3,
            ratio: '先月比▼',
          },
          {
            name: '文教駐輪場',
            number: 1,
            ratio: '先月比▲',
          }
        ],
      }
    },
  }
</script>