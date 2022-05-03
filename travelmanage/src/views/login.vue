<template>
  <div class="login_container" :style = "loginStyle">
    <div  class="login_title"><h1>{{login_title}}</h1></div>
     
    <div class="login_box">
    
      <el-form
        :rules="rules"
        ref="form"
        :model="loginForm"
        class="loginContainer"
      >
        <h3 class="loginTitle">系统登陆</h3>
        <el-form-item prop="username">
          <input
            type="password"
            name="password1"
            style="position: fixed; left: -9999px"
          />

          <el-input
            type="text"
            v-model="loginForm.username"
            auto-complete="false"
            placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <input
            type="password"
            name="password"
            style="position: fixed; left: -9999px"
          />

          <el-input
            type="password"
            v-model="loginForm.password"
            auto-complete="false"
            placeholder="请输入密码"
          ></el-input>
        </el-form-item>

        <el-form-item prop="roleId">
          <el-select v-model="loginForm.roleId" style="width: 100%" placeholder="请选择角色">
            <el-option
              v-for="item in roles"
              :key="item.id"
              :label="item.roleName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-checkbox v-model="checked" class="loginRemember"
          >记住我</el-checkbox>
        <el-link class = "registerLink" type="primary" @click = "register"  :underline="false">用户注册</el-link>
        <el-button
          type="primary"
          style="width: 100%"
          v-on:click="submit"
          :loading="changeLoading"
          >登录</el-button
        >
      </el-form>
    </div>
  </div>
</template>
<script>
// import { postLoginAPI, getUserMsgAPI, getMenuAPI } from "@/request/api";
// import { initDynamicRoutes } from "@/router/index.js";
import {getAllRoleAPI,postLoginAPI,getUserMsgAPI} from "@/request/sys_api"
import _global from "@/assets/js/global.js"
export default {
  inject: ["reload"],
  data() {
    return {
      changeLoading: false,
      roles:[],
      loginForm: {
        username: "",
        password: "",
        roleId: null,
      },
      login_title:"演示系统",
      checked: true,
      loginStyle:{
        height: "100%",
        // backgroundColor: "#409EFF",
        backgroundImage:'url(' + require('../assets/img/bg3.jpeg') + ')',
        backgroundSize:"cover"
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
        roleId: [
          { required: true, message: "请至少选择一项", trigger: "blur" },
        ],
      },
    };
  },
  mounted() {
    this.inital();
  },
  methods: {
    inital(){
      sessionStorage.clear();
      this.login_title = _global.login_title;
      getAllRoleAPI().then(
        function(res){
          this.roles = res.data.data.roleList;
          if (this.getCookie("username")) {
            // console.log(document.cookie)
            this.loginForm.roleId = parseInt(this.getCookie("roleId"));
            // console.log(this.loginForm.roleId)
            this.loginForm.username = this.getCookie("username");
            this.loginForm.password = this.getCookie("password");
          }
        }.bind(this)
      );
    },
    register(){
      this.$router.push("/register");
    },
    setCookie(c_name, c_pwd,c_role, exdate) {
      //账号，密码 ，过期的天数
      var exdate = new Date();
      exdate.setTime(exdate.getTime() + 24 * 60 * 60 * 1000 * exdate); //保存的天数
      document.cookie =
        "username=" + c_name + ";path=/;expires=" + exdate.toLocaleString();
      document.cookie =
        "password=" + c_pwd + ";path=/;expires=" + exdate.toLocaleString();
      document.cookie =
        "roleId=" + c_role + ";path=/;expires=" + exdate.toLocaleString();
    },
    getCookie(name) {
      var arr = document.cookie.split(";");
      //["_ga=GA1.1.1756734561.1561034020", " mobile=123" password=456"]
      for (var i = 0; i < arr.length; i++) {
        var arr2 = arr[i].split("="); // ["_ga", "GA1.1.1756734561.1561034020"]
        if (arr2[0].trim() == name) {
          return arr2[1];
        }
      }
    },
    clearCookie() {
      // this.setCookie(password, "", -1); //清除cookie
      document.cookie = "password=0;expires=" + new Date().toUTCString();
      document.cookie = "username=0;expires=" + new Date().toUTCString();
      document.cookie = "roleId=0;expires=" + new Date().toUTCString();
    },
    submit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.changeLoading = true;
          this.loginForm.username = this.loginForm.username.trim();
          postLoginAPI(this.loginForm).then(
            function (res) {
              //登陆成功
              if (res.data.success == true) {
                if(this.checked){
                  this.setCookie(this.loginForm.username,this.loginForm.password,this.loginForm.roleId,7);
                }else{
                  this.clearCookie();
                }
                window.sessionStorage.setItem("token", res.data.message);
                this.$store.commit("initToken");
                getUserMsgAPI().then(
                  function (res) {
                    // console.log("start"+res.data.data.user.roleId)
                    // window.sessionStorage.setItem(
                    //   "user",
                    //   JSON.stringify(res.data.data.user)
                    // );
                    
                    sessionStorage.setItem("user",JSON.stringify(res.data.data.user));
                    this.$store.commit('setUserMsg',res.data.data.user);
                    // this.$store.dispatch("getuserMsgsyhc");
                    // var roleId = res.data.data.user.roleId;
                    // getMenuAPI(roleId).then(
                    //   function (res) {
                    //     window.sessionStorage.setItem(
                    //       "MenuList",
                    //       JSON.stringify(res.data.data.menuTree)
                    //     );
                    //     this.$store.commit("getMenuList");
                        
                    //   }.bind(this)
                    // );
                    this.changeLoading = false;
                    this.$router.push("/home");
                  }.bind(this)
                );
              } else {
                this.clearCookie();
                this.$message.error(res.data.message);
                this.changeLoading = false;
              }
            }.bind(this)
          );
        }
      });
    },
  },
};
</script>
<style lang="less" scoped>

.login_title{
  position: absolute;
  left: 50%;
  top: 18%;
  font-size: 25px;
  color: rgb(255, 255, 255);
  letter-spacing:10px;
  transform: translate(-50%, -50%);
  font-family:KaiTi;
}
.login_box {
  width: 430px;
  height: 300px;
  border-radius: 3px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.loginContainer {
  border-radius: 15px;
  background-clip: padding-box;

  width: 350px;
  padding: 15px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
.loginTitle {
  margin: 0px auto 40px auto;
  text-align: center;

}

.loginRemember {
  float: left;
  margin: 0px 0px 15px 0px;
}

.registerLink{
  position: relative;
  float: right;
  bottom:4px;
}
</style>