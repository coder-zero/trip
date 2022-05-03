<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="danger" @click = "delComment">删除留言信息</el-button>
            <el-input size = "small" placeholder="请输入内容" v-model="keyWord" class="input-with-select" style="width: 40%;" @input = "searchComment">
                <el-select @change = "searchComment" v-model="selected" slot="prepend" style="width: 110px;">
                  <el-option label="酒店评论" value="1"></el-option>
                  <el-option label="景点评论" value="2"></el-option>
                  <el-option label="留言人" value="3"></el-option>
                   <el-option label="留言内容" value="4"></el-option>
                </el-select>
                
            </el-input>
        </el-card>
        <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        :header-row-style = "rowStyle"
        style="width: 100%"
        max-height="600"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          align = "center"
          width="55">
        </el-table-column>
        <el-table-column
          prop="commentType"
          label="留言类型"
          align = "center"
          width = "150">
          <template slot-scope = "scope">
             <p v-if = "scope.row.commentType == 0"><span style="color:#409EFF">酒店</span></p>
             <p v-if = "scope.row.commentType == 1"><span style="color:#67C23A">景点</span></p>
            <!-- <router-link style="color: #409EFF;" target="_blank" :to="{path:'/articleDetail',query:{id:scope.row.id}}">{{scope.row.title}}</router-link> -->
          </template>
        </el-table-column>
        <el-table-column
          prop="commentType"
          label="留言地点"
          align = "center">
          <template slot-scope = "scope">
             <p v-if = "scope.row.commentType == 0">{{scope.row.hotelName}}</p>
             <p v-if = "scope.row.commentType == 1">{{scope.row.spotName}}</p>
            <!-- <router-link style="color: #409EFF;" target="_blank" :to="{path:'/articleDetail',query:{id:scope.row.id}}">{{scope.row.title}}</router-link> -->
          </template>
        </el-table-column>
        <el-table-column
          label="留言内容"
          align = "center"
          width = "150">
          <template slot-scope = "scope">{{scope.row.commentContent}}
          </template>
        </el-table-column>
        <el-table-column
          label="留言时间"
          align = "center"
          width = "700">
          <template slot-scope = "scope">
            <i class="el-icon-date"></i> {{scope.row.createTime}}
          </template>
        </el-table-column>
        <el-table-column
          label="留言人"
          align = "center"
          width = "200">
          <template slot-scope = "scope">
            <i class="el-icon-user"></i> {{scope.row.commentName}}
          </template>
        </el-table-column>
      </el-table>
      <!-- <div style="margin-top: 20px">
        <el-button @click="toggleSelection([tableData[1], tableData[2]])">切换第二、第三行的选中状态</el-button>
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div> -->
    <div style="margin-top: 20px"> </div>
      <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>

     

    </el-card>
</template>
<script>
import Pagination from '@/components/Pagination'
import QuillEditor from '@/components/QuillEditor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import {getAllCommentAPI, delCommentAPI} from "@/request/sys_api"
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
          hotelName:'',
          spotName:'',
          commentName:'',
          commentContent:''
        },
        formLabelWidth: '120px',
      
       
      }
    },
    mounted(){
        this.boxCardStyle = _global.boxCardStyle;
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
      
        this.searchData.hotelName = '';
        this.searchData.spotName = '';
        this.searchData.commentName = '';
        if(this.flag == 1){
          this.searchData.hotelName = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.spotName = this.keyWord;
        }else if(this.flag == 3){
          this.searchData.commentName = this.keyWord;
        }else if(this.flag == 4){
          this.searchData.commentContent = this.keyWord;
        }
        getAllCommentAPI(this.pageData,this.searchData).then(function(res){
           console.log(res)
            this.tableData = res.data.data.allComment.records;
            this.pageData.total = res.data.data.allComment.total
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
        window.open("/articleDetail?id="+id,'_blank');
      },

      delComment(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的留言！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"条留言以及附属留言？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delCommentAPI(this.deleteIds.join(",")).then(function(res){
              console.log(res)
              if(res.data.success){
                var s_count = res.data.data.result;
                var f_count = total-s_count;
                // this.$message.success("共"+total+"篇酒店，删除成功"+s_count+"篇，失败"+f_count+"篇！")
                this.$message.success("成功删除所选酒店！");
                this.reload();
              }
            }.bind(this))
            this.deleteIds = [];
          }).catch(()=>{});
          //.catch(()=>{})需要加上，否则会在控制台出现  Uncaught (in promise) cancel  错误
        }
      },
   
      
     
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
    
      searchComment(){
        //selected 1:标题，2:作者
        this.pageData.currentPage = 1;
        this.flag = this.selected;
        if(this.keyWord == null || this.keyWord == ''){
            this.flag = 0
        }
        this.getData();
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