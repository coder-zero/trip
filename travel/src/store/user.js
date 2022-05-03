import { reqUserLogin, reqUserRegister, getUserInfo, editPassAPI } from "@/api"

const state = {
    userInfo: {}
}

const actions = {
    async userLogin({ dispatch, commit }, data) {
        let result = await reqUserLogin(data)
        if (result.data.code == 20000) {
            return 'ok'
        } else {
            return Promise.reject(new Error('用户名或密码错误'))
        }
    },
    async userRegister({ commit }, data) {
        let result = await reqUserRegister(data)
        if (result.data.code == 20000) {
            return 'ok'
        } else {
            return Promise.reject(new Error('fail'))
        }
    },
    async getUserInfo({ commit }) {
        let result = await getUserInfo()
        if (result.data.code == 20000) {
            commit('GETUSERINFO', result.data.data.user)
            return result.data.data.user
        } else {
            return Promise.reject(new Error('fail'))
        }
    },
    async changePass({ commit }, data) {
        let result = await editPassAPI(data)
        console.log(result);
        if (result.data.code == 20000) {
            return 'ok'
        } else {
            return Promise.reject(new Error('fail'))
        }
    },
}

const mutations = {
    GETUSERINFO(state, value) {
        // localStorage.removeItem('userInfo')
        localStorage.setItem('userInfo', JSON.stringify(value))
        state.userInfo = JSON.parse(localStorage.getItem('userInfo'))
    }
}

const getters = {

}

export default {
    namespaced: true,
    state,
    actions,
    mutations
}