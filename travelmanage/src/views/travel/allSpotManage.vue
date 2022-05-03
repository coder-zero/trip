<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="danger" @click = "delSpot">删除景点</el-button>
            <el-button size = "small" type="warning" @click = "editSpot">编辑景点</el-button>
            <el-button size = "small" type="warning" @click = "addSpot">添加景点</el-button>
            <el-input size = "small" placeholder="请输入内容" v-model="keyWord" class="input-with-select" style="width: 40%;" @input = "searchArticle">
                <el-select @change = "searchArticle" v-model="selected" slot="prepend" style="width: 110px;">
                  <el-option label="景点名称" value="1"></el-option>
                  <el-option label="景点地址" value="2"></el-option>
                </el-select>
                
            </el-input>
        </el-card>
        <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        :header-row-style = "rowStyle"
        style="width: 100%"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          align = "center"
          width="55">
        </el-table-column>
        <el-table-column
          prop="imgUrl"
          align = "center"
          label="景点封面"
          width = "100">
          <template slot-scope = "scope">
              <div class="block"><el-avatar shape="square" :size="50" :src="(scope.row.imgUrl)"></el-avatar></div>
          </template>
        </el-table-column>
        <el-table-column
          prop="spotName"
          label="景点"
          align = "center">
          <template slot-scope = "scope">
            <el-link :underline="false" type="primary" @click = "display(scope.row.id)">{{scope.row.spotName}}</el-link>
            
            <!-- <router-link style="color: #409EFF;" target="_blank" :to="{path:'/articleDetail',query:{id:scope.row.id}}">{{scope.row.title}}</router-link> -->
          </template>
        </el-table-column>
        <el-table-column
          label="景点地点"
          align = "center"
          width = "150">
          <template slot-scope = "scope">
            <p style="color: #909399;" v-if = "checkNull(scope.row.spotAddress)">暂未填写</p>
            <p v-if = "!checkNull(scope.row.spotAddress)">{{scope.row.spotAddress}}</p>
          </template>
        </el-table-column>
        <el-table-column
          label="景点简述"
          align = "center"
          width = "700">
          <template slot-scope = "scope">
            <i class="el-icon-date"></i> {{scope.row.spotDescribe}}
          </template>
        </el-table-column>
        <el-table-column
          label="景点价格"
          align = "center"
          width = "200">
          <template slot-scope = "scope">
            <i class="el-icon-shopping-cart-2"></i> {{scope.row.spotPrice}}
          </template>
        </el-table-column>
        <el-table-column
          label="发布人"
          align = "center"
          width = "200">
          <template slot-scope = "scope">{{scope.row.realName}}
          </template>
        </el-table-column>
      </el-table>
      <!-- <div style="margin-top: 20px">
        <el-button @click="toggleSelection([tableData[1], tableData[2]])">切换第二、第三行的选中状态</el-button>
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div> -->
      <el-dialog  :visible.sync="dialogVisible"  @opened = "opened" @close = "close" :close-on-click-modal = "false" :fullscreen = "true">
        
        <el-form :model="formData">
             <el-input v-model="formData.spotName" placeholder="请输入景点名称">
            <el-button slot="append" icon="el-icon-s-promotion" @click = "saveSpot">修改</el-button>
        </el-input>
        
         <div style="margin: 10px 0;"></div>
         <el-input
        type="textarea"
        placeholder="请输入景点简述"
        v-model="formData.spotDescribe"
        maxlength="255"
        show-word-limit
        >
        </el-input>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="formData.spotAddress" placeholder="景点地址"></el-input>
         <div style="margin: 10px 0;"></div>
        <el-input v-model="formData.spotPrice" placeholder="景点门票价格" style="width: 180px;"></el-input>
         <div style="margin: 10px 0;"></div>
        <el-upload
        class="avatar-uploader"
        :action="uploadUrl"
        :show-file-list="false"
        name = "picture"
        :on-success="handleAvatarSuccess">
        <img v-if="formData.imgUrl" :src="formData.imgUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon">点击上传</i>
        </el-upload>
        <div style="margin: 10px 0;"></div>
          <el-form-item>
            <QuillEditor ref = "myQuill" :containerSet = "containerSet" :placeholder = "placeholder" :textHight = "textHight">
            </QuillEditor>
          </el-form-item>
        </el-form>
        <!-- <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </div> -->
      </el-dialog>
      <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>

     

    </el-card>
