<template>
  <div class="register">
    <img :src="imgSrc" width="100%" height="100%" alt="" />
    <div class="registerPart">
      <h2>用户注册</h2>
      <el-form>
        <div class="inputElement">
          <el-input v-model="username" placeholder="请输入用户名 "></el-input>
        </div>
        <div class="inputElement">
          <el-input v-model="realname" placeholder="请输入昵称 "></el-input>
        </div>
        <div class="inputElement">
          <el-input
            v-model="password"
            placeholder="请输入密码 "
            :show-password="true"
          ></el-input>
        </div>
        <div class="inputElement">
          <el-input
            v-model="confirmpass"
            placeholder="确认输入密码"
            :show-password="true"
          ></el-input>
        </div>
        <div>
          <el-button type="primary" @click="handleRegister">注册</el-button>
        </div>
        <div style="text-align: right; color: white">
          <el-link type="warning" @click="changeToLogin"
            >已有账号？去登录</el-link
          >
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    return {
      imgSrc: require("./image/background.jpg"),
      username: "",
      password: "",
      confirmpass: "",
      roleId: 1,
      realname: "",
    };
  },
  methods: {
    async handleRegister() {
      if (this.username.trim() === "") {
        alert("用户名不能为空");
        return;
      }
      if (this.realname.trim() === "") {
        alert("昵称不能为空");
        return;
      }
      if (this.password.trim() === "") {
        alert("密码不能为空");
        return;
      }
      if (this.confirmpass.trim() === "") {
        alert("确认密码不能为空");
        return;
      } else if (this.password !== this.confirmpass) {
        alert("两次输入密码不一致");
        return;
      }
      try {
        await this.$store.dispatch("user/userRegister", {
          roleId: this.roleId,
          username: this.username,
          password: this.password,
          realName: this.realName
        });
        alert("注册成功，请先登录")
        this.$router.push("/home");
      } catch (error) {
        alert(error.message);
      }
    },
    changeToLogin() {
      this.$router.push("/login");
    },
  },
};
</script>

<style>
.registerPart {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 450px;
  padding: 50px;
  background: rgba(0, 0, 0, 0.5);
  box-sizing: border-box;
  box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
  border-radius: 15px;
}
.registerPart h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}
.registerPart .inputbox {
  position: relative;
}
.registerPart .inputElement input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  letter-spacing: 1px;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}

.register {
  width: 100%;
  height: 100%;
  position: fixed;
  background-size: 100% 100%;
}
</style>