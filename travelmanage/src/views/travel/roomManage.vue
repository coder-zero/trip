<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="danger" @click = "delRoom">删除房间</el-button>
            <el-button size = "small" type="warning" @click = "editRoom">编辑房间</el-button>
            <el-button size = "small" type="warning" @click = "addroom">添加房间</el-button>
            <el-input size = "small" placeholder="请输入内容" v-model="keyWord" class="input-with-select" style="width: 40%;" @input = "searchRoom">
                <el-select @change = "searchRoom" v-model="selected" slot="prepend" style="width: 110px;">
                  <el-option label="酒店名称" value="1"></el-option>
                  <el-option label="房间编号" value="2"></el-option>
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
          width = "100">
          <template slot-scope = "scope">
              <div class="block"><el-avatar shape="square" :size="50" :src="(scope.row.imgUrl)"></el-avatar></div>
          </template>
        </el-table-column>
        <el-table-column
          label="酒店名称"
          align = "center"
          width = "150">
          <template slot-scope = "scope">
            <p style="color: #909399;" v-if = "checkNull(scope.row.hotelName)">暂未填写</p>
            <p v-if = "!checkNull(scope.row.hotelName)">{{scope.row.hotelName}}</p>
          </template>
        </el-table-column>
        <el-table-column
          prop="id"
          label="房间编号"
          align = "center">
          <template slot-scope = "scope">
            <el-link :underline="false" type="primary" @click = "display(scope.row.id)">{{scope.row.id}}</el-link>
            
            <!-- <router-link style="color: #409EFF;" target="_blank" :to="{path:'/articleDetail',query:{id:scope.row.id}}">{{scope.row.title}}</router-link> -->
          </template>
        </el-table-column>
        <el-table-column
          label="房间类型"
          align = "center"
          width = "80">
          <template slot-scope = "scope">
            <p style="color: #909399;" v-if = "checkNull(scope.row.roomType)">暂未填写</p>
            <div v-if = "!checkNull(scope.row.roomType)">
            <p v-if="scope.row.roomType == 1">单人房</p>
            <p v-if="scope.row.roomType == 2">双人房</p>
            </div>
          </template>
        </el-table-column>
        <el-table-column
          label="房间简述"
          align = "center"
          width = "700">
          <template slot-scope = "scope">
            <i class="el-icon-date"></i> {{scope.row.roomDescribe}}
          </template>
        </el-table-column>
        <el-table-column
          label="房间价格"
          align = "center"
          width = "200">
          <template slot-scope = "scope">
            <i class="el-icon-shopping-cart-2"></i> {{scope.row.roomPrice}}
          </template>
        </el-table-column>
        <el-table-column
          label="房间数量"
          align = "center"
          width = "100">
          <template slot-scope = "scope">{{scope.row.roomCount}}
          </template>
        </el-table-column>
         <el-table-column
          label="房间余量"
          align = "center"
          width = "100">
          <template slot-scope = "scope"><span style="color:red">{{scope.row.currentNum}}</span>
          </template>
        </el-table-column>
      </el-table>
      <!-- <div style="margin-top: 20px">
        <el-button @click="toggleSelection([tableData[1], tableData[2]])">切换第二、第三行的选中状态</el-button>
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div> -->
      <el-dialog  :visible.sync="dialogVisible"  @opened = "opened" @close = "close" :close-on-click-modal = "false" :fullscreen = "false">       
        <el-form :model="formData" label-position="right" label-width="100px">
           <el-form-item><el-button icon="el-icon-s-promotion" @click = "saveRoom" style="margin:right;">修改</el-button> 
        </el-form-item>
        
        <el-form-item label="房间类型">
           <el-select v-model="formData.roomType" placeholder="请选择房间类型">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
           </el-form-item>
          <el-form-item label="房间价格"><el-input v-model="formData.roomPrice" placeholder="房间价格" style="width: 220px;"></el-input></el-form-item>
         
          <el-form-item label="房间数量"><el-input v-model="formData.roomCount" placeholder="房间数量" style="width: 220px;"></el-input></el-form-item>
         <div style="margin: 10px 0;"></div>
         <el-form-item label="房间简述">
         <el-input
        type="textarea"
        placeholder="请输入酒店简述"
        v-model="formData.roomDescribe"
        maxlength="255"
        show-word-limit
        style="width: 320px;"
        >
        </el-input>
        </el-form-item>
         <div style="margin: 10px 0;"></div>
       
        <el-form-item label="房间封面">
        <el-upload
        class="avatar-uploader"
        :action="uploadUrl"
        :show-file-list="false"
        name = "picture"
        :on-success="handleAvatarSuccess">
        <img v-if="formData.imgUrl" :src="formData.imgUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
          </el-form-item>
        </el-form>
        <!-- <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </div> -->
      </el-dialog>

      <el-dialog  :visible.sync="AddDialogVisible"  @opened = "addOpened" @close = "addClose" :close-on-click-modal = "false" :fullscreen = "false">       
        <el-form :model="addRoomData" label-position="right" label-width="100px">
          <el-form-item >
           <el-button icon="el-icon-s-promotion" @click = "submitRoom" style="margin:right;">添加房间</el-button>  </el-form-item>
        <el-form-item label="所属酒店">
           <el-select v-model="addRoomData.hotelId" placeholder="请选择酒店">
            <el-option
              v-for="item in hotelList"
              :key="item.id"
              :label="item.hotelName"
              :value="item.id">
            </el-option>
          </el-select>
           </el-form-item>
            <el-form-item label="房间类型">
           <el-select v-model="addRoomData.roomType" placeholder="请选择房间类型">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
           </el-form-item>
          <el-form-item label="房间价格"><el-input v-model="addRoomData.roomPrice" placeholder="房间价格" style="width: 220px;"></el-input></el-form-item>
         
          <el-form-item label="房间数量"><el-input v-model="addRoomData.roomCount" placeholder="房间数量" style="width: 220px;"></el-input></el-form-item>
         <div style="margin: 10px 0;"></div>
         <el-form-item label="房间简述">
         <el-input
        type="textarea"
        placeholder="请输入酒店简述"
        v-model="addRoomData.roomDescribe"
        maxlength="255"
        show-word-limit
        style="width: 320px;"
        >
        </el-input>
        </el-form-item>
         <div style="margin: 10px 0;"></div>
       
  <el-form-item label="房间封面">
        <el-upload
        class="avatar-uploader"
        :action="uploadUrl"
        :show-file-list="false"
        name = "picture"
        :on-success="addRoomImg">
        <img v-if="addRoomData.imgUrl" :src="addRoomData.imgUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload></el-form-item>
          <el-form-item>
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
import {searchRoomAPI,addRoomAPI,editRoomAPI,getAllHotelAPI,delRoomAPI} from "@/request/sys_api"
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
        hotelList:[],
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
          id:'',
          roomAddress:''
        },
        dialogVisible:false,
        AddDialogVisible:false,
        formLabelWidth: '120px',
        formData:{
          roomType:'',
          roomDescribe:'',
          roomPrice:'',
          roomCount:'',
          currentNum:"",
          imgUrl:'',
          id:null,
          userId:'',
          hotelName:''
        },
        uploadUrl:'',
         options: [{
          value: 1,
          label: '单人房'
        }, {
          value: 2,
          label: '双人房'
        },],
        addRoomData:{
          roomType:'',
          roomDescribe:'',
          roomPrice:'',
          roomCount:'',
          currentNum:"",
          imgUrl:'',
          userId:null,
          hotelName:'',
          hotelId:null,
        },
      }
    },
    mounted(){
        this.boxCardStyle = _global.boxCardStyle;
        this.uploadUrl = _global.uploadURL;
        this.getData();
        this.getAllHotel();
        this.addRoomData.userId = this.$store.state.userMsg.id;
    
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
        this.searchData.id = null;
        if(this.flag == 1){
          this.searchData.hotelName = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.id = parseInt(this.keyWord);
        }
        searchRoomAPI(this.pageData,this.searchData).then(function(res){
          console.log(res.data.data.roomIPage.records)
            this.tableData = res.data.data.roomIPage.records;
            this.pageData.total = res.data.data.roomIPage.total
        }.bind(this))
      },
      getAllHotel(){
        getAllHotelAPI().then(function(res){
          console.log(res.data.data.hotels1)
          this.hotelList = res.data.data.hotels1;
        }.bind(this))
      },
      checkNull(data){
            if(data == ''||data == null){
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
        addroom(){
             this.AddDialogVisible = true;
        },
      delRoom(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的房间！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"个房间？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delRoomAPI(this.deleteIds.join(",")).then(function(res){
              console.log(res)
              if(res.data.success){
                var s_count = res.data.data.result;
                var f_count = total-s_count;
                // this.$message.success("共"+total+"篇房间，删除成功"+s_count+"篇，失败"+f_count+"篇！")
                this.$message.success("成功删除所选房间！");
                this.reload();
              }else{
                this.$message.error(res.data.message);
              }
            }.bind(this))
            this.deleteIds = [];
          }).catch(()=>{});
          //.catch(()=>{})需要加上，否则会在控制台出现  Uncaught (in promise) cancel  错误
        }
      },
      editRoom(){
        if(this.multipleSelection.length != 1){
          this.$message.warning("请选择一个房间编辑！");
        }else{
          this.dialogVisible = true;
          this.formData = this.multipleSelection[0];
          this.formData.id = this.multipleSelection[0].id;
          console.log(this.formData)
          // this.$router.push({
          //   name:"editor",
          //   params:this.multipleSelection[0]
          // })
        }
      },
      opened(){
      },
      addOpened(){},
      close(){
        this.reload();
      },
      addClose(){
        this.reload();
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      saveRoom(){
        console.log(this.formData)
        editRoomAPI(this.formData).then(function(res){
          if(res.data.success){
              this.dialogVisible = false;
              this.$message.success(res.data.message);
              this.reload();
          }else{
              this.$message.error(res.data.message);
          }
        }.bind(this))
      },
      // 添加房间
      submitRoom(){
        if(this.addRoomData.hotelId == '' || this.addRoomData.hotelId == null){
                this.$message.error("请选择所属酒店！");
        }else{
        this.addRoomData.currentNum = this.addRoomData.roomCount;
            addRoomAPI(this.addRoomData).then(function(res){
              if(res.data.success){
                  this.dialogVisible = false;
                  this.$message.success(res.data.message);
                  this.reload();
              }else{
                  this.$message.error(res.data.message);
              }
            }.bind(this))
        }
        
      },
      searchRoom(){
        //selected 1:标题，2:作者
        this.pageData.currentPage = 1;
        this.flag = this.selected;
        if(this.keyWord == null || this.keyWord == ''){
            this.flag = 0
        }
        this.getData();
      },
      handleAvatarSuccess(res, file) {
        console.log(res)
        this.formData.imgUrl = res.data.fileItem.url;
      },
      addRoomImg(res,file){
        this.addRoomData.imgUrl = res.data.fileItem.url;
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