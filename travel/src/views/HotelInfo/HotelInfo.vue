<template>
  <div>
      <HotelItem v-for="item in hotelList" :key="item.id" :item="item"/>
  </div>
</template>

<script>
import {mapState} from 'vuex'
import HotelItem from './HotelItem/HotelItem'
export default {
  name: 'HotelInfo',
  components: {
    HotelItem
  },
  mounted() {
    this.$store.dispatch("home/getHotelList");
  },
  computed: {
    ...mapState("home", ["hotelList"]),
  },
}
</script>

<style>

</style>