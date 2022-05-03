<template>
    <el-card class="card-box" :style="boxCardStyle">
        <el-card class="card-box">
            <el-button size = "small" type="primary" @click = "addUser">添加用户</el-button>
            <el-button size = "small" type="danger" @click = "delUser">删除用户</el-button>
            <el-button size = "small" type="warning" @click = "editUser">修改用户</el-button>
            <el-input size = "small" placeholder="请输入内容" v-model="keyWord" class="input-with-select" style="width: 40%;" @input = "searchUser">
                <el-select @change = "searchUser" v-model="selected" slot="prepend" style="width: 100px;">
                  <el-option label="用户名" value="1"></el-option>
                  <el-option label="姓名" value="2"></el-option>
                </el-select>
                
            </el-input>
        </el-card>
        <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        height = "375"  
        :header-row-style = "rowStyle"
        style="width: 100%"
        @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          align = "center"
          width="55">
        </el-table-column>
        <el-table-column
          prop="username"
          align = "center"
          label="用户名">
        </el-table-column>
        <el-table-column
          align = "center"
          label="真实姓名">
          <template slot-scope = "scope">
            <p style="color: #909399;" v-if = "checkNull(scope.row.realName)">暂未填写</p>
            <p v-if = "!checkNull(scope.row.realName)">{{scope.row.realName}}</p>
          </template>
        </el-table-column>
        <el-table-column
          align = "center"
          label="角色">
          <template slot-scope = "scope">
            <el-tag><i class="el-icon-s-custom"></i> {{scope.row.roleName}}</el-tag>
          </template>
        </el-table-column>
      </el-table>
      <!-- <div style="margin-top: 20px">
        <el-button @click="toggleSelection([tableData[1], tableData[2]])">切换第二、第三行的选中状态</el-button>
        <el-button @click="toggleSelection()">取消选择</el-button>
      </div> -->
      <Pagination :pageData = "pageData" :getPageData = "getData"></Pagination>

      <!-- 添加用户的对话框 -->
      <el-dialog width = "40%" title="新增用户" :visible.sync="dialogVisible" @close = "close">
        <el-form :model="dialogForm" :rules = "rules" ref = "dialogForm">
          <el-form-item label="用户名" :label-width="formLabelWidth" prop = "username">
            <input type="password" name="username" style="position: fixed;left: -9999px;">
            <el-input v-model="dialogForm.username" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="密码" :label-width="formLabelWidth" prop="password">
            <input type="password" name="password" style="position: fixed;left: -9999px;">
            <el-input type="password" v-model="dialogForm.password" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" :label-width="formLabelWidth" prop="checkPass">
            <el-input type="password" v-model="dialogForm.checkPass" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="真实姓名" :label-width="formLabelWidth" prop = "realName">
            <el-input v-model="dialogForm.realName"  autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="角色名称" :label-width="formLabelWidth" prop = "roleId">
            <el-select v-model="dialogForm.roleId" style="width: 100%;"  placeholder="请选择用户角色">
              <el-option v-for="item in roleList" :key="item.id" :label="item.roleName" :value="item.id"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="submitData">确 定</el-button>
        </div>
      </el-dialog>

      <!-- 修改用户的对话框 -->
      <el-dialog width = "40%" title="修改用户信息" :visible.sync="dialogEdit" @close = "close">
        <el-form :model="dialogForm" :rules = "rules" ref = "dialogForm">
          <el-form-item label="用户名" :label-width="formLabelWidth" prop = "username">
            <input type="password" name="username" style="position: fixed;left: -9999px;">
            <el-input v-model="dialogForm.username" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="真实姓名" :label-width="formLabelWidth" prop = "realName">
            <el-input v-model="dialogForm.realName"  autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="角色名称" :label-width="formLabelWidth" prop = "roleId">
            <el-select v-model="dialogForm.roleId" style="width: 100%;"  placeholder="请选择用户角色">
              <el-option v-for="item in roleList" :key="item.id" :label="item.roleName" :value="item.id"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogEdit = false">取 消</el-button>
          <el-button type="primary" @click="submitData">确 定</el-button>
        </div>
      </el-dialog>

    </el-card>
