<template>
  <div>
      <OrderItem v-for="item in list" :key="item.id" :item="item" :roomList="item.roomList"/>
  </div>
</template>

<script>
import OrderItem from './OrderItem/OrderItem.vue'
export default {
  name: 'HotelOrder',
  props: ['list'],
  components: {
    OrderItem
  }
}
</script>

<style>

</style>