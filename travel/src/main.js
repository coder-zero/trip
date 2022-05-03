import Vue from 'vue'
import App from './App.vue'
import store from '@/store'
import router from '@/router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.config.productionTip = false

//引入mock
import '@/mock/mockServe'

import 'swiper/css/swiper.min.css'

Vue.use(ElementUI);

new Vue({
  render: h => h(App),
  store,
  router,
  beforeCreate() {
    Vue.prototype.$bus = this
  }
}).$mount('#app')
