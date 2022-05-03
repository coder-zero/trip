<template>
  <div>
      <OrderItem v-for="item in list" :key="item.id" :item="item"/>
  </div>
</template>

<script>
import OrderItem from './OrderItem/OrderItem.vue'
export default {
  name: 'ScenceOrder',
  props: ['list'],
  components: {
    OrderItem
  }
}
</script>

<style>

</style>