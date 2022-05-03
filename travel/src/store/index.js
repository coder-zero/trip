import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import home from './home.js'
import user from './user.js'
import order from './order'

export default new Vuex.Store({
    modules: {
        home,
        user,
        order
    }
})