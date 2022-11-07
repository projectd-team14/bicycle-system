<template>
   <v-sheet color="white" class="d-flex flex-column justify-center" height="500">
      <ManagementSituationRow v-for="(n,i) in situation" :key="i" :row="n.row" :bicycle="n.bicycle" :n="i" v-if="situation[0].row.length"/>
      <p v-if="!situation[0].row.length" class="d-flex justify-center text-h4 text-grey-darken-1">カメラ停止中</p>
   </v-sheet>
</template>

<script setup lang="ts">

interface Props {
   situation: Array
}

const props = withDefaults(defineProps<Props>(), {
  situation: []
})

</script>