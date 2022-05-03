<template>
  <div class="login">
    <img :src="imgSrc" width="100%" height="100%" alt="" />
    <div class="loginPart">
      <h2>用户登录</h2>
      <el-form>
        <div class="inputElement">
          <el-input v-model="username" placeholder="请输入用户名 "></el-input>
        </div>
        <div class="inputElement">
          <el-input
            v-model="password"
            placeholder="请输入密码"
            :show-password="true"
          ></el-input>
        </div>
        <div>
          <el-button type="primary" @click="handleLogin">登录</el-button>
        </div>
        <div style="text-align: right; color: white">
          <el-link type="warning" @click="changeToRegister"
            >没有账号？去注册</el-link
          >
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      imgSrc: require("./image/background.jpg"),
      username: "",
      password: "",
      roleId: 1,
    };
  },
  methods: {
    async handleLogin() {
      if (this.username.trim() === "") {
        alert("用户名不能为空");
        return;
      }
      if (this.password.trim() === "") {
        alert("密码不能为空");
        return;
      }
      try {
        //用户登录成功后，保存用户信息
        await this.$store.dispatch("user/userLogin", {
          roleId: this.roleId,
          username: this.username,
          password: this.password,
        });
        alert("用户登录成功");
        // console.log(111,this.$router.currentRoute);
        //用户登录成功后，保存用户信息
        try {
          let result = await this.$store.dispatch("user/getUserInfo");
          localStorage.setItem("userInfo", JSON.stringify(result));
          this.$router.go(-1);
          
        } catch (error) {
          alert(error.message);
        }
      } catch (error) {
        alert(error.message);
      }
    },
    changeToRegister() {
      this.$router.push("/register");
    },
  },
};
</script>

<style>
.loginPart {
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
.loginPart h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}
.loginPart .inputbox {
  position: relative;
}
.loginPart .inputElement input {
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

.login {
  width: 100%;
  height: 100%;
  position: fixed;
  background-size: 100% 100%;
}
</style>