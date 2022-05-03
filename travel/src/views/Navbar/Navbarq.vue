<template>
  <div>
    <div class="banner">
      <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        text-color="#fff"
        active-text-color="#ffd04b"
        @select="handleSelect"
      >
        <el-menu-item index="/home">首页</el-menu-item>
        <el-menu-item index="/travel">旅游</el-menu-item>
        <el-menu-item index="/hotel">订酒店</el-menu-item>
        <el-menu-item index="/ordermenu">订单管理</el-menu-item>
      </el-menu>
      <span>
        <span v-if="userInfo">
          <!-- <router-link to="/login">退出</router-link> -->
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
        :action="uploadURL"
        class="{hide:uploadDisabled}"
        :on-change="changeEvent"
        :on-success="uploadSuccess"
        :auto-upload="false"
        list-type="picture-card"
        ref="upload"
        :limit="1"
        name="picture"
      >
        <i slot="default" class="el-icon-plus"></i>
        <div slot="file" slot-scope="{ file }">
          <img class="el-upload-list__item-thumbnail" :src="file.url" alt="" />
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
      <el-dialog :visible.sync="imgDialog" :modal="false">
        <img width="100%" :src="dialogImageUrl" alt="" />
      </el-dialog>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogAva = false">取 消</el-button>
        <el-button type="primary" @click="saveAva">确 定</el-button>
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
      dialogVisible: false,
      dialogAva: false,
      uploadDisabled: false,
      disabled: false,
      imgDialog: false,
      dialogImageUrl: "",
      uploadURL: "http://localhost:8800/trip/file/upload",
      defaultUrl: require("@/assets/defaultAvatar.png"),
      form: {
        password: "",
        checkPass: "",
        oldPass: "",
        id: null,
        imgUrl: "",
      },
    };
  },
  mounted() {
    this.userInfo = JSON.parse(localStorage.getItem("userInfo"));
  },
  methods: {
    handleSelect(key) {
      this.activeIndex = key;
      this.$router.push(key);
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
    saveAva() {
      this.$refs.upload.submit();
      //
    },
    uploadSuccess(response, file, fileList) {
      this.form.imgUrl = response.data.fileItem.url;
      this.form.id = this.userInfo.id;
      console.log(this.form.imgUrl);

      editAvatarAPI(this.form).then(
        function (res) {
          if (res.data.success) {
            this.$message.success(res.data.message);
            this.dialogAva = false;
          }
        }.bind(this)
      );
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.imgDialog = true;
    },
    close() {
      this.$refs.upload.clearFiles();
      this.uploadDisabled = false;
    },
    changeEvent(file, fileList) {
      this.uploadDisabled = fileList.length >= 1;
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
</style>