<template>
    <el-card class="box-card" :style="boxCardStyle">
        <el-input v-model="article.title" placeholder="请输入标题">
            <el-button slot="append" icon="el-icon-s-promotion" @click = "issue">发布</el-button>
        </el-input>
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
            placeholder:"请在此输入正文内容",
            textHight:"580px",
            boxCardStyle:'height:98%;',
            article:{
                userId:null,
                content:'',
                title:''
            }
        }
    },
    mounted(){

        this.boxCardStyle = _global.boxCardStyle;
        
    },
    methods: {

        issue(){
            this.article.content = this.$refs.myQuill.content;
            if(this.article.title.trim() == "" ||this.article.title == null){
                this.$message.warning("请输入文章标题！");
                return;
            }
            if(this.article.content.trim() == ""||this.article.content == null){
                this.$message.warning("请输入正文内容！");
                return;
            }

            this.article.userId = this.$store.state.userMsg.id;
            issueArticleAPI(this.article).then(function(res){
                    if(res.data.success){
                        this.$message.success(res.data.message);
                        // this.$router.push("/home/articleManage")
                        window.location.href="/home/articleManage"; 
                    }else{
                        this.$message.error(res.data.message);
                    }
            }.bind(this))
        }
    }
}


</script>
<style scoped>
    .el-input{
        margin-bottom:10px;
    }
</style>
