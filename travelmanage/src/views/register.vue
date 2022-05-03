<template>
  <div class="login_container" :style = "registerStyle">
    <div  class="login_title"><h1>基于vue的二次开发系统</h1></div>
     
    <div class="login_box">
    
      <el-form
        :rules="rules"
        ref="form"
        :model="registerForm"
        class="loginContainer"
      >
        <h3 class="loginTitle">系统注册</h3>
        <el-form-item prop="username">
          <input
            type="password"
            name="password1"
            style="position: fixed; left: -9999px"/>

          <el-input
            type="text"
            v-model="registerForm.username"
            auto-complete="false"
            placeholder="请输入登录名"
            :size = "inputSize"
          ></el-input>
        </el-form-item>
        <el-form-item prop="username">
          <input
            type="password"
            name="password1"
            style="position: fixed; left: -9999px"/>

          <el-input
            type="text"
            v-model="registerForm.realName"
            auto-complete="false"
            placeholder="请输入昵称"
            :size = "inputSize"
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
            v-model="registerForm.password"
            auto-complete="false"
            placeholder="请输入密码"
            :size = "inputSize"
          ></el-input>
        </el-form-item>

        <el-form-item prop="checkPass">
          <input
            type="password"
            name="password"
            style="position: fixed; left: -9999px"/>

          <el-input
            type="password"
            v-model="registerForm.checkPass"
            auto-complete="false"
            placeholder="请输入确认密码"
            :size = "inputSize"></el-input>
        </el-form-item>
        <!-- <el-form-item prop = "realName">
          <el-input
            type="text"
            v-model="registerForm.realName"
            auto-complete="false"
            placeholder="请输入真实姓名"
            :size = "inputSize">
          </el-input>
        </el-form-item> -->
        
        <el-form-item prop="roleId">
          <el-select v-model="registerForm.roleId" style="width: 100%" placeholder="请选择角色" :size = "selectSize">
            <el-option
              v-for="item in roles"
              :disabled="item.isRegister == 0"
              :key="item.id"
              :label="item.roleName"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-button
          type="primary"
          v-on:click="submit"
          :loading="changeLoading"
        >注册</el-button>
        <el-button
          class="returnBtn"
          type="primary"
          v-on:click="returnBtn"
          :loading="changeLoading"
        >返回</el-button>
      </el-form>
    </div>
  </div>
</template>
<script>

import {getAllRoleAPI,registerAPI} from "@/request/sys_api"
export default {
  inject: ["reload"],
  data() {
    var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.registerForm.checkPass !== '') {
            this.$refs.form.validateField('checkPass');
          }
          callback();
        }
    };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.registerForm.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
    };
    return {
      changeLoading: false,
      roles:[],
      registerForm: {
        username: "",
        password: "",
        checkPass:"",
        roleId: "",
        realName:""
        
      },
      registerStyle:{
        height: "100%",
        // backgroundColor: "#409EFF",
        backgroundImage:'url(' + require('../assets/img/bg.jpg') + ')',
        backgroundSize:"cover"
      },
      inputSize:"medium",
      selectSize:"medium",
      rules: {
        username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        realName: [{ required: true, message: "请输入姓名", trigger: "blur" }],
        password: [{ validator: validatePass, trigger: 'blur' }],
        checkPass: [{ validator: validatePass2, trigger: 'blur' }],
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
      getAllRoleAPI().then(
        function(res){
          this.roles = res.data.data.roleList;
        }.bind(this)
      );
    },
    returnBtn(){
      this.$router.push("/login");
    },
    submit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          registerAPI(this.registerForm).then(
            function(res){
              if(res.data.success){
                this.$message.success(res.data.message);
                this.$router.push("/login");
              }else{
                this.$message.error(res.data.message);
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
  top: 20%;
  font-size: 30px;
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

.returnBtn{
  position: relative;
  float: right;
}

</style>