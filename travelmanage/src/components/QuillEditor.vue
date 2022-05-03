<template>
    <div>
        <el-upload
            style="display: none"
            class="quill-avatar-uploader"  
            :action="uploadURL"
            ref = "imageUpload"
            :show-file-list="false"
            accept="image/png, image/jpeg, image/jpg"
            :before-upload="beforeAvatarUpload"
            :on-success = "uploadSuccess"
            name = "picture"
            multiple
            :limit="1">
        </el-upload>

        <quill-editor ref="text" v-model="content" id = "text" class="myQuillEditor" :options="editorOption" />

        <el-dialog
        width="30%"
        title="视频上传"
        :visible.sync="videoUploadTag"
        @close = "closeDialog">
        <el-tabs v-model="activeName">
          <el-tab-pane label="添加视频链接" name="first">
            <el-input v-model="videoLink" placeholder="请输入视频链接" clearable></el-input>
            <el-button type="primary" size="small" style="margin: 20px 0px 0px 0px " @click="addVideoLink">添加
            </el-button>
          </el-tab-pane>
          <el-tab-pane label="素材库" name="second">
            <el-upload
                class="upload-demo"
                drag
                ref = "uploadVideo"
                :action="uploadURL"
                accept="video/*"
                :before-upload="beforeVideoUpload"
                :on-success = "videoSuccess"
                name = "picture"
                :auto-upload="false"
                multiple
                :limit="1">
                <i class="el-icon-upload"></i>
                <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                <div class="el-upload__tip" slot="tip">只能上传视频文件，且不超过300MB</div>
            </el-upload>
            <el-button type="primary" size="small" style="margin: 20px 0px 0px 0px " @click="submitUpload">确认
            </el-button>
            <el-button type="primary" size="small" style="margin: 20px 0px 0px 0px;position: relative;float: right; " @click="videoUploadTag = false">取消
            </el-button>
          </el-tab-pane>

        </el-tabs>
      </el-dialog>
    </div>
</template>


<script>
import {quillEditor} from 'vue-quill-editor'
import hljs from 'highlight.js' 
// import 'highlight.js/highlight.min.js'
import 'highlight.js/styles/devibeans.css'

//// import 'highlight.js/styles/dark.css'
//// import 'highlight.js'
import * as Quill from 'quill' 
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

import { ImageDrop } from 'quill-image-drop-module'
 import ImageResize from 'quill-image-resize-module'
 Quill.register('modules/imageDrop', ImageDrop);
 Quill.register('modules/imageResize', ImageResize);

import global_ from '@/assets/js/global.js'
import {uploadFileAPI} from '@/request/sys_api'

hljs.configure({   // optionally configure hljs
  languages: ['javascript', 'ruby', 'python','html','java']
});

//quill编辑器的字体
// var fonts = ['SimSun', 'SimHei','Microsoft-YaHei','KaiTi','FangSong','Arial','Times-New-Roman','sans-serif'];
// var Font = Quill.import('formats/font'); 
// Font.whitelist = fonts; //将字体加入到白名单 
// Quill.register(Font, true);

