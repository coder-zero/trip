import Vue from 'vue'
import Router from 'vue-router'
import login from '@/views/login.vue'
import register from '@/views/register.vue'
import home from '@/views/home.vue'
import articleDetail from '@/views/articleDetail.vue'
import homePage from '@/views/travel/homePage.vue'
import addHotel from '@/views/travel/addHotel.vue'
import addSpot from '@/views/travel/addSpot.vue'
import spotDetail from '@/views/travel/spotDetail.vue'
import hotelDetail from '@/views/travel/hotelDetail.vue'

Vue.use(Router)

//这里写前端的路由和组件
const originalPush = Router.prototype.push

Router.prototype.push = function push (location) {

  return originalPush.call(this, location).catch(err => err)

}


const roleManage = { path: '/home/roleManage', component: () => import('@/views/roleManage.vue') }
const userManage = { path: '/home/userManage', component: () => import('@/views/userManage.vue') }
const menuManage = { path: '/home/menuManage', component: () => import('@/views/menuManage.vue') }
const editor = { path: '/home/editor', component: () => import('@/views/editorExample.vue') }
const test = { path: '/home/test', component: () => import('@/views/test.vue') }
const registerManage = { path: '/home/registerManage', component: () => import('@/views/registerManage.vue') }  
const logManage = { path: '/home/logManage', component: () => import('@/views/logManage.vue') }
const index = { path: '/home/index', component: () => import('@/views/index.vue') }
const allSpotManage = { path: '/home/allSpotManage', component: () => import('@/views/travel/allSpotManage.vue') }
const hotelManage = { path: '/home/hotelManage', component: () => import('@/views/travel/hotelManage.vue') }
const roomManage = { path: '/home/roomManage', component: () => import('@/views/travel/roomManage.vue') }
const commentManage = { path: '/home/commentManage', component: () => import('@/views/travel/commentManage.vue') }
const orderManage = { path: '/home/orderManage', component: () => import('@/views/travel/orderManage.vue') }


//映射本地路由和服务器的地址
const ruleMapping = {
  
  "/home/roleManage": roleManage,
  "/home/userManage": userManage,
  "/home/menuManage": menuManage,
  "/home/editor":editor,
  "/home/test":test,
  "/home/registerManage":registerManage,
  "/home/logManage":logManage,
  "/home/index":index,
  "/home/allSpotManage":allSpotManage,
  "/home/hotelManage": hotelManage,
  "/home/commentManage": commentManage,
  "/home/roomManage":roomManage,
  "/home/orderManage":orderManage
  
}





const router = new Router({
  mode: 'history',
  routes:[
    { path: '/', redirect: '/login'},
    {path: '/homePage', component: homePage },
    // { path: '/home', redirect: '/index'},
    { path: '/login', component: login },
    { path: '/register', component: register },
    {path: '/home', component: home,children: [{path: '/home/addHotel', component: addHotel},{path: '/home/addSpot', component: addSpot}]},
    { path: '/articleDetail', component: articleDetail },
    { path: '/spotDetail', component: spotDetail },
    { path: '/hotelDetail', component: hotelDetail }]
    
})


// 登录拦截
// router.beforeEach((to,from,next) => {
//   // if (sessionStorage.getItem('activePath')) {
//   //   var c = JSON.parse(localStorage.getItem('activePath'))
//   //   var getLastUrl=(str,yourStr)=>str.slice(str.lastIndexOf(yourStr))
//   //   lastUrl=getLastUrl(window.location.href,'/');
  
//   //   console.log(c)
//   //   if (c.path==lastUrl) { //动态路由页面的刷新事件
//   //    let newRoutes = ruleMapping.concat([{
//   //     path: c.path,
//   //     component: resolve => require(["@/components/" + c.component + ""], resolve)
//   //    }])
//   //    localStorage.removeItem('activePath')
//   //    router.addRoutes(newRoutes)
//   //    router.replace(c.path) //replace,保证浏览器回退的时候能直接返回到上个页面，不会叠加
  
//   //   } 
//   //  } 
//   //  next()


//   if(to.path === '/login'||to.path === '/register'||to.path === '/articleDetail'){

//     next()
    

//   }else{
//     const token =sessionStorage.getItem('token')
//     // console.log(token)
//     if(token){
//       next()  
//     } else {
//       next('/homePage')
//     }
//     next();
//   }
// })

//记得在登录界面import 并在登录方法内调用initDynamicRoutes() 还需要在App.vue中import 并创建生命周期
// created() {
//   initDynamicRoutes()
// },
const currentRoutes = router.options.routes
//对当前菜单项的路由及其子菜单路由进行动态添加
function addRoute(menuItem){
  // console.log(menuItem)
  if(menuItem ||menuItem == ""){
    if(menuItem.menuPath){
      //当路由映射ruleMapping中有对应的组件，则添加对应的组件
      if(ruleMapping[menuItem.menuPath]){
        currentRoutes[4].children.push(ruleMapping[menuItem.menuPath]);
      }else{
        //当路由映射ruleMapping中没有有对应的组件，则添加默认的组件
        currentRoutes[4].children.push({ path:menuItem.menuPath, component: () => import('@/views/defaultPage.vue') });
      }
    }
    menuItem.children.forEach(item =>{
      addRoute(item);
    })
  }
}
export function initDynamicRoutes(menuList) {
  //根据二级权限，对路由规则进行动态的添加
  //menuList为菜单列表
 

  menuList.forEach(item => {
    // console.log(item)
    // item.children.forEach(item => {
    //   const temp = ruleMapping[item.menuPath]
    //   console.log(temp)
    //   currentRoutes[3].children.push(temp)
    // })

    //对菜单列表进行遍历，通过递归对每一项进行路由的添加
    addRoute(item);

  })
  router.addRoute(currentRoutes[4])
  
}


export default router;