</template>
<script>
import Pagination from '@/components/Pagination'
import QuillEditor from '@/components/QuillEditor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import {searchSpotAPI,delSpotAPI,editSpotAPI,getAllSpotAPI} from "@/request/sys_api"
import _global from '@/assets/js/global.js'
var fonts = ['SimSun', 'SimHei','Microsoft-YaHei','KaiTi','FangSong','Arial','Times-New-Roman','sans-serif'];
export default {
    inject:['reload'],
    components:{
        Pagination,QuillEditor
    },
    data() {
      return {
        tableData: [],
        multipleSelection: [],
        selected:"1",
        keyWord:'',
        pageData:{
          total:0,
          currentPage:1,
          pageSize:10,
          pageSizes:[10,20,40,100]
        },
        rowStyle:{height:'70px'},
        boxCardStyle:'height:98%;',
        deleteIds:[],
        flag:0,
        searchData:{
          spotName:'',
          spotAddress:''
        },
        dialogVisible:false,
        formLabelWidth: '120px',
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
        placeholder:"请输入内容",
        textHight:"430px",
        formData:{
          spotName:'',
          spotContent:'',
          spotDescribe:'',
          spotAddress:'',
          spotPrice:'',
          imgUrl:'',
          id:null,
          userId:''
        },
        uploadUrl:''
      }
    },
    mounted(){
      
        this.boxCardStyle = _global.boxCardStyle;
        this.uploadUrl = _global.uploadURL;
        this.getData();
    
    },
    methods: {
      toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
      getData(){
      
        this.searchData.spotName = '';
        this.searchData.spotAddress = '';
        if(this.flag == 1){
          this.searchData.spotName = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.spotAddress = this.keyWord;
        }
        searchSpotAPI(this.pageData,this.searchData).then(function(res){
            this.tableData = res.data.data.spotIPage.records;
            this.pageData.total = res.data.data.spotIPage.total
        }.bind(this))
      },
      checkNull(data){
            if(data == ''||data == null || data.trim() == ''){
                return true;
            }
            return false;
      },
      display(id){
        // let details = this.$router.resolve({
        //   name: "/articleDetail",
        //   // params: {userId:this.$store.state.userMsg.id},
        //   query: {id:id},
          
        // });
        // console.log(this.$store.state.userMsg.id)
        // window.open(details.href, "_blank");
        window.open("/spotDetail?id="+id,'_blank');
      },
        addSpot(){
            this.$router.push({
            path:"/home/addSpot",
        })
        },
      delSpot(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的景点！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"个景点,该景点的评论也将删除？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delSpotAPI(this.deleteIds.join(",")).then(function(res){
              console.log(res)
              if(res.data.success){
                var s_count = res.data.data.result;
                var f_count = total-s_count;
                // this.$message.success("共"+total+"篇景点，删除成功"+s_count+"篇，失败"+f_count+"篇！")
                this.$message.success("成功删除所选景点！");
                this.reload();
              }
            }.bind(this))
            this.deleteIds = [];
          }).catch(()=>{});
          //.catch(()=>{})需要加上，否则会在控制台出现  Uncaught (in promise) cancel  错误
        }
      },
      editSpot(){
        if(this.multipleSelection.length != 1){
          this.$message.warning("请选择一篇景点编辑！");
        }else{
          console.log(this.multipleSelection)
          this.dialogVisible = true;
          this.formData = this.multipleSelection[0];
          this.formData.spotName = this.multipleSelection[0].spotName;
          this.formData.id = this.multipleSelection[0].id;
          // this.$router.push({
          //   name:"editor",
          //   params:this.multipleSelection[0]
          // })
        }
      },
      opened(){
        this.$refs.myQuill.content = this.multipleSelection[0].spotContent;
      },
      close(){
        this.$refs.myQuill.content = '';
        this.reload();
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      saveSpot(){
        this.formData.spotContent = this.$refs.myQuill.content;
        editSpotAPI(this.formData).then(function(res){
          if(res.data.success){
              this.dialogVisible = false;
              this.$message.success(res.data.message);
              this.reload();
          }else{
              this.$message.error(res.data.message);
          }
        }.bind(this))
      },
      searchArticle(){
        //selected 1:标题，2:作者
        this.pageData.currentPage = 1;
        this.flag = this.selected;
        if(this.keyWord == null || this.keyWord == ''){
            this.flag = 0
        }
        this.getData();
      },
      handleAvatarSuccess(res, file) {
        this.formData.imgUrl = res.data.fileItem.url;
      },
     }
  }
</script>
<style scoped>
.input-with-select{
    position: relative;
    float: right;
}
a {
  text-decoration: none;
}
.router-link-active {
  text-decoration: none;
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