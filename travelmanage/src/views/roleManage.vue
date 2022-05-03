<template>

    <el-card class = "box-card" :style="boxCardStyle">
        
    <el-table
    :data="tableData"
    height = "438"
    style="width: 100%">
    <el-table-column
      label="角色名称"
      align = "center"
      prop="roleName">
    </el-table-column>
    <el-table-column
      align = "center"
      label="角色介绍">
      <template slot-scope="scope">
        <p style="color: #909399;" v-if="scope.row.introduce.trim() == ''">暂无介绍</p>
        <p v-if="scope.row.introduce.trim() != ''">{{scope.row.introduce}}</p>
      </template>
    </el-table-column>
    <el-table-column
      align="center"
      width = "300">
      <template slot="header" slot-scope="scope">
        <el-button
          size = "small"
          plain
          type = "success"
          icon="el-icon-circle-plus-outline"
          @click="handleAdd()">新增角色</el-button>
      </template>
      <template slot-scope="scope">
        <el-button
          round
          size="mini"
          type = "warning"
          icon="el-icon-edit"
          @click="handleEdit(scope.row)">修改</el-button>
        <el-button
          round
          size="mini"
          type="danger"
          icon = "el-icon-delete"
          @click="handleDelete(scope.row.id)">删除</el-button>
        <el-button
          round
          size="mini"
          type="primary"
          icon = "el-icon-coordinate"
          @click="handleGrant(scope.row.id,scope.row.roleName)">授权</el-button>
      </template>
    </el-table-column>
  </el-table>
    <!-- 调用封装的分页插件，pageData传递的是分页相关的数据，getPageData传递的是获取分页数据的函数 -->
    <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>

    <!-- 添加修改角色的对话框 -->
    <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" @close = "close">
      <el-form :model="dialogForm" :rules = "rules" ref = "dialogForm">
        <el-form-item label="角色名称" :label-width="formLabelWidth" prop = "roleName">
          <el-input v-model="dialogForm.roleName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="角色介绍" :label-width="formLabelWidth" prop = "introduce">
          <el-input type = "textarea" v-model="dialogForm.introduce" :rows = "4" autocomplete="off" maxlength="100" show-word-limit></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitData">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 分配角色权限的对话框 -->
    <el-dialog
      :title="grantTitle"
      :visible.sync="treeVisible"
      width="50%"
      @close = "grantClose"
    >
      <el-tree
        :data="menuList"
        :props="treeProps"
        show-checkbox
        node-key="id"
        default-expand-all
        :check-strictly = "checkStrictly"
        ref="treeRef"
      ></el-tree>
      <span slot="footer" class="dialog-footer">
        <el-button @click="treeVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitGrant">确 定</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>
<script>
import {addRoleAPI,editRoleAPI,delRoleAPI,getAllMenuAPI,grantRoleAPI,getRightsByIdAPI,searchRoleAPI} from "@/request/sys_api"
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
        dialogVisible:false,
        treeVisible:false,
        checkStrictly:false,
        grantTitle:'',
        menuList:[],
        dialogTitle:'',
        dialogForm:{
          id:null,
          introduce:'',
          roleName:''
        },
        grantData:{
          id:null,
          menuIds:''
        },
        rights:[],
        treeProps: {
          children: 'children',
          label: 'menuName'
        },
        searchData:{
          roleName:''
        },
        boxCardStyle:'height:98%;',
        formLabelWidth: '120px',
        rules: {
          roleName: [{ required: true, message: '请输入角色名称', trigger: 'blur' }]
        }
      }
    },
    mounted(){
        this.boxCardStyle = _global.boxCardStyle;
        this.getData();
    },
    methods: {
      handleAdd(){
        this.dialogTitle = "新增角色";
        this.dialogVisible = true;
      },
      handleEdit(row) {
        this.dialogForm.id = row.id;
        this.dialogForm.introduce = row.introduce;
        this.dialogForm.roleName = row.roleName;
        this.dialogTitle = "修改角色";
        this.dialogVisible = true;
      },
      handleDelete(id) {
        this.$confirm('此操作将永久删除该条记录, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          delRoleAPI(id).then(function(res){
            if(res.data.success){
              this.$message.success(res.data.message)
              this.reload()
            }else{
              this.$message.warning(res.data.message)
            }
          }.bind(this))
        })
      },

      handleGrant(id,roleName) {
        // this.setRights(id);
        this.grantData.id = id;
        this.grantTitle = "分配权限--"+roleName;
        getRightsByIdAPI(id).then(function(res){
          this.rights = res.data.data.rights;

          
          getAllMenuAPI().then(function(res){
            this.menuList = res.data.data.menuList;
            this.treeVisible = true;
            this.checkStrictly = true;
            this.$nextTick(() => {
              
              this.$refs.treeRef.setCheckedKeys(this.rights);
              this.checkStrictly = false;
            })
          }.bind(this))
          // console.log("getRights "+this.rights)//4
        }.bind(this))
        
        // getRightsByIdAPI(id).then(function(res){
        //   this.rights = res.data.data.rights;
        //   console.log("getRights "+this.rights)//4
        // }.bind(this))
      },
      close(){
        this.$refs.dialogForm.resetFields();//必须要在重置数据前面
        this.dialogForm.id = null;
        this.dialogForm.introduce = '';
        this.dialogForm.roleName = '';
      },
      grantClose(){
        this.rights.splice(0);
      },
      getData(){
          searchRoleAPI(this.pageData,this.searchData).then(
              function(res){
                  this.tableData = res.data.data.roleIPage.records;
                  this.pageData.total = res.data.data.roleIPage.total
              }.bind(this)
          )
      },
      submitGrant(){
        var rights = this.$refs.treeRef.getCheckedKeys().concat(this.$refs.treeRef.getHalfCheckedKeys());
        this.grantData.menuIds = rights.join(",");
        grantRoleAPI(this.grantData).then(function(res){
          if(res.data.success){
            this.$message.success(res.data.message)
          }else{
            this.$message.error(res.data.message)
          }
          this.treeVisible = false;
        }.bind(this))
      },
      submitData(){
        this.$refs.dialogForm.validate((valid) => {
          if (valid) {
            if(this.dialogForm.id == null){
              addRoleAPI(this.dialogForm).then(function(res){
                // console.log(res)
                //角色信息添加成功
                if(res.data.success){
                  //做出提示
                  this.$message.success(res.data.message);
                  //关闭对话框
                  this.dialogVisible = false;
                  //刷新页面重新获取数据
                  this.reload();
                  }
              }.bind(this))
            }else{
              editRoleAPI(this.dialogForm).then(function(res){
                //角色信息修改成功
                if(res.data.success){
                  //做出提示
                  this.$message.success(res.data.message);
                  //关闭对话框
                  this.dialogVisible = false;
                  //刷新页面重新获取数据
                  this.reload();
                }
              }.bind(this))
            }
            
          }
        });
      }
 
    }
  }
</script>
<style scoped>

</style>