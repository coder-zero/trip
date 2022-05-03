//api统一接口管理，放置所有的数据请求
import mockRequest from './mockAjax.js'
import requests from './request.js'

//请求轮播图中展示的图片
export const reqGetBannerList = () => {
    return mockRequest.get('/banner')
}

//用户登录请求
export const reqUserLogin = (params) => {
    return requests.post('/user/login', params)
}

//用户注册请求
export const reqUserRegister = (params) => {
    return requests.post('/user/register', params)
}

//获取当前登陆用户信息
export const getUserInfo= () => {
    return requests.get('/user/getCurrentUser')
}

//查询酒店（根据地址)
export const reqGetHotelInfo = (keyword) => {
    return mockRequest.get(`/hotel/search/${keyword}`)
}

//获取所有景点
export const getAllSpotAPI= (params) =>requests.post('/spot/getAllSpot',params);
// export const getAllSpotAPI= () =>mockRequest.get('/scence');

//获取所有酒店以及房间信息
export const getAllHotelAndRoomAPI= (params) =>requests.post('/hotel/getAllHotelAndRoom',params);


//提交订单
export const insertRoomOrderAPI= (params) =>requests.post('/order/insertRoomOrder',params);

//批量删除订单接口
export const delOrderAPI= (params) =>requests.post('/order/delOrder?ids='+params);

//通过用户id获取订单
export const getOrderInfo= (params) =>requests.post('/order/getOrderByUserId?id='+params);

//通过房间id获取房间信息
export const getRoomInfo= (params) =>requests.get('/room/getRoomByHotelId?id='+params);


//修改用户密码
export const editPassAPI= (params) =>requests.post('/user/editPassword',params);


//通过景点id获取信息接口
export const getHotelByIdAPI= (params) =>requests.get('hotel/getHotelById?id='+params);
//发表评论接口
export const ReplyAPI= (params) =>requests.post('comment/reply',params);

//获取当前详情页评论接口
export const getReplyAPI= (params) =>requests.get('comment/getReply?articleId='+params);
//删除评论接口
export const deleteReplyAPI= (params) =>requests.get('comment/deleteReply?id='+params);
//获取当前详情页评论接口
export const getCommentByBelongIdAPI= (params,data) =>requests.get('comment/getCommentByBelongId?id='+params+'&commentType='+data);


//通过景点id获取信息接口
export const getSpotByIdAPI= (params) =>requests.get('spot/getSpotById?id='+params);

//修改用户头像
export const editAvatarAPI= (params) =>requests.post('user/editAvatar',params);


//通过用户id获取门票信息
export const getTicketOrderByUserIdAPI= (params) =>requests.get('/ticketOrder/getTicketOrderByUserId?id='+params);

//预定门票
export const insertTicketOrderAPI= (params) =>requests.post('/ticketOrder/insertTicketOrder/',params);

//通过景点id获取门票接口
export const  getTicketBySpotIdAPI= (params) =>requests.get('/ticket/getTicketBySpotId?id='+params);

//批量删除门票订单信息
export const delTicketOrderAPI= (params) =>requests.post('/ticketOrder/delTicketOrder?ids='+params);