const titleConfig=[
		    {Choice:'.ql-bold',title:'加粗'},
		    {Choice:'.ql-italic',title:'斜体'},
		    {Choice:'.ql-underline',title:'下划线'},
		    {Choice:'.ql-header',title:'段落格式'},
		    {Choice:'.ql-strike',title:'删除线'},
		    {Choice:'.ql-blockquote',title:'块引用'},
		    {Choice:'.ql-code',title:'插入代码'},
		    {Choice:'.ql-code-block',title:'插入代码段'},
		    {Choice:'.ql-font',title:'字体'},
		    {Choice:'.ql-size',title:'字体大小'},
		    {Choice:'.ql-list[value="ordered"]',title:'编号列表'},
		    {Choice:'.ql-list[value="bullet"]',title:'项目列表'},
		    {Choice:'.ql-direction',title:'文本方向'},
		    {Choice:'.ql-header[value="1"]',title:'h1'},
		    {Choice:'.ql-header[value="2"]',title:'h2'},
		    {Choice:'.ql-align',title:'对齐方式'},
		    {Choice:'.ql-color',title:'字体颜色'},
		    {Choice:'.ql-background',title:'背景颜色'},
		    {Choice:'.ql-image',title:'图像'},
		    {Choice:'.ql-video',title:'视频'},
		    {Choice:'.ql-link',title:'添加链接'},
		    {Choice:'.ql-formula',title:'插入公式'},
		    {Choice:'.ql-clean',title:'清除字体格式'},
		    {Choice:'.ql-script[value="sub"]',title:'下标'},
		    {Choice:'.ql-script[value="super"]',title:'上标'},
		    {Choice:'.ql-indent[value="-1"]',title:'向左缩进'},
		    {Choice:'.ql-indent[value="+1"]',title:'向右缩进'},
		    {Choice:'.ql-header .ql-picker-label',title:'标题大小'},
		    {Choice:'.ql-header .ql-picker-item[data-value="1"]',title:'标题一'},
		    {Choice:'.ql-header .ql-picker-item[data-value="2"]',title:'标题二'},
		    {Choice:'.ql-header .ql-picker-item[data-value="3"]',title:'标题三'},
		    {Choice:'.ql-header .ql-picker-item[data-value="4"]',title:'标题四'},
		    {Choice:'.ql-header .ql-picker-item[data-value="5"]',title:'标题五'},
		    {Choice:'.ql-header .ql-picker-item[data-value="6"]',title:'标题六'},
		    {Choice:'.ql-header .ql-picker-item:last-child',title:'标准'},
		    {Choice:'.ql-size .ql-picker-item[data-value="small"]',title:'小号'},
		    {Choice:'.ql-size .ql-picker-item[data-value="large"]',title:'大号'},
		    {Choice:'.ql-size .ql-picker-item[data-value="huge"]',title:'超大号'},
		    {Choice:'.ql-size .ql-picker-item:nth-child(2)',title:'标准'},
		    {Choice:'.ql-align .ql-picker-item:first-child',title:'居左对齐'},
		    {Choice:'.ql-align .ql-picker-item[data-value="center"]',title:'居中对齐'},
		    {Choice:'.ql-align .ql-picker-item[data-value="right"]',title:'居右对齐'},
		    {Choice:'.ql-align .ql-picker-item[data-value="justify"]',title:'两端对齐'}
		];


