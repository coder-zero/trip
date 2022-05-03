<template>
  <div>

    <template v-for="item in this.menuList">
      <el-submenu   :index="item.id+''" v-if="item.children.length>0" :key="item.id+''">
        <template slot="title" style="padding-left:30px">
          <i v-if = "item.icon != null && item.icon.trim() != '' " :class="item.icon"></i>
          <i v-if = "item.icon == null || item.icon.trim() == '' " class="el-icon-eleme"></i>
          <span slot="title">{{ item.menuName}}</span>
        </template>
        <MenuTree :menuList="item.children"></MenuTree>
      </el-submenu>
      <el-menu-item
        v-else
        :index="item.menuPath+''"
        :route="item.menuPath"
        @click="savePath(item.menuPath)"
        :key="item.id+''">
        <i v-if = "item.icon != null && item.icon.trim() != '' " :class="item.icon"></i>
        <i v-if = "item.icon == null || item.icon.trim() == '' " class="el-icon-eleme"></i>
        <span slot="title">{{item.menuName}}</span>
      </el-menu-item>
    </template>

  </div>
</template>
<script>
export default {
    name: "MenuTree",
    methods:{
      savePath(path) {
        window.sessionStorage.setItem("activePath", path);
        // this.activePath = path;
      }
    },
    props: ["menuList"]
}
</script>
<style scoped>
  /*隐藏文字*/
  .el-menu--collapse  .el-submenu__title span{
    display: none;
  }
  /*隐藏 > */
  .el-menu--collapse  .el-submenu__title .el-submenu__icon-arrow{
    display: none;
  }
  .el-menu {
    height: 100%;
  }
  .el-menu:not(.el-menu--collapse) {
      width: 200px;
  }
  /*控制一级菜单的文字隐藏*/
  .el-menu--collapse .el-menu-item span {
    display: none;
  }

  /* 控制一级菜单文字隐藏
  .el-menu--collapse .el-menu-item {
    color: transparent !important;
    i{
        color: #fff !important;
    }
  } */
</style>
