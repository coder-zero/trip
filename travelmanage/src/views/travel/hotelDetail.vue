<template>
    
    <div>
        <!-- 粒子特效 -->
        <!-- <vue-photels
      color="#dedede"
      :photelOpacity="0.7"
      :photelsNumber="40"
      shapeType="star"
      :photelSize="4"
      linesColor="#FFFFFF"
      :linesWidth="2"
      :lineLinked="true"
      :lineOpacity="0.4"
      :linesDistance="150"
      :moveSpeed="3"
      :hoverEffect="true"
      hoverMode="grab"
      :clickEffect="true"
      clickMode="push"
      class="cash"
    >
    </vue-photels> -->
        <el-card class="box-card titleCard">
            <p style="text-align:center;font-size: 25px;font-family:'KaiTi';font-weight: bold;">{{hotel.hotelName}}</p>    
        </el-card>

        <el-card class="box-card" style = "width: 70%;margin: 0 auto;margin-top: 10px;">
            <!-- <p v-html='hotel.content'></p> -->
            <p class="ql-snow ql-editor"  v-html='hotel.hotelContent'></p>
        </el-card>

        <el-card class="box-card commentCard">
            <el-input placeholder="请发布有价值的评论，博客评论不欢迎灌水，良好的社区氛围需大家一起维护。" v-model = "contentCopy">
                <el-button slot="append" icon="el-icon-s-promotion" @click = "commenthotel">发送</el-button>
            </el-input>
            <div class="remark" style="margin-top: 2%;">
                <div class="one" v-for="item in replies" :key="item.id">
                    <div class="user" style="width: 100px;height: 40px;">
                       
                        <div class="username" style="float: left;left: 50px;margin-top: 10%;margin-left: 5%;">
                            <span style="font-size: medium;font-weight: bold;color:#4ca5fd;font-family: KaiTi;">{{item.commentName}}</span>
                        </div>
                    </div>
                    <div style="margin:1%;">
                        <span style="color:rgb(92, 92, 92);">{{item.commentContent}}</span>
                    </div>
                    <div>
                        <div class="replyText" style="position: relative; float:left;left:1%;margin-bottom: 1%;margin-top: -10px;">
                            
                            <el-button type="text"><span style="font-size: 8px;color: rgb(173, 173, 173);" @click = "replyComment(item.id,item.commentName)">回复</span></el-button>
                            <el-button v-if = "$store.state.userMsg.roleId == 3" type="text" icon="el-icon-delete" style="color: #F56C6C;" @click = "deleteComment(item.id)"></el-button>
                        </div>
                        <div class="date"><i class="el-icon-date"></i> {{item.createTime}}</div>
                    </div> 

                    <el-card v-if = "item.children.length > 0" class="box-card" style = "width: 99%;margin: 0 auto;height: auto;background-color: rgb(240, 240, 240);margin-bottom: 2%;">
                        <div class="one" v-for="cItem in item.children" :key="cItem.id">
                            <div class="user" style="width: 200px;height: 40px;margin-top: -10px;">
                                
                                <div class="username" style="float: left;left: 50px;margin-top: 10%;margin-left: 5%;">
                                    <span style="font-size: medium;font-weight: bold;color:#4ca5fd;font-family: KaiTi;">{{cItem.commentName}}</span>
                                    <span style="font-size: medium;color:#a3a2a2;font-family: KaiTi;"> 回复 </span>
                                    <span style="font-size: medium;font-weight: bold;color:#4ca5fd;font-family: KaiTi;">{{cItem.replyName}}</span>
                                </div>
    
                            </div>
                            <div style="margin:1%;">
                                <span style="color:rgb(92, 92, 92);">{{cItem.commentContent}}</span>
                            </div>
                            <div>
                                <div class="replyText" style="position: relative; float:left;left:1%;margin-bottom: 1%;margin-top: -10px;">
                                    
                                    <el-button type="text"><span style="font-size: 8px;color: rgb(173, 173, 173);" @click = "replyComment(cItem.id,cItem.commentName)">回复</span></el-button>
                                    <el-button v-if = "$store.state.userMsg.roleId == 3" type="text" icon="el-icon-delete" style="color: #F56C6C;" @click = "deleteComment(cItem.id)"></el-button>
                                </div>
                                <div class="date"><i class="el-icon-date"></i> {{cItem.createTime}}</div>
                            </div> 
                        </div>
                        
                    </el-card>
                </div>
                

               
            </div>
        </el-card>
        <div style="height: 40px;">

        </div>

        <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" @close = "close">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
                <el-form-item prop="contentDialog">
                    <el-input
                    type="textarea"
                    :rows="5"
                    v-model = "ruleForm.contentDialog"
                    placeholder="请输入评论内容"></el-input>
                </el-form-item>
            </el-form>
            
            <div slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="saveComment">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>
