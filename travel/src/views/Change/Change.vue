<template>
  <div>
    <Navbar />
    <div class="change">
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="昵称" prop="realName" :inline-message="true">
          <el-input
            type="text"
            v-model="ruleForm.realName"
            autocomplete="off"
            :disabled="true"
          ></el-input>
        </el-form-item>

        <el-form-item label="用户名" prop="username">
          <el-input
            type="text"
            v-model="ruleForm.username"
            autocomplete="off"
            :disabled="true"
          ></el-input>
        </el-form-item>

        <el-form-item label="原密码" prop="oldPass">
          <el-input
            type="password"
            v-model="ruleForm.oldPass"
            autocomplete="off"
          ></el-input>
        </el-form-item>

        <el-form-item label="修改密码" prop="pass">
          <el-input
            type="password"
            v-model="ruleForm.pass"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass">
          <el-input
            type="password"
            v-model="ruleForm.checkPass"
            autocomplete="off"
          ></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="warning" @click="submitForm('ruleForm')"
            >提交</el-button
          >
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue";
export default {
  name: "Change",
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入修改密码"));
      } else {
        if (this.ruleForm.checkPass !== "") {
          this.$refs.ruleForm.validateField("checkPass");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.pass) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        pass: "",
        checkPass: "",
        username: "",
        realName: "",
        oldPass: "",
      },
      rules: {
        pass: [{ validator: validatePass, trigger: "blur" }],
        checkPass: [{ validator: validatePass2, trigger: "blur" }],
      },
    };
  },
  components: {
    Navbar
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          try {
            await this.$store.dispatch("user/changePass", {
              password: this.ruleForm.pass,
              checkPass: this.ruleForm.checkPass,
              oldPass: this.ruleForm.oldPass,
              id: this.ruleForm.id,
            });
            alert("密码修改成功，请重新登录!");
            // localStorage.clear()
            // this.$router.push('/login')
          } catch (error) {
            alert(error.message);
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm() {
      this.ruleForm.oldPass = "";
      this.ruleForm.pass = "";
      this.ruleForm.checkPass = "";
    },
  },
  mounted() {
    this.ruleForm = JSON.parse(localStorage.getItem("userInfo"));
  },
};
</script>

<style>
.change {
  position: absolute;
  left: 20%;
}
.demo-ruleForm {
  width: 200%;
  margin-top: 60px;
}
</style>