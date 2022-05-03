<template>
  <div>
    <div class="banner">
      <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        text-color="#fff"
        background-color="#ff9d00"
        active-text-color="#ffd04b"
        @select="handleSelect"
      >
        <el-menu-item index="/home">首页</el-menu-item>
        <el-menu-item index="/travel">旅游</el-menu-item>
        <el-menu-item index="/hotel">酒店</el-menu-item>
        <el-submenu index="/ordermenu">
          <template slot="title">订单管理</template>
          <el-menu-item index="/hotelorder">酒店订单</el-menu-item>
          <el-menu-item index="/travelorder">门票订单</el-menu-item>
        </el-submenu>
      </el-menu>
      <span>
        <span v-if="userInfo">
          <a href="javascript:;" @click="handleLogout">退出</a>
          <strong>|</strong>
          <a href="javascript:;" @click="changePass">修改密码</a>
          <div @click="changeAva" style="float: left; width: 50px">
            <el-avatar
              :src="
                userInfo.imgUrl == '' || userInfo.imgUrl == null
                  ? defaultUrl
                  : userInfo.imgUrl
              "
            ></el-avatar>
          </div>
        </span>
        <span v-else>
          <router-link to="/login">登录</router-link>
          <strong>|</strong>
          <router-link to="/register">注册</router-link>
        </span>
      </span>
    </div>
    <!-- 上传头像对话框-->
    <el-dialog
      title="修改头像"
      width="200px"
      :visible.sync="dialogAva"
      :close-on-click-modal="false"
      @close="close"
    >
      <el-upload
        class="avatar-uploader"
        :action="uploadURL"
        :show-file-list="false"
        :on-success="uploadSuccess"
        name="picture"
        ref="upload"
      >
        <img v-if="form.imgUrl" :src="form.imgUrl" class="avatar" />
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
      <div>
        <el-button type="warning" @click="saveAva">确定</el-button>
        <el-button @click="dialogAva = false">取消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { editAvatarAPI } from "@/api/index";
export default {
  name: "Navbar",
  data() {
    return {
      activeIndex: "/home",
      userInfo: {},
      dialogAva: false,
      uploadDisabled: false,
      disabled: false,
      imgDialog: false,
      uploadURL: "http://localhost:8800/trip/file/upload",
      defaultUrl: require("@/assets/defaultAvatar.png"),
      form: {
        password: "",
        checkPass: "",
        oldPass: "",
        id: null,
        imgUrl: "",
      },
      imageUrl: "",
    };
  },
  mounted() {
    this.userInfo = JSON.parse(localStorage.getItem("userInfo"));
  },
  methods: {
    handleSelect(key) {
      this.activeIndex = key;
      this.$router.push(key);
      console.log(key);
    },
    handleLogout() {
      localStorage.clear();
      this.userInfo = "";
      this.$router.go(0);
      this.$router.push("/");
    },
    //修改密码
    changePass() {
      this.$router.push("/change");
    },
    changeAva() {
      this.dialogAva = true;
    },
    handleAvatarSuccess(res, file) {
      this.form.imgUrl = URL.createObjectURL(file.raw);
      console.log(this.form.imgUrl);
    },
    saveAva() {
      editAvatarAPI(this.form).then(
        function (res) {
          if (res.data.success) {
            this.$message.success(res.data.message);
            this.dialogAva = false;
          }
        }.bind(this)
      );
    },
    uploadSuccess(response, file, fileList) {
      console.log(response);
      this.form.imgUrl = response.data.fileItem.url;
      this.form.id = this.userInfo.id;
      console.log(this.form.imgUrl);
    },

    close() {
      this.$refs.upload.clearFiles();
      this.uploadDisabled = false;
    },
  },
};
</script>

<style lang="less">
.banner {
  width: 100%;
  height: 61px;
  background-color: #ff9d00;
  .el-menu-demo {
    height: 61px;
    position: absolute;
    left: 18%;
    background-color: #ff9d00;
    .el-menu-item {
      width: 150px;
      text-align: center;
      font-size: 18px;
    }
  }
  span {
    float: right;
    line-height: 61px;
    padding-right: 20px;
    font-size: 16px;
    strong {
      color: silver;
    }
    .el-avatar {
      margin-top: 10px;
    }
    a {
      padding: 0 10px;
      text-decoration: none;
      color: #fff;
    }
    .hide ::v-deep .el-upload--picture-card {
      display: none;
    }
  }
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.el-dialog__body {
  padding: 10px;
}
.el-button + .el-button {
  float: right;
}

.el-menu--horizontal>.el-submenu .el-submenu__title {
  font-size: 18px;
}
</style>