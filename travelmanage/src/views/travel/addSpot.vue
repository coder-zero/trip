<template>
    <el-card class="box-card" :style="boxCardStyle">
        <el-page-header @back="goBack" content="">  
        </el-page-header>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="spot.spotName" placeholder="请输入景点名称">
            <el-button slot="append" icon="el-icon-s-promotion" @click = "issue">发布</el-button>
        </el-input>
        <el-input
        type="textarea"
        placeholder="请输入景点简述"
        v-model="spot.spotDescribe"
        maxlength="255"
        show-word-limit
        >
        </el-input>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="spot.spotAddress" placeholder="景点地址"></el-input>
        <el-input v-model="spot.spotPrice" placeholder="景点门票价格" style="width: 180px;"></el-input>
         <div style="margin: 10px 0;"></div>
        <el-upload
        class="avatar-uploader"
        :action="uploadUrl"
        :show-file-list="false"
        name = "picture"
        :on-success="handleAvatarSuccess">
        <img v-if="spot.imgUrl" :src="spot.imgUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon">点击上传</i>
        </el-upload>
        <div style="margin: 10px 0;"></div>
        <QuillEditor ref = "myQuill" :containerSet = "containerSet" :placeholder = "placeholder" :textHight = "textHight">
        </QuillEditor>
        
        <!-- <el-button type="primary" @click="submit">提交</el-button> -->
    </el-card>

</template>


<script>
import QuillEditor from '@/components/QuillEditor'
import _global from '@/assets/js/global.js'
import {issueArticleAPI,editArticleAPI} from '@/request/sys_api'
var fonts = ['SimSun', 'SimHei','Microsoft-YaHei','KaiTi','FangSong','Arial','Times-New-Roman','sans-serif'];
export default{
    components:{
        QuillEditor
    },
    data() {
        return {
            containerSet:[
                ['bold', 'italic', 'underline', 'strike'],    //加粗，斜体，下划线，删除线
                ['blockquote', 'code-block'],     //引用，代码块
                [{ 'header': 1 }, { 'header': 2 }],        // 标题，键值对的形式；1、2表示字体大小
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],     //列表
                [{ 'script': 'sub'}, { 'script': 'super' }],   // 上下标
                [{ 'indent': '-1'}, { 'indent': '+1' }],     // 缩进
                [{ 'direction': 'rtl' }],             // 文本方向
                [{ 'size': ['small', false, 'large', 'huge'] }], // 字体大小
                [{ 'header': [1, 2, 3, 4, 5, 6, false] }],     //几级标题
                [{ 'color': [] }, { 'background': [] }],     // 字体颜色，字体背景颜色
                // [{ 'font': [] }],     //字体
                [{ 'font': fonts }],     //字体
                [{ 'align': [] }],    //对齐方式
                ['clean'],    //清除字体样式
                ['link','image','video']    //上传图片、上传视频
            ],
            placeholder:"请在此输入景点详情页内容",
            textHight:"580px",
            boxCardStyle:'height:98%;',
            uploadUrl:'',
            spot:{
                spotContent:'',
                spotName:'',
                spotAddress:'',
                imgUrl:'',
                spotPrice:'',
                spotDescribe:'',
                userId:null
            }
        }
    },
    mounted(){

        this.boxCardStyle = _global.boxCardStyle;
        this.uploadUrl = _global.uploadURL;
        console.log(_global.uploadURL);
        this.spot.userId = this.$store.state.userMsg.id;
        
    },
    methods: {

        issue(){
            this.spot.spotContent = this.$refs.myQuill.content;
            if(this.spot.spotName.trim() == "" ||this.spot.spotName == null){
                this.$message.warning("请输入景点标题！");
                return;
            }
            if(this.spot.spotContent.trim() == ""||this.spot.spotContent == null){
                this.$message.warning("请输入景点详情页内容！");
                return;
            }

            this.spot.userId = this.$store.state.userMsg.id;
            issueArticleAPI(this.spot).then(function(res){
                    if(res.data.success){
                        this.$message.success(res.data.message);
                        this.$router.push("/home/allSpotManage")
                        // window.location.href="/home/articleManage"; 
                    }else{
                        this.$message.error(res.data.message);
                    }
            }.bind(this))
        },
        handleAvatarSuccess(res, file) {
        this.spot.imgUrl = res.data.fileItem.url;
      },
        goBack(){
          this.$router.go(-1);
          
      }
    }
}


</script>
<style scoped>
    .el-input{
        margin-bottom:10px;
    }
     .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
