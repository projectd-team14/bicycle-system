<template>
   <v-card class="my-2 card all overflow-auto" >
      <v-card-title class="text-h5">
         対応が必要な駐輪場
      </v-card-title>
      <div class="pa-6">
        <v-table>
          <thead>
            <tr>
              <td>駐輪場名</td>
              <td>放置自転車</td>
              <td>上限</td>
          </tr>
          </thead>
          <tbody>
            <tr
            v-for="(v, k) in dash.data"
            :key="k"
            >
            <td>{{ v.spots_name }}</td>
            <td>{{violatinArr[k]}}台</td>
            <td>{{( Math.floor(v.spots_over_time / 3600))}}時間</td>
            </tr>
          </tbody>
      </v-table>
      </div>
   </v-card>
</template>

<script setup lang="ts">
  const { dash } = useDash()
  const { spots } = useSpots()

const violatinArr = computed(() => {
  const arr = []
  spots.value.forEach((e, i) => {
    e.situation.forEach((e, i) => {
      arr.push(e.bicycle.filter(e => e.violatin_status == true).length)
    })
  })
  return arr
})

</script>

<script lang="ts">
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

<style lang="sass" scoped>
.all
   height: 360px
</style>