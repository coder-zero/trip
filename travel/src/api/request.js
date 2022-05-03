//axios的二次封装—
import axios from "axios"
import nprogress from "nprogress"
import "nprogress/nprogress.css"

const requests = axios.create({
    baseURL: 'trip',
    timeout: 2000
})

//配置拦截器
//请求拦截器
// requests.interceptors.request.use(
//     (config)=>{
//         nprogress.start()
//         return config
//     },
//     (error)=>{
//         return Promise.reject(error)
//     })

// //配置响应拦截器
// requests.interceptors.response.use(
//     (response)=>{
//         nprogress.done()
//         return response
//     },
//     (error)=>{
//         return Promise.reject(error)
//     })

export default requests