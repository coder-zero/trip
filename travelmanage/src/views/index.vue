<template>
    <el-card class="card-box" :style="boxCardStyle">
        <h2 style="text-align: center;font-family: KaiTi;">旅游网站管理系统的首页面</h2>
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span style="font-weight: bold;font-family: KaiTi;font-size: large;">前端文件夹介绍</span>
            </div>
            <ul>
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/assets:</span><span style="margin-left: 10px;font-family: KaiTi;">内部存放了一些静态资源，js目录下的<span style="color: #F56C6C;">global.js</span>是前端所用到的一些全局常量并配有注释</span></li>
             
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/components:</span><span style="margin-left: 10px;font-family: KaiTi;">存放封装好的组件，可以在页面中直接使用。
              <span style="color: #F56C6C;">MenuTree</span>为系统左侧菜单树组件；<span style="color: #F56C6C;">Pagination</span>为分页组件；<span style="color: #F56C6C;">QuillEditor</span>为富文本编辑器组件；</span></li>
          
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/plugins:</span><span style="margin-left: 10px;font-family: KaiTi;">其中<span style="color: #F56C6C;">element.js</span>是按需引入elementUI的基本组件</span></li>
            
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/request:</span><span style="margin-left: 10px;font-family: KaiTi;">其中<span style="color: #F56C6C;">sys_api.js</span>是对后端接口的一个封装，我们可在其他页面引入需要的接口进行调用</span></li>
             
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/router:</span><span style="margin-left: 10px;font-family: KaiTi;">内部的<span style="color: #F56C6C;">index.js</span>是对前端路由的一个配置，主要根据地址自动映射到对应的文件，若没有对应的文件则默认映射到文件<span style="color: #F56C6C;">defaultPage.vue</span></span></li>
              
              <li><span style="color: #409EFF;font-family: KaiTi;" >src/views:</span><span style="margin-left: 10px;font-family: KaiTi;">内部文件是我们系统的所有页面，我们可根据地址名找到对应页面的文件</span></li>
          
            </ul>
        </el-card>

        <el-card class="box-card" style="margin-top: 20px;">
            <div slot="header" class="clearfix">
                <span style="font-weight: bold;font-family: KaiTi;font-size: large;">后端文件夹介绍</span>
                
                <!-- <el-link href="http://localhost:8800/swagger-ui.html" target="_blank" type="primary" style="float: right; padding: 3px 0">后端接口展示</el-link> -->
              </div>
              <ul>
                <li><span style="color: #409EFF;font-family: KaiTi;" >/aop:</span><span style="margin-left: 10px;font-family: KaiTi;">存放切面的相关配置，用来记录系统的操作日志</span></li>
              
                <li><span style="color: #409EFF;font-family: KaiTi;" >/config:</span><span style="margin-left: 10px;font-family: KaiTi;">里面存放系统的配置文件，包括全局异常的配置，swagger的配置等等</span></li>
                
                <li><span style="color: #409EFF;font-family: KaiTi;" >/controller:</span><span style="margin-left: 10px;font-family: KaiTi;">系统的控制器，是控制层</span></li>
             
                <li><span style="color: #409EFF;font-family: KaiTi;" >/entity:</span><span style="margin-left: 10px;font-family: KaiTi;">封装的实体类</span></li>
              
                <li><span style="color: #409EFF;font-family: KaiTi;" >/mapper:</span><span style="margin-left: 10px;font-family: KaiTi;">持久层，主要对数据库的操作</span></li>
              
                <li><span style="color: #409EFF;font-family: KaiTi;" >/service:</span><span style="margin-left: 10px;font-family: KaiTi;">服务层，完成系统各种复杂的逻辑处理</span></li>
           
                <li><span style="color: #409EFF;font-family: KaiTi;" >/utils:</span><span style="margin-left: 10px;font-family: KaiTi;">封装的常用工具</span></li>
        
              </ul>
        </el-card>
        

    </el-card>
</template>


<script>

    export default{
        data(){
            return{
                boxCardStyle:"height:auto;"

            }
        }
    }
</script>

<style>
.card-box {
  height: 100%;
}
</style>
