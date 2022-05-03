<template>
  <div id="app">
   <router-view v-if="isRouterAlive"/>
  </div>
</template>

<script>
import {initDynamicRoutes} from '@/router/index.js'


export default {
  name: 'app',
  created(){
    if( this.$store.getters.getMenu != null){
      initDynamicRoutes(this.$store.getters.getMenu)
    }
  },
  provide(){
    return{
      reload: this.reload

    }
  },
  data(){
    return {
      isRouterAlive:true
    }
  },
  methods:{
    reload(){
      this.isRouterAlive = false;
      this.$nextTick(function(){
        this.isRouterAlive = true;
      })
    }
  }
}
</script>

<style>
@import './assets/css/font.css';
#nprogress .bar {
  
 height: 5px !important;   
  background: #767ddf  !important;

}
</style>
