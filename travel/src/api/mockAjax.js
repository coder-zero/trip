import axios from 'axios'
import nprogress from 'nprogress'
import "nprogress/nprogress.css"

const requests = axios.create({
    baseURL: "/mock",
    timeout: 2000
})

requests.interceptors.request.use((config) => {
    //是否使用进度条
    // nprogress.start()
    return config
})

requests.interceptors.response.use(
    (res) => {
        return res.data
    },
    (err) => {
        alert('服务器响应数据失败')
    }
)

export default requests