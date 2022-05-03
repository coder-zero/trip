<template>

  <el-card class = "box-card" :style="boxCardStyle">
      
  <el-table
  :data="tableData"
  height = "433"
  style="width: 100%">
  <el-table-column
    label="角色名称"
    align="center"
    width = "200"
    prop="roleName">
  </el-table-column>
  <el-table-column
    align="center"
    label="角色介绍">
    <template slot-scope="scope">
      <p style="color: #909399;" v-if="scope.row.introduce.trim() == ''">暂无介绍</p>
      <p v-if="scope.row.introduce.trim() != ''">{{scope.row.introduce}}</p>
    </template>
  </el-table-column>
  <el-table-column
    align="center"
    width = "260">
    <template slot="header" slot-scope="scope">
      <el-input
          v-model="keyWord"
          size="mini"
          @input = "searchRole"
          placeholder="输入角色名搜索"/>
    </template>
    <template slot-scope="scope">
      <el-switch
        @change = "changeValue(scope.row.id)"
        v-model="scope.row.isRegister"
        active-color="#13ce66"
        inactive-color="#ff4949"
        :active-value="1"
        :inactive-value="0"
        active-text="可注册"
        inactive-text="不可注册">
      </el-switch>
    </template>
  </el-table-column>
</el-table>
  <!-- 调用封装的分页插件，pageData传递的是分页相关的数据，getPageData传递的是获取分页数据的函数 -->
  <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>

</el-card>
</template>
<script>
import {editStatusAPI,searchRoleAPI} from "@/request/sys_api"
import Pagination from '@/components/Pagination'
import _global from '@/assets/js/global.js'
export default {
  inject:['reload'],
  components:{
    Pagination
  },
  data() {
    return {
      tableData: [],
      pageData:{
        total:0,
        currentPage:1,
        pageSize:10,
        pageSizes:[10,20,40,100]
      },
      keyWord:'',
      searchData:{
        roleName:''
      },
      boxCardStyle:'height:98%;'
      
    }
  },
  mounted(){
      this.boxCardStyle = _global.boxCardStyle;
      this.getData();
  },
  methods: {
   
    getData(){
      this.searchData.roleName = this.keyWord;
      searchRoleAPI(this.pageData, this.searchData).then(function(res){
        this.tableData = res.data.data.roleIPage.records;
        this.pageData.total = res.data.data.roleIPage.total
      }.bind(this))
    },
    changeValue(id){
      editStatusAPI(id).then(function(res){
      })
    },
    searchRole(){
      // console.log(this.keyWord)
      this.pageData.currentPage = 1;
      this.getData();
        // console.log("姓名 "+this.keyWord)
      
    }

  }
}
</script>
<style scoped>

</style>