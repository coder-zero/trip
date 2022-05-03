<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="danger" @click = "delAllLog" icon = "el-icon-receiving">清空日志</el-button>
            <el-button size = "small" type="warning" @click = "delLog" icon = "el-icon-delete">删除日志</el-button>
            <el-button size = "small" type="success" @click = "downLogExcel" icon = "el-icon-download">导出日志</el-button>

            <el-button v-if = "dateVisible" size = "small" class = "searchBtn" icon="el-icon-search" @click = "searchBtn"></el-button>
            <el-date-picker
              v-if = "dateVisible"
              size = "small"
              type="daterange"
              v-model = "dateScope"
              value-format="yyyy-MM-dd"
              range-separator="至"
              start-placeholder="开始日期"
              :unlink-panels="true"
              end-placeholder="结束日期">
              
            </el-date-picker>
            
            <el-input v-if = "inputVisible" size = "small" placeholder="请输入内容" style="width: 20%;" class="input-with-select" v-model = "keyWord">
              
              <el-button slot="append" icon="el-icon-search" @click = "searchLog"></el-button>
            </el-input>
            <el-select @change = "selectChange" v-model = "searchType" size = "small" style="width: 120px;">
              <el-option label="模块" value="1"></el-option>
              <el-option label="操作" value="2"></el-option>
              <el-option label="方法名" value="3"></el-option>
              <el-option label="操作账号" value="4"></el-option>
              <el-option label="日期" value="5"></el-option>
            </el-select>    

        </el-card>
        <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        height = "390"  
        :header-row-style = "rowStyle"
        style="width: 100%"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          align = "center"
          width="55">
        </el-table-column>
        <el-table-column
          prop="module"
          width = "110"
          align = "center"
          label="模块">
        </el-table-column>
        <el-table-column
          prop="operator"
          width = "150"
          align = "center"
          label="操作">
        </el-table-column>
        <el-table-column
          prop="methodName"
          width = "110"
          align = "center"
          label="方法名">
        </el-table-column>
        <el-table-column
          prop="className"
          width = "500"
          align = "center"
          label="所在类">
        </el-table-column>
        <el-table-column
          prop="params"
          width = "400"
          align = "center"
          label="参数">
        </el-table-column>
        <el-table-column
          prop="recordDate"
          align = "center"
          width = "200"
          label="操作时间">
        </el-table-column>
        <el-table-column
          align = "center"
          label="执行时间">
          <template slot-scope = "scope">
            <p>{{scope.row.executeTime}} 毫秒</p>
          </template>
        </el-table-column>
        <el-table-column
          align = "center"
          label="操作账号">
          <template slot-scope = "scope">
            <p style="color: #909399;" v-if = "checkNull(scope.row.operateAccount)">未登录</p>
            <p v-if = "!checkNull(scope.row.operateAccount)">{{scope.row.operateAccount}}</p>
          </template>
        </el-table-column>
        <el-table-column
          label="结果">
          <template slot-scope = "scope">
            <p style="color: #67C23A;" v-if = "scope.row.operateResult == 1">成功</p>
            <p style="color: #F56C6C;" v-if = "scope.row.operateResult == 0">失败</p>
          </template>
        </el-table-column>
        
      </el-table>
      <!-- <div style="margin-top: 20px">
        <el-button @click="toggleSelection([tableData[1], tableData[2]])">切换第二、第三行的选中状态</el-button>
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div> -->
      <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>



    </el-card>
</template>
<script>
import Pagination from '@/components/Pagination'
import {searchLogAPI,delLogAPI,delAllLogAPI,downLogExcelAPI} from "@/request/sys_api"
import _global from '@/assets/js/global.js'
export default {
    inject:['reload'],
    components:{
        Pagination
    },
    data() {
      return {
        tableData: [],
        multipleSelection: [],
        selected:"1",
        keyWord:'',
        roleList:[],
        pageData:{
          total:0,
          currentPage:1,
          pageSize:10,
          pageSizes:[10,20,40,100]
        },
        dateScope:[],
        searchType:'',
        rowStyle:{height:'70px'},
        dateVisible:false,
        inputVisible:true,
        boxCardStyle:'height:98%;',
        deleteIds:[],
        flag:0, //用来标志搜索类型，0表示搜索所有数据
        searchData:{
          methodName:'',
          operateAccount:'',
          operator:'',
          module:'',
          startDate:'',
          endDate:''
        }
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
      clearSearchData(){
        this.searchData.methodName = '';
        this.searchData.operateAccount = '';
        this.searchData.operator = '';
        this.searchData.module = '';
        this.searchData.startDate = '';
        this.searchData.endDate = '';
      },
      getData(){
        this.clearSearchData();
        if(this.flag == 1){
          this.searchData.module = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.operator = this.keyWord;
        }else if(this.flag == 3){
          this.searchData.methodName = this.keyWord;
        }else if(this.flag == 4){
          this.searchData.operateAccount = this.keyWord;
        }else if(this.flag == 5){
          this.searchData.startDate = this.dateScope[0];
          this.searchData.endDate = this.dateScope[1];
        }
        searchLogAPI(this.pageData,this.searchData).then(function(res){
          this.tableData = res.data.data.logIPage.records;
          this.pageData.total = res.data.data.logIPage.total
        }.bind(this))
      },
      checkNull(data){
            if(data == ''||data == null || data.trim() == ''){
                return true;
            }
            return false;
      },
      delLog(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的数据！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"条记录？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delLogAPI(this.deleteIds.join(",")).then(function(res){
              console.log(res)
              if(res.data.success){
                var s_count = res.data.data.result;
                var f_count = total-s_count;
                this.$message.success("共"+total+"条数据，删除成功"+s_count+"条，失败"+f_count+"条！")
                this.reload();
              }
            }.bind(this))
            this.deleteIds = [];
          }).catch(()=>{});
          //.catch(()=>{})需要加上，否则会在控制台出现  Uncaught (in promise) cancel  错误
        }
      },
      delAllLog(){
      
        this.$confirm("删除后数据不可恢复，是否确认删除所有记录？", '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          delAllLogAPI().then(function(res){
            console.log(res)
            if(res.data.success){
              
              this.$message.success("日志记录已全部清除！")
              this.reload();
            }
          }.bind(this))
        }).catch(()=>{});
          //.catch(()=>{})需要加上，否则会在控制台出现  Uncaught (in promise) cancel  错误
        
      },
      downLogExcel(){
        this.$confirm("是否确认将所有日志导出到excel并下载？", '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          window.location.href = _global.downLogExcelURL;
        }).catch(()=>{});
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      selectChange(){
        if(this.searchType == "5"){
          this.dateScope = '';
          this.inputVisible = false;
          this.dateVisible = true;
        }else{
          this.dateVisible = false;
          this.inputVisible = true;
        }
      },
      searchBtn(){
        this.flag = 5
        if(this.dateScope.length < 2){
          this.$message.warning("请选择起止日期！");
        }else{
          this.pageData.currentPage = 1;
          this.getData();
        }
      },
      searchLog(){
        //searchType 1:模块，2:操作，3：方法名，4：操作账号，5：日期
        this.pageData.currentPage = 1;
        this.flag = this.searchType;
        if(this.keyWord == null || this.keyWord == ''){
            this.flag = 0
        }
        this.getData();
        
      }
    }
  }
</script>
<style scoped>
.searchBtn,.el-date-editor{
  position: relative;
  float: right;
}
.el-select{
  position: relative;
  float: right;
}
.input-with-select{
    position: relative;
    float: right;
}
.searchBtn{
  margin-left:0 ;
}

</style>