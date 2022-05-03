<template>
  <el-container class="home_container">
    <!-- 头部区 -->
    <el-header height="65px"
      ><div>
        <i class="el-icon-menu" @click="changeDisplay"></i>
        <span class = "headerTitle">{{headTitle}}</span>
      </div>
      <div>
        <div style="float: left;width: 50px;" @click = "changeAva">
          <el-avatar :src="(user.imgUrl == ''||user.imgUrl == null) ? defaultUrl:user.imgUrl"></el-avatar>
        </div>
        <!-- 用户名下拉菜单  {{this.$store.getters.getUserName}} -->
        <el-dropdown class="user-name" trigger="click" @command="handleCommand">
          <span class="el-dropdown-link">您好，{{user.realName}}
            <i class="el-icon-caret-bottom"></i>
          </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="changePassword">修改密码</el-dropdown-item>
            <el-dropdown-item divided command="loginout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </el-header>
    <!-- 页面主体区域 -->
    <el-container style="overflow-y: scroll;">
      <!-- 侧边菜单 -->
      <el-aside :width="isCollapse ? '64px' : '200px'">
        <el-menu
          router
          :default-active="currentMenu"
          class="el-menu-vertical-demo"
          @open="handleOpen"
          @close="handleClose"
          background-color="#545c64"
          text-color="#fff"
          :collapse="isCollapse"
          :collapse-transition = false
          active-text-color="#ffd04b"
          :unique-opened = true
        >
           <MenuTree  :menuList="this.menuList"></MenuTree>
        </el-menu>
      
      </el-aside>
      <!-- 右侧主体 -->
      <el-main>

        <!-- 修改密码对话框-->
        <el-dialog @close = "resetForm" title="修改密码" width="380px" :visible.sync="dialogVisible">
          <el-form :rules="rules" :model="form" ref = "form" label-width="80px" style="width:300px;">
              <el-form-item label="原密码" prop="oldPass">
                  <el-input type="password" v-model="form.oldPass" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item label="新密码" prop="password">
                  <el-input type="password" v-model="form.password" autocomplete="off"></el-input>
              </el-form-item>
              <el-form-item label="确认密码" prop="checkPass">
                  <el-input type="password" v-model="form.checkPass" autocomplete="off"></el-input>
              </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="editPass">确 定</el-button>
          </div>
        </el-dialog>

        <!-- 上传头像对话框-->
        <el-dialog title="修改头像" width="200px" :visible.sync="dialogAva" :close-on-click-modal = "false" @close = "close">
          <el-upload
            :action="uploadURL"
            :class="{hide:uploadDisabled}"
            :on-change = "changeEvent"
            :on-success = "uploadSuccess"
            :auto-upload="false"
            list-type="picture-card"
            ref = "upload"
            name = "picture">
              <i slot="default" class="el-icon-plus"></i>
              <div slot="file" slot-scope="{file}">
                <img
                  class="el-upload-list__item-thumbnail"
                  :src="file.url" alt=""
                >
                <span class="el-upload-list__item-actions">
                  <span
                    class="el-upload-list__item-preview"
                    @click="handlePictureCardPreview(file)"
                  >
                    <i class="el-icon-zoom-in"></i>
                  </span>
                  
                </span>
              </div>
          </el-upload>
          <el-dialog :visible.sync="imgDialog" :modal = "false">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
          <div slot="footer" class="dialog-footer">
              <el-button @click="dialogAva = false">取 消</el-button>
              <el-button type="primary" @click="saveAva">确 定</el-button>
          </div>
        </el-dialog>

        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import MenuTree from '@/components/MenuTree'
