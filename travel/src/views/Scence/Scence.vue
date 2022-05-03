<template>
  <div>
      <ScencelItem v-for="item in scenceList" :key="item.id" :item="item"/>
  </div>
</template>

<script>
import {mapState} from 'vuex'
import ScencelItem from './ScenceItem/ScenceItem.vue'
export default {
  name: 'scence',
  components: {
      ScencelItem
  },
  mounted() {
    this.$store.dispatch("home/getScenceList");
  },
  computed: {
    ...mapState("home", ["scenceList"])
  },
}
</script>

<style>

</style>