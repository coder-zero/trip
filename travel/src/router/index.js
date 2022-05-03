import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const Home = () => import('../views/Home/Home.vue')
const Travel = () => import('../views/Travel/Travel.vue')
const Hotel = () => import('../views/Hotel/Hotel.vue')
const Login = () => import('../components/Login/Login.vue')
const Register = () => import('../components/Register/Register.vue')
const Room = () => import('../views/Room/Room.vue')
const Ticket = () => import('../views/Ticket/Ticket.vue')
const HotelOrder = () => import('../views/OrderMenu/HotelOrder.vue')
const TravelOrder = () => import('../views/OrderMenu/TravelOrder.vue')
const Change = () => import('../views/Change/Change.vue')
const spotDetail = () => import('../views/Scence/spotDetail.vue')
const hotelDetail = () => import('../views/HotelInfo/hotelDetail.vue')

//当使用编程式路由导航时，重复点击多次会导致报错
//对push和replace函数（返回Promise）进行改写，解决这一问题
let originPush = VueRouter.prototype.push
let originReplace = VueRouter.prototype.replace

VueRouter.prototype.push = function (location, resolve, reject) {
    if (resolve && reject) {
        originPush.call(this)
    } else {
        originPush.call(this, location, () => { }, () => { })
    }
}

VueRouter.prototype.replace = function (location, resolve, reject) {
    if (resolve && reject) {
        originReplace.call(this)
    } else {
        originReplace.call(this, location, () => { }, () => { })
    }
}

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            redirect: '/home'
        },
        {
            path: '/home',
            component: Home,
            
        },
        {
            path: '/travel/:keyword?',
            component: Travel,
            name: 'travel'
        },
        {
            path: '/hotel/:keyword?',
            component: Hotel,
            name: 'hotel'
        },
        {
            path: '/login',
            component: Login,
          
        },
        {
            path: '/register',
            component: Register,

        },
        {
            path: '/room/:id?',
            component: Room,
            name: 'room',
            meta: {
                requireAuth: true
            }
        },
        {
            path: '/ticket/:id?',
            component: Ticket,
            name: 'ticket',
            meta: {
                requireAuth: true
            }
        },
        {
            path: '/change',
            component: Change,
        },
        { path: '/spotDetail',
         component: spotDetail,
        },
        { path: '/hotelDetail',
         component: hotelDetail,
        },
        {
            path: '/hotelorder',
            component: HotelOrder
        },
        {
            path: '/travelorder',
            component: TravelOrder
        }
    ]
})



// router.beforeEach((to, from, next) => {

//     if (to.meta.requireAuth) {  // 判断该路由是否需要登录权限
//         const userInfo = JSON.parse(localStorage.getItem('userInfo'))
//         console.log(userInfo);
//         if (userInfo) {  // 通过vuex state获取当前的token是否存在
//             next('/home');
//         } else {
//             next('/login')
//         }
//     }
//     else {
//         // next({
//         //     path: '/login',
//         //     query: { redirect: to.fullPath }  // 将跳转的路由path作为参数，登录成功后跳转到该路由
//         // })
//         next('/home')
//     }
// })

export default router