export default{
    name:'QuillEditor',
    props:['containerSet','placeholder','textHight'],
    components: {
        quillEditor
    },
    data() {
        return {
            videoUploadTag:false,
            uploadURL:'',
            videoLink:'',
            content: '',
            activeName:'first',
            editorOption: {
                placeholder: '请在此输入',//默认值
                // theme:'snow'
                modules:{
                    //代码高亮
                    syntax: {highlight: text => window.hljs.highlightAuto(text).value},
                    imageDrop: true,      //图片拖拽
                    imageResize:{          //放大缩小
                        displaySize: true
                    },
                    toolbar:{
                        container:this.containerSet,
                        handlers: {
                            image: function(value) { //编辑器-上传图片
                                if (value) {
                                    // 调用antd图片上传upload
                                    document.querySelector(".quill-avatar-uploader input").click();
                                    
                                } else {
                                    this.quill.format('image', false)
                                }
                            }
                        }
                    }
                }
            }
        } 
        
    },

    mounted() {
        autotip:{
            // document.getElementsByClassName('ql-editor')[0].dataset.placeholder=''//两种方式均可，这个优先级更高
            for(let item of titleConfig){
                let tip = document.querySelector('.quill-editor '+ item.Choice)
                if (!tip) continue
                tip.setAttribute('title',item.title)
            }

            this.$refs.text.quill.getModule('toolbar').addHandler('video', this.uploadVideoHandler)
            this.uploadURL = global_.uploadURL;
            // console.log(this.containerSet)
            // console.log(this.textHight)


            // var div = document.getElementByClass("ql-container");
            // console.log(div)
            //给编辑器动态设置高度
            if(this.textHight){
                var oDiv=document.getElementById('text');
                var classElement = this.getByClass(oDiv, 'ql-container ql-snow')
                classElement[0].style.height = this.textHight;
            }
            

            // div.styleClass.height = this.textHight;


            //如果页面传入了placeholder，那么使用传过来的
            if(this.placeholder){
                document.getElementsByClassName('ql-editor')[0].dataset.placeholder=this.placeholder;
            }

            //找font（字体是否存在）
            var index = -1;
            for(var i = 0;i<this.containerSet.length;i++){
                var fonts = this.containerSet[i][0].font;
                if(fonts){
                    index = i
                }   
            }

            // 有字体则设置
            if(index != -1){
                var fonts = this.containerSet[index][0].font;
                var Font = Quill.import('formats/font'); 
                Font.whitelist = fonts; //将字体加入到白名单 
                Quill.register(Font, true);
            }
            
            
            
        }
	},
    methods: {
        
        onEditorReady(editor) { // 准备编辑器
        },
        onEditorBlur(){
            console.log("shiqu")
        }, // 失去焦点事件
        onEditorFocus(){}, // 获得焦点事件
        onEditorChange(){}, // 内容改变事件
        beforeVideoUpload(file) {
            var fileSize = file.size / 1024 / 1024 < 300;
            if (['video/mp4', 'video/ogg', 'video/flv', 'video/avi', 'video/wmv', 'video/rmvb', 'video/mov'].indexOf(file.type) == -1) {
                layer.msg("请上传正确的视频格式");
                return false;
            }
            if (!fileSize) {
                layer.msg("视频大小不能超过300MB");
                return false;
            }
            this.isShowUploadVideo = false;
        },
        submitUpload() {
            this.$refs.uploadVideo.submit();
            this.videoUploadTag = false;
        },
        addVideoLink() {
        
            if (this.videoLink.length == 0) {
                this.$message.warning("请输入视频链接！");
            }
            //当编辑器中没有输入文本时，这里获取到的 range 为 null
            var range = this.$refs.text.quill.getSelection();
            //视频插入在富文本中的位置
            var index = 0;
            if (range == null) {
            index = 0;
            } else {
            index = range.index;
            }
            //隐藏弹框
            this.videoUploadTag = false;
            //将视频链接插入到当前的富文本当中
            this.$refs.text.quill.insertEmbed(index, 'video', this.videoLink);
        },
        // 图片上传前---格式与大小验证
        beforeAvatarUpload(file) {
            let isPass = false;
            if (
                file.type === "image/png" ||
                file.type === "image/jpeg" ||
                file.type === "image/jpg"
            ) {
                isPass = true;
            }
            const isLt = file.size / 1024 / 1024 < 5;
            if (!isPass) {
                this.$message.error("当前仅支持上传图片JPG/jpeg/png格式!");
                return false;
            }
            if (!isLt) {
                this.$message.error("上传图片大小不能超过 5MB!");
                return false;
            }
            return isPass && isLt;
        },
        uploadVideoHandler(){
            this.videoUploadTag = true;
        },
        //正文插入图片上传成功调用
        uploadSuccess(response, file, fileList) {
            this.$refs.imageUpload.clearFiles()
            // this.urlList.push(response.url);
            // console.log("图片上传成功")
            let quill = this.$refs.text.quill;
            // console.log(response)
            if (response.success) {
                //获取光标所在位置
                let index = this.$refs.text.quill.selection.savedRange.index;
                // var index = 0;
                // if(range != null){
                //     index = range.index;
                // }
                // console.log(index)
                //插入图片
                quill.insertEmbed(index, 'image', response.data.fileItem.url);
                //移动光标到图片后
                quill.setSelection(index + 1);
                // console.log("图片插入成功")
            }
        },
        //视频上传成功后调用
        videoSuccess(response, file, fileList){
            //清空文件列表(只能在上传成功后清空，关闭时清空会出错)
            // console.log("视频上传成功")
            this.$refs.uploadVideo.clearFiles()
            // this.urlList.push(response.url);
            let quill = this.$refs.text.quill;
            if (response.success) {
                //获取光标所在位置
                let index = this.$refs.text.quill.selection.savedRange.index;
                // var index = 0
                // //插入图片
                // if(range != null){
                //     index = range.index;
                // }
                // console.log(this.$refs.text.quill.selection.savedRange.index)
                quill.insertEmbed(index, 'video', response.data.fileItem.url);
                //移动光标到图片后
                quill.setSelection(index + 1);
                // console.log("视频插入成功")
            }
        },
        //视频上传对话框关闭处理事件
        closeDialog(){
            this.videoLink = '';

           

            this.activeName = "first";
        },
        getByClass(oParent, sClassName)
        {
            var res=[];
            var aTmp=oParent.getElementsByTagName('*');
            // console.log(aTmp)
            // console.log(aTmp.length)
            for (var i=0; i<aTmp.length; i++)
            {
                // console.log(aTmp[i])
                if (aTmp[i].className == sClassName)
        　　　　　　
                {
                    res.push(aTmp[i]);
                }
            }
            
            return res;
        }
    },
    computed: {
        editor() {
            return this.$refs.text.quill;
        },
    }

}
</script>
<style>
.ql-container{
    /* min-height: 300px !important; */
    height: 500px;
}

