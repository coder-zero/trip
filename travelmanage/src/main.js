import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/element.js'
import './assets/css/global.css'
import global_ from '@/assets/js/global.js'
import {Base64} from 'js-base64'
import 'default-passive-events'
import VueParticles from 'vue-particles'
Vue.use(VueParticles)

Vue.prototype.$Base64 = Base64

Vue.prototype.GLOBAL = global_

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