</template>
<script>
import Pagination from '@/components/Pagination'
import {getAllRoleAPI,registerAPI,editUserAPI,delUserAPI,getSearchUserAPI} from "@/request/sys_api"
import _global from '@/assets/js/global.js'
export default {
    inject:['reload'],
    components:{
        Pagination
    },
    data() {
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.dialogForm.checkPass !== '') {
            this.$refs.dialogForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.dialogForm.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
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
        rowStyle:{height:'70px'},
        dialogTitle:'',
        dialogForm:{
            id:null,
            username:'',
            realName:'',
            password:'',
            checkPass:'',
            roleId:null
        },
        searchData:{
          username:'',
          realName:''
        },
        rules: {
          password: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          username: [
            { required: true, message: '请输入用户名', trigger: 'blur' }
          ],
          realName: [
            { required: true, message: '请输入姓名', trigger: 'blur' }
          ],
          roleId: [
            { required: true, message: '请选择用户角色', trigger: 'change' }
          ]
        },
        boxCardStyle:'height:98%;',
        formLabelWidth: '100px',
        dialogVisible:false,
        dialogEdit:false,
        deleteIds:[],
        flag:0
      }
    },
    mounted(){
        this.boxCardStyle = _global.boxCardStyle;
        getAllRoleAPI().then(function(res){
          this.roleList = res.data.data.roleList;
        }.bind(this))
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
        this.searchData.username = '';
        this.searchData.realName = '';
        if(this.flag == 1){
          this.searchData.username = this.keyWord;
        }else if(this.flag == 2){
          this.searchData.realName = this.keyWord;
        }
        getSearchUserAPI(this.pageData,this.searchData).then(function(res){
            this.tableData = res.data.data.userIPage.records;
            this.pageData.total = res.data.data.userIPage.total
        }.bind(this))
      },
      checkNull(data){
            if(data == ''||data == null || data.trim() == ''){
                return true;
            }
            return false;
      },
      addUser(){
        this.dialogVisible = true;
      },
      editUser(){
        if(this.multipleSelection.length != 1){
          this.$message.warning("请选择一行数据进行编辑!");
        }else{
          var selectData = this.multipleSelection[0];
          this.dialogForm.id = selectData.id;
          this.dialogForm.username = selectData.username;
          this.dialogForm.realName = selectData.realName;
          this.dialogForm.roleId = selectData.roleId;

          this.dialogEdit = true;
        }
      },
      delUser(){
        if(this.multipleSelection.length == 0){
          this.$message.warning("请选择需要删除的数据！");
        }else{
          this.$confirm('是否确认删除所选中的'+this.multipleSelection.length+"条用户？", '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            var total = this.multipleSelection.length;
            for(let selectedItem of this.multipleSelection){
              this.deleteIds.push(selectedItem.id);
            }
            delUserAPI(this.deleteIds.join(",")).then(function(res){
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
      close(){
        this.$refs.dialogForm.resetFields();//必须要在重置数据前面
        this.dialogForm.id = null;
        this.dialogForm.realName = '';
        this.dialogForm.roleName = '';
        this.dialogForm.roleId = null;
        this.dialogForm.password = '';
        this.dialogForm.checkPass = '';
        this.dialogForm.username = '';
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      searchUser(){
        //selected 1:用户名，2:姓名
        this.pageData.currentPage = 1;
        this.flag = this.selected;
        if(this.keyWord == null || this.keyWord == ''){
          this.flag = 0
        }
        this.getData();
      },  
      submitData(){
        this.$refs.dialogForm.validate((valid) => {
          if (valid) {
            if(this.dialogForm.id != null){//修改用户信息
              console.log(this.dialogForm)
              editUserAPI(this.dialogForm).then(function(res){
                // console.log(res)
                if(res.data.success){
                  this.$message.success(res.data.message);
                  this.reload();
                }else{
                  this.$message.warning(res.data.message);
                }
              }.bind(this))
            }else{//新增用户信息
              registerAPI(this.dialogForm).then(function(res){
                if(res.data.success){
                  this.$message.success(res.data.message);
                  this.reload();
                }else{
                  this.$message.warning(res.data.message);
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
.input-with-select{
    position: relative;
    float: right;
}

</style>