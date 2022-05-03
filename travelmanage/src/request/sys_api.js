import request from './request'

//用户注册
export const registerAPI = (params) =>request.post('user/register',params)

//登录
export const postLoginAPI= (params) =>request.post('user/login',params);

//获取当前登陆用户信息
export const getUserMsgAPI= () =>request.get('user/getCurrentUser');

//修改用户信息
export const editUserAPI= (params) =>request.post('user/editUser',params);

//批量删除用户信息
export const delUserAPI= (params) =>request.get('user/delUser?ids='+params);

//修改用户密码
export const editPassAPI= (params) =>request.post('user/editPassword',params);

//修改用户头像
export const editAvatarAPI= (params) =>request.post('user/editAvatar',params);

//根据条件查询用户信息
export const getSearchUserAPI= (params,searchData) =>request.post('user/searchUser/'+params.currentPage+'/'+params.pageSize,searchData);

//天气
export const getWeatherAPI= () =>request.get('/weather/cityName/南京');




//获取所有角色信息
export const getAllRoleAPI = () =>request.get('role/getAllRole')

//添加角色信息
export const addRoleAPI= (params) =>request.post('role/addRole',params);

//修改角色信息
export const editRoleAPI= (params) =>request.post('role/editRole',params);

//删除角色信息
export const delRoleAPI= (params) =>request.get('role/delRole?id='+params);

//角色授权
export const grantRoleAPI= (params) =>request.post('role/grantRole',params);

//通过角色id获取对应的权限数组
export const getRightsByIdAPI= (params) =>request.get('role/getRightsById?id='+params);

//通过角色id获取菜单
// export const getMenuAPI= (params) =>request.get('role/getMenuTree?id='+params);
export const getMenuAPI= (params) =>request.get('menu/getMenuByRoleId?id='+params);

//修改角色是否可注册的状态
export const editStatusAPI= (params) =>request.get('role/editStatus?id='+params);

//通过角色名称查询角色信息，以分页形式返回
export const searchRoleAPI= (params,searchData) =>request.post('role/searchRole/'+params.currentPage+'/'+params.pageSize,searchData);




//获取完整的菜单
export const getAllMenuAPI= () =>request.get('menu/getAllMenu');

//添加菜单
export const addMenuAPI= (params) =>request.post('menu/addMenu',params);

//修改菜单
export const editMenuAPI= (params) =>request.post('menu/editMenu',params);

//删除菜单
export const delMenuAPI= (params) =>request.get('menu/delMenu?id='+params);

//菜单上移
export const upMenuAPI= (params) =>request.get('menu/upMenu?id='+params);

//菜单下移
export const downMenuAPI= (params) =>request.get('menu/downMenu?id='+params);




//获取所有酒店名称信息
export const getAllHotelAPI= (params) =>request.get('hotel/getAllHotel',params);
//分页获取酒店信息
export const searchHoelAPI= (params,searchData) =>request.post('hotel/searchHotel/'+params.currentPage+'/'+params.pageSize,searchData);
//插入酒店接口
// export const issueArticleAPI= (params) =>request.post('article/issueArticle',params);
export const insertHotelAPI= (params) =>request.post('hotel/insertHotel',params);
//编辑酒店接口
// export const editArticleAPI= (params) =>request.post('article/editArticle',params);
export const editHotelAPI= (params) =>request.post('hotel/editHotel',params);
//批量删除酒店接口
export const delHotelAPI= (params) =>request.post('hotel/delHotel?ids='+params);
//获取所有酒店以及房间信息
export const getAllHotelAndRoomAPI= (params) =>request.post('hotel/getAllHotelAndRoom',params);
//通过景点id获取信息接口
export const getHotelByIdAPI= (params) =>request.get('hotel/getHotelById?id='+params);



//插入景点接口
// export const issueArticleAPI= (params) =>request.post('article/issueArticle',params);
export const issueArticleAPI= (params) =>request.post('spot/insertSpot',params);
//编辑景点接口
// export const editArticleAPI= (params) =>request.post('article/editArticle',params);
export const editSpotAPI= (params) =>request.post('spot/editSpot',params);
//批量删除景点接口
export const delSpotAPI= (params) =>request.get('spot/delSpot?ids='+params);
//通过条件查询景点，以分页形式返回
// export const searchArticleAPI= (params,searchData) =>request.post('article/searchArticle/'+params.currentPage+'/'+params.pageSize,searchData);
export const searchSpotAPI= (params,searchData) =>request.post('spot/searchSpot/'+params.currentPage+'/'+params.pageSize,searchData);
//获取所有景点
export const getAllSpotAPI= (params) =>request.post('spot/getAllSpot',params);
//通过景点id获取信息接口
export const getSpotByIdAPI= (params) =>request.get('spot/getSpotById?id='+params);


//获取当前详情页评论接口
export const getCommentByBelongIdAPI= (params,data) =>request.get('comment/getCommentByBelongId?id='+params+'&commentType='+data);





//分页获取房间信息
export const searchRoomAPI= (params,searchData) =>request.post('room/searchRoom/'+params.currentPage+'/'+params.pageSize,searchData);
//修改房间信息
export const editRoomAPI= (params) =>request.post('room/editRoom/',params);
//添加房间信息
export const addRoomAPI= (params) =>request.post('room/insertRoom/',params);
//批量删除房间接口
export const delRoomAPI= (params) =>request.post('room/delRoom?ids='+params);
//分页获取房间信息
export const getAllCommentAPI= (params,searchData) =>request.post('comment/getAllComment/'+params.currentPage+'/'+params.pageSize,searchData);
//批量删除景点接口
export const delCommentAPI= (params) =>request.post('comment/delComment?ids='+params);



//分页获取订单信息
export const searchOrderAPI= (params,searchData) =>request.post('order/searchOrder/'+params.currentPage+'/'+params.pageSize,searchData);
//批量删除订单接口
export const delOrderAPI= (params) =>request.post('order/delOrder?ids='+params);
//修改订单状态
export const acceptOrderAPI= (params) =>request.post('order/updateOrder/',params);






//通过id获取文章接口
export const getArticleByIdAPI= (params) =>request.get('article/getArticleById?id='+params);


//发表评论接口
export const ReplyAPI= (params) =>request.post('comment/reply',params);

//获取当前文章评论接口
export const getReplyAPI= (params) =>request.get('comment/getReply?articleId='+params);

//删除评论接口
export const deleteReplyAPI= (params) =>request.get('comment/deleteReply?id='+params);



//批量删除日志接口
export const delLogAPI= (params) =>request.get('log/delLog?ids='+params);

//删除所有日志接口
export const delAllLogAPI= (params) =>request.get('log/delAllLog');

//日志导出接口
export const downLogExcelAPI= () =>request.get('log/downLogExcel');

//根据条件查询日志信息
export const searchLogAPI= (params,searchData) =>request.post('log/searchLog/'+params.currentPage+'/'+params.pageSize,searchData);





//文件上传接口
export const uploadFileAPI= (params) =>request.post('fileUpload/upload',params);