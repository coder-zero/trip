import {reqGetBannerList, getAllHotelAndRoomAPI, getAllSpotAPI} from '@/api'

const state = {
    //存储轮播图图片
    bannerList: [],
    //存储酒店信息
    hotelList: [],
    //存储景点信息
    scenceList: []
}

const actions = {
    async getBannerList({commit}) {
        let result = await reqGetBannerList()
        if(result.code == 200) {
            commit('GETBANNERLIST', result.data)
        }
    },
    //获取酒店信息
    async getHotelList({commit}, data={}) {
        let result = await getAllHotelAndRoomAPI(data)
        if(result.data.code == 20000) {
            commit('GETHOTELLIST', result.data.data.allHotelAndRoom)
        }
    },
    //获取景点信息
    async getScenceList({commit}, data={}) {
        let result = await getAllSpotAPI(data)
        if(result.data.code == 20000) {
            commit('GETSCENCELIST', result.data.data.allSpot)
        }
    },
    //利用mock模拟
    // async getScenceList({commit}) {
    //     let result = await getAllSpotAPI()
    //     if(result.code == 200) {
    //         commit('GETSCENCELIST', result.data)
    //     }
    // }
}

const mutations = {
    GETBANNERLIST(state, value) {
        state.bannerList = value
    },
    GETHOTELLIST(state, value) {
        state.hotelList = value
    },
    GETSCENCELIST(state, value) {
        state.scenceList = value
    }
}

export default {
    namespaced: true,
    state,
    actions,
    mutations
}