<template>
    <el-card class="box-card" :style="boxCardStyle">
        <el-page-header @back="goBack" content="">  
        </el-page-header>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="hotel.hotelName" placeholder="请输入酒店名称">
            <el-button slot="append" icon="el-icon-s-promotion" @click = "issue">发布</el-button>
        </el-input>
        <el-input
        type="textarea"
        placeholder="请输入酒店简述"
        v-model="hotel.hotelDescribe"
        maxlength="255"
        show-word-limit
        >
        </el-input>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="hotel.hotelAddress" placeholder="酒店地址"></el-input>
        <el-input v-model="hotel.hotelPhone" placeholder="酒店联系电话" style="width: 180px;"></el-input>
         <div style="margin: 10px 0;"></div>
        <el-upload
        class="avatar-uploader"
        :action="uploadUrl"
        :show-file-list="false"
        name = "picture"
        :on-success="handleAvatarSuccess">
        <img v-if="hotel.imgUrl" :src="hotel.imgUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
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
import {insertHotelAPI,editArticleAPI} from '@/request/sys_api'
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
            placeholder:"请在此输入酒店详情页内容",
            textHight:"580px",
            boxCardStyle:'height:98%;',
            uploadUrl:'',
            hotel:{
                hotelContent:'',
                hotelName:'',
                hotelAddress:'',
                imgUrl:'',
                hotelPrice:'',
                hotelDescribe:'',
                userId:null
            }
        }
    },
    mounted(){

        this.boxCardStyle = _global.boxCardStyle;
        this.uploadUrl = _global.uploadURL;
        console.log(_global.uploadURL);
        this.hotel.userId = this.$store.state.userMsg.id;
        
    },
    methods: {

        issue(){
            this.hotel.hotelContent = this.$refs.myQuill.content;
            if(this.hotel.hotelName.trim() == "" ||this.hotel.hotelName == null){
                this.$message.warning("请输入酒店名称！");
                return;
            }
            if(this.hotel.hotelContent.trim() == ""||this.hotel.hotelContent == null){
                this.$message.warning("请输入酒店详情页！");
                return;
            }

            this.hotel.userId = this.$store.state.userMsg.id;
            insertHotelAPI(this.hotel).then(function(res){
                    if(res.data.success){
                        this.$message.success(res.data.message);
                        this.$router.push("/home/hotelManage")
                        // window.location.href="/home/articleManage"; 
                    }else{
                        this.$message.error(res.data.message);
                    }
            }.bind(this))
        },
        handleAvatarSuccess(res, file) {
        this.hotel.imgUrl = res.data.fileItem.url;
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
