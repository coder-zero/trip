import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: sessionStorage.getItem('token'),
    userMsg: JSON.parse(sessionStorage.getItem('user') || '[]'),
    MenuList: sessionStorage.getItem('MenuList') ? JSON.parse(sessionStorage.getItem("MenuList")): null, 

  },
  getters:{
    getToken(state){
        return state.token;
    },
    getUser(state){
      return state.userMsg;
    },
    getUserName(state){
      return state.userMsg.name;
    },
    getRoleId(state){
      return state.userMsg.roleId;
    },
    getMenu(state){
      return state.MenuList;
    }
  },
  mutations: {
    initToken(state) {
      state.token = sessionStorage.getItem('token') 
      console.log(state.token)
    },
    setUserMsg(state,data) {
      state.userMsg = data
    },
    getMenuList(state) {
      state.MenuList = sessionStorage.getItem('MenuList') ? JSON.parse(sessionStorage.getItem("MenuList")): null
    }
 
 
  },
  actions: {
    getuserMsgsyhc(context){
      context.commit('getuserMsg',JSON.parse(sessionStorage.getItem('user') || '[]'))
    }
  },
  modules: {
  }
})
