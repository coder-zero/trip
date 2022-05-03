<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="danger" @click = "sureDelOrder">删除订单信息</el-button>
            <el-input size = "small" placeholder="请输入内容" v-model="keyWord" class="input-with-select" style="width: 40%;" @input = "searchOrder">
                <el-select @change = "searchOrder" v-model="selected" slot="prepend" style="width: 110px;">
                  <el-option label="预定酒店" value="1"></el-option>
                  <el-option label="预定人" value="2"></el-option>
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
          prop="id"
          label="订单编号"
          align = "center">
          <template slot-scope = "scope">
             <p>{{scope.row.id}}</p>
          
          </template>
        </el-table-column>
        <el-table-column
          prop="commentType"
          label="预定酒店"
          align = "center">
          <template slot-scope = "scope">
             <p>{{scope.row.hotelName}}</p>
            <!-- <router-link style="color: #409EFF;" target="_blank" :to="{path:'/articleDetail',query:{id:scope.row.id}}">{{scope.row.title}}</router-link> -->
          </template>
        </el-table-column>
        <el-table-column
          label="房间类型"
          align = "center"
          width = "150">
          <template slot-scope = "scope">
              <p v-if="scope.row.roomType == 1">单人房</p>
              <p v-if="scope.row.roomType == 2">双人房</p>
          </template>
        </el-table-column>
        <el-table-column
          label="房间价格"
          align = "center"
          width = "200">
          <template slot-scope = "scope"><i class="el-icon-shopping-cart-1"></i> {{scope.row.roomPrice}}
          </template>
        </el-table-column>
        <el-table-column
          label="入住时间"
          align = "center"
          width = "200">
          <template slot-scope = "scope">{{scope.row.startTime}}
          </template>
        </el-table-column>
        <el-table-column
          label="退房时间"
          align = "center"
          width = "200">
          <template slot-scope = "scope">{{scope.row.endTime}}
          </template>
        </el-table-column>
        <el-table-column
          label="预定人"
          align = "center"
          width = "200">
          <template slot-scope = "scope">{{scope.row.realName}}
          </template>
        </el-table-column>
        <el-table-column
          label="是否接受"
          align = "center"
          width = "200">
          <template slot-scope = "scope">
               <el-button v-if="scope.row.isAccept == 0" size="mini" type="success" plain  @click = "acceptOrder(scope.row)">接受预定</el-button>
               <el-button v-if="scope.row.isAccept == 1" size="mini" type="danger" plain  @click = "canelOrder(scope.row)">取消预定</el-button>
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
import {searchOrderAPI, delOrderAPI, acceptOrderAPI} from "@/request/sys_api"
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
          username:''
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
        this.searchData.username = '';
        if(this.flag == 1){
          this.searchData.hotelName = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.username = this.keyWord;
        }
        searchOrderAPI(this.pageData,this.searchData).then(function(res){
            this.tableData = res.data.data.roomOrderIPage.records;
            this.pageData.total = res.data.data.roomOrderIPage.total
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

      sureDelOrder(){
        var i = 0;
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的订单！");
        }else{
          for(let selectedItem of this.multipleSelection){
              if(selectedItem.isAccept == 1){
                this.$message.warning("所选订单已接受预定！");
              }else{
                i++;
              }
            }
          if(i==this.multipleSelection.length){
            this.delOrder();
          }
        }
      },




      delOrder(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的订单！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"条预定？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delOrderAPI(this.deleteIds.join(",")).then(function(res){
              if(res.data.success){
                var s_count = res.data.data.result;
                var f_count = total-s_count;
                // this.$message.success("共"+total+"篇酒店，删除成功"+s_count+"篇，失败"+f_count+"篇！")
                this.$message.success("成功删除所选订单！");
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
    
      searchOrder(){
        //selected 1:标题，2:作者
        this.pageData.currentPage = 1;
        this.flag = this.selected;
        if(this.keyWord == null || this.keyWord == ''){
            this.flag = 0
        }
        this.getData();
      },
      acceptOrder(data){
         this.$confirm('请确实是否接受该预定?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
              data.isAccept = 1;
              acceptOrderAPI(data).then(function(res){
                  console.log(res)
              }.bind(this))
        }).catch(() => {
                  
        });
        
      },
      canelOrder(data){
        this.$confirm('请确实是否取消该预定?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
              data.isAccept = 0;
              acceptOrderAPI(data).then(function(res){
                  console.log(res)
              }.bind(this))
        }).catch(() => {
                  
        });
      }
     
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