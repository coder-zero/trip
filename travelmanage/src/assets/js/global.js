//项目基地址
// const BASE_URL = 'http://localhost:8800/quickly'
const BASE_URL = 'http://localhost:8800/trip'
// const BASE_URL = 'http://192.168.76.1:8800/quickly'
// const BASE_URL = 'http://192.168.1.106:8011'

// const BASE_URL = 'http://192.168.1.120:8011'


//图片视频上传地址
const uploadURL = BASE_URL+'/file/upload'

//box-card 样式
const boxCardStyle = 'height:98%;'

//前端页面基地址
const VUE_URL = 'http://localhost:8080/home'

//日志导出地址
const downLogExcelURL = BASE_URL+'/log/downLogExcel'

//登录页面大标题
const login_title = '旅游网站管理系统'

//主页面头部大标题
const headTitle = '旅游网站管理系统'
export default {
  BASE_URL,uploadURL,boxCardStyle,VUE_URL,login_title,headTitle,downLogExcelURL
}

