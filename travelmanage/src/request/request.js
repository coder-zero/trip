import axios from 'axios';
import store from '@/store';
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import global_ from '@/assets/js/global.js'


const instance=axios.create({
   
    // baseURL:"http://10.100.111.32:8011",
    baseURL:global_.BASE_URL,
})
//请求拦截
// instance.interceptors.request.use(config=>{
//         NProgress.start()
//         let token = store.getters.getToken;
      
//         config.headers.token = token;
    
//         return config;

// },err=>{
//     return Promise.reject(err);
// })
//响应拦截
instance.interceptors.response.use(res=>{
//    console.log(res)
    if(res.data == 'token不存在'){
        confirm("登录信息已过期，请重新登录！")
        
        var r=confirm();
        if (r==true){
            router.push("/login")
        }
    }
    NProgress.done()
    return res;
    },err=>{
        alert(err)
        return Promise.reject(err)
    }
)

export default instance; 