.editor {
    line-height: normal !important;
    height: 800px;
}
.ql-snow .ql-tooltip[data-mode=link]::before {
    content: "请输入链接地址:";
}
.ql-snow .ql-tooltip.ql-editing a.ql-action::after {
    border-right: 0px;
    content: '保存';
    padding-right: 0px;
}

.ql-snow .ql-tooltip[data-mode=video]::before {
    content: "请输入视频地址:";
}

.ql-snow .ql-picker.ql-size .ql-picker-label::before,
.ql-snow .ql-picker.ql-size .ql-picker-item::before {
    content: '14px';
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value=small]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value=small]::before {
    content: '10px';
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value=large]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value=large]::before {
    content: '18px';
}
.ql-snow .ql-picker.ql-size .ql-picker-label[data-value=huge]::before,
.ql-snow .ql-picker.ql-size .ql-picker-item[data-value=huge]::before {
    content: '32px';
}

.ql-snow .ql-picker.ql-header .ql-picker-label::before,
.ql-snow .ql-picker.ql-header .ql-picker-item::before {
    content: '文本';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="1"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="1"]::before {
    content: '标题1';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="2"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="2"]::before {
    content: '标题2';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="3"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="3"]::before {
    content: '标题3';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="4"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="4"]::before {
    content: '标题4';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="5"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="5"]::before {
    content: '标题5';
}
.ql-snow .ql-picker.ql-header .ql-picker-label[data-value="6"]::before,
.ql-snow .ql-picker.ql-header .ql-picker-item[data-value="6"]::before {
    content: '标题6';
}

.ql-snow .ql-picker.ql-font .ql-picker-label::before,
.ql-snow .ql-picker.ql-font .ql-picker-item::before {
    content: '标准字体';
}
.ql-snow .ql-picker.ql-font .ql-picker-label[data-value=serif]::before,
.ql-snow .ql-picker.ql-font .ql-picker-item[data-value=serif]::before {
    content: '衬线字体';
}
.ql-snow .ql-picker.ql-font .ql-picker-label[data-value=monospace]::before,
.ql-snow .ql-picker.ql-font .ql-picker-item[data-value=monospace]::before {
    content: '等宽字体';
}
.ql-align-center{
    text-align: center;
}
.ql-align-right{
    text-align: right;
}
.ql-align-left{
    text-align: left;
}
.ql-tooltip ql-editing{
    left:500px;
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