<script>
import {getHotelByIdAPI,ReplyAPI,deleteReplyAPI,getCommentByBelongIdAPI} from '@/request/sys_api'
import hljs from 'highlight.js' 
// import 'highlight.js/highlight.min.js'
import 'highlight.js/styles/devibeans.css'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
hljs.configure({   // optionally configure hljs
  languages: ['javascript', 'ruby', 'python','html','java']
});
export default{
    inject:['reload'],
    data(){
        return{
            hotel:{},
            contentCopy:'',
            ruleForm:{
                contentDialog:''
            },
            replyForm:{
                userId:null,
                belongId:null,
                pid:0,
                commentContent:'',
                commentType:0,

            },
            replies:[],
            dialogVisible:false,
            dialogTitle:'',
            rules: {
                contentDialog: [{ required: true, message: '请输入评论内容', trigger: 'blur' }]
            }
        }
    },
    mounted(){
        this.getData();
    },
    methods:{
        getData(){
            var id = this.$route.query.id;
            getHotelByIdAPI(id).then(function(res){
                console.log(res)
                this.hotel = res.data.data.byId;
                console.log(this.hotel)
            }.bind(this))
            getCommentByBelongIdAPI(id,0).then(function(res){
                // console.log(res)
                this.replies = res.data.data.commentByBelongId;
                // console.log(res)
            }.bind(this))
        },
        replyComment(id,name){
            this.dialogTitle = '回复用户：'+name;
            this.dialogVisible = true;
            this.replyForm.pid = id;
            this.replyForm.belongId = this.hotel.id;
            this.replyForm.commentType =0;
            this.replyForm.userId = this.$store.state.userMsg.id;
        },
        deleteComment(id){
            this.$confirm('删除该评论会将所有该评论的回复一并删除, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                    deleteReplyAPI(id).then(function(res){
                        if(res.data.success){
                            this.$message.success(res.data.message);
                            this.reload();
                        }else{
                            this.$message.error(res.data.message);
                        }
                    }.bind(this))

                }).catch(() => {});
            // alert(id)
        },
        close(){
            this.$refs.ruleForm.resetFields();
        },
        saveComment(){
            this.$refs.ruleForm.validate((valid) => {
                if (valid) {
                    this.replyForm.commentType =0;
                    this.replyForm.commentContent = this.ruleForm.contentDialog;
                    ReplyAPI(this.replyForm).then(function(res){
                        if(res.data.success){
                            this.$message.success(res.data.message);
                            this.reload();
                        }else{
                            this.$message.error(res.data.message);
                        }
                        // console.log(res)
                            
                    }.bind(this))
                }
            });
            
        },
        commenthotel(){
            if(this.contentCopy == '' || this.contentCopy == null){
                this.$message.error("请输入您的评论！");
            }else{
                this.replyForm.commentContent = this.contentCopy;
                this.replyForm.belongId = this.hotel.id;
                this.replyForm.userId = this.$store.state.userMsg.id;
                this.replyForm.pid = 0;
                // console.log(this.replyForm)
                ReplyAPI(this.replyForm).then(function(res){
                    if(res.data.success){
                        this.$message.success(res.data.message);
                        this.reload();
                    }else{
                        this.$message.error(res.data.message);
                    }
                    // console.log(res)
                    
                }.bind(this))
            }
            
        }
    }
}


</script>
<style>
.author{
    position: relative;
    float: left;
    margin-bottom: 50px;
    font-size: small;
    color: #909399;
}
.time{
    position: relative;
    float: right;
    font-size: small;
    color: #909399;
    margin-bottom: 50px;

}
pre.ql-syntax {
    background-color: #23241f;
    color: #f8f8f2;
    overflow: visible;
    word-wrap: break-word;
    word-break: break-all;
    /* overflow: hidden; */
    white-space:pre-wrap; /*超出范围换行*/
    padding: 10px;
}
.ql-video{
    position: relative;
    width: 60%;
    height: 300px;
    left: 20%;
}
/* 粒子特效 */
/* .cash {
    position:fixed;
    top:180px;
    width:100%;
  } */
.titleCard{
    width: 70%;
    margin: 0 auto;
}
.commentCard{
    width: 70%;
    margin:0 auto;
    margin-top: 10px;
}

.one{
    
    width: 100%;
    float: left;
}
.remarker{
    position: relative;
    float: left;
    /* margin-top: 9px; */
    color: rgb(96, 238, 243);
    font-weight: bold;

}
.date{
    color: rgb(149, 149, 149);
    font-size: 8px;
    position: relative;
    float: right;
    right:2%;
}
</style>