import { initDynamicRoutes } from "@/router/index.js";
import {getMenuAPI,editPassAPI,editAvatarAPI } from "@/request/sys_api";
import _global from "@/assets/js/global.js"
export default {
  inject: ["reload"],
  data() {
    var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.form.checkPass !== '') {
            this.$refs.form.validateField('checkPass');
          }
          callback();
        }
      };
    var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.form.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
    };
    return {
      //左侧菜单数据
      menuList:[],
      isCollapse: false,
      currentMenu: "/home/index",
      user:{},
      dialogVisible:false,
      dialogAva:false,
      uploadDisabled:false,
      disabled:false,
      imgDialog:false,
      dialogImageUrl:'',
      uploadURL:'',
      defaultUrl:require('@/assets/img/defaultAvatar.png'),
      form: {
        password:'',
        checkPass:'',
        oldPass:'',
        id:null,
        imgUrl:''
      },
      headTitle:"旅游网站管理系统",
      rules: {
        password: [
            { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
            { validator: validatePass2, trigger: 'blur' }
        ],
        oldPass: [
            { required:true,message:'请输入原密码', trigger: 'blur' }
        ]
      }
      
    };
  },
  components:{
    MenuTree
  },
  // computed: {
   
  //  uploadDisabled:function() {
  //      return this.imageList.length >0
  //  },
 
  // },
  mounted(){
    this.getMenuList();
    this.uploadURL = _global.uploadURL;
    // console.log(this.currentMenu)
    if(this.currentMenu == "/home/index"){
      this.$router.push("/home/index")
    }
    // console.log("mounted")
  },

  created(){
    this.getUrl();
    // console.log("created")
  },
  methods: {
    handleOpen(key, keyPath) {
    },
    handleClose(key, keyPath) {
    },
    resetForm() {
      this.$refs.form.resetFields();
      
    },
    changeAva(){
        this.dialogAva = true;

    },
    saveAva(){
      this.$refs.upload.submit();
      // 
    },
    uploadSuccess(response, file, fileList){
      this.form.imgUrl = response.data.fileItem.url;
      this.form.id = this.user.id;
      console.log(this.form.imgUrl)
      
      editAvatarAPI(this.form).then(function(res){
        if(res.data.success){
          this.$message.success(res.data.message);
          this.dialogAva = false;
        }
      }.bind(this))
    },
    handlePictureCardPreview(file) {
        this.dialogImageUrl = file.url;
        this.imgDialog = true;
    },
    close(){
      this.$refs.upload.clearFiles();
      this.uploadDisabled = false;

    },

    changeEvent(file, fileList){
      this.uploadDisabled = fileList.length >= 1;
      
    },
    getUrl(){
      let currentUrl = window.location.href;
      if(currentUrl.split('/')[4]){
        this.currentMenu = "/home/"+currentUrl.split('/')[4];
      }
    },
    getMenuList(){
      this.headTitle = _global.headTitle;
      this.user = this.$store.state.userMsg;
      // console.log(this.user)
      getMenuAPI(this.user.roleId).then(
        function(res){
          this.menuList = res.data.data.menuTree;
          initDynamicRoutes(res.data.data.menuTree);
          window.sessionStorage.setItem("MenuList",JSON.stringify(res.data.data.menuTree));//不能删除，这是用来将菜单存起来防止刷新页面消失
        }.bind(this)
        
      );
    },
    editPass(){
      this.$refs.form.validate((valid) => {
          if (valid) {
              this.form.id = this.user.id;
              editPassAPI(this.form).then(function(res){
                if(res.data.success){
                  this.$message.success(res.data.message);
                  this.dialogVisible = false;
                }else{
                  this.$message.warning(res.data.message)
                }
              }.bind(this))
          }
      });
    },
    changeDisplay() {
      this.isCollapse = !this.isCollapse;
    },
    handleCommand(command) {
      if (command == "loginout") {

        sessionStorage.clear();
        this.$store.commit('initToken');
        // this.$store.commit('getuserMsg');
        this.$store.commit('getMenuList');
        this.$router.push("/login");
        window.location.reload();
      }
      if(command == 'changePassword'){
        this.dialogVisible = true;
      }
    },

    
    
    
  },
};
</script>
<style>
.home_container {
  height: 100%;
}

.el-header {
  background-color: rgb(128, 181, 228);
  display: flex;
  justify-content: space-between;
  height: 75px !important;
  align-items: center;
  color: aliceblue;
  font-size: 25px;

}

.el-aside {
  background-color: #545c64;
}
.el-menu {
  border-right: 0;
}
.headerTitle{
  margin-left: 25px;
  font-family: 'KaiTi';
  font-size: 25px;
}
.hide .el-upload--picture-card {
    display: none;
}
</style>