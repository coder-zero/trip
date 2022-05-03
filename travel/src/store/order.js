import {insertRoomOrderAPI, delOrderAPI, getOrderInfo, getRoomInfo,
    insertTicketOrderAPI, getTicketBySpotIdAPI, delTicketOrderAPI, getTicketOrderByUserIdAPI
} from '@/api'


const state = {

}

const actions = {
    async postRoomOrder({commit}, data) {
        let result = await insertRoomOrderAPI(data)
        if(result.data.code == 20000) {
            return 'ok'
        }else {
            return Promise.reject(new Error('fail'))
        }
    },
   
    async deleteHotelOrder({commit}, data) {
        let result = await delOrderAPI(data)
        if(result.data.code == 20000) {
            return result
        }else {
            return Promise.reject(new Error('fail'))
        }
    },

    async getHotelOrderList({commit}, data) {
        let result = await getOrderInfo(data)
        if(result.data.code == 20000) {
            return result.data.data.orderByUserId
        }else {
            return Promise.reject(new Error('fail'))
        }
    },
    async getRoomInfo({commit}, data) {
        let result = await getRoomInfo(data)
        if(result.data.code == 20000) {
            return result.data.data.roomByHotelId
        }else {
            return Promise.reject(new Error('fail'))
        }
    },


    //根据景点id获取门票
    async getTicketInfo({commit}, data) {
        let result = await getTicketBySpotIdAPI(data)
        if(result.data.code == 20000) {
            return result.data.data.list
        }else {
            return Promise.reject(new Error('fail'))
        }
    },

    //获取门票订单
    async getTicketOrderList({commit}, data) {
        let result = await getTicketOrderByUserIdAPI(data)
        if(result.data.code == 20000) {
            return result.data.data.ticketOrderByUserId
        }else {
            return Promise.reject(new Error('fail'))
        }
    },

    //预定门票
     async postTicketOrder({commit}, data) {
        let result = await insertTicketOrderAPI(data)
        if(result.data.code == 20000) {
            return 'ok'
        }else {
            return Promise.reject(new Error('fail'))
        }
    },

    //删除门票订单信息
    async deleteTicketOrder({commit}, data) {
        let result = await delTicketOrderAPI(data)
        if(result.data.code == 20000) {
            return 'ok'
        }else {
            return Promise.reject(new Error('fail'))
        }
    },

}

const mutations = {

}



export default {
    namespaced: true,
    state,
    actions,
    mutations
}