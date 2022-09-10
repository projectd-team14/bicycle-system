<template>
   <v-sheet color="grey lighten-3" class="ma-6 d-flex flex-column " height="500">
      <ManagementSituationRow v-for="(n,i) in situation" :key="i" :row="n.row" :bicycle="n.bicycle" :n="i"/>
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