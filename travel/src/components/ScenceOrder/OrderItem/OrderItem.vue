<template>
  <div class="container">
    <div class="orderimg">
      <img :src="item.imgUrl" alt="" />
    </div>
    <div class="orderinfo">
      <div class="info-left">
        <el-link
          :underline="false"
          type="primary"
          style="te"
          @click="display(item.id)"
          ><div>{{ item.spotName }}</div></el-link
        >
        <div>{{ item.spotDescribe }}</div>
      </div>
      <el-button type="warning" @click="handleClick(item)">
      预订
    </el-button>
    </div>
    
  </div>
</template>

<script>
export default {
  name: "OrderItem",
  props: ["item"],
  methods: {
    display(id) {
      window.open("/spotDetail?id=" + id, "_blank");
    },
    handleClick(obj) {
      this.$router.push({
        name: 'ticket',
        query: {
          id: obj.id,
          imgUrl: obj.imgUrl
        }
      })
    },
  },
};
</script>


<style lang="less" scoped>
.container {
  width: 100%;
  margin: 10px 0;
  display: flex;
  height: 220px;
  flex-direction: row;
  justify-content: flex-start;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  .orderimg {
    float: left;
    width: 280px;
    height: 200px;
    img {
      width: 100%;
      height: 100%;
      padding: 10px;
      border-radius: 30px;
      object-fit: cover;
    }
  }
  .orderinfo {
    width: calc(100% - 300px);
    width: 70%;
    padding: 20px;
    position: relative;
    float: right;
    height: 100%;;
    display: flow-root;
    position: relative;
    margin-left: 30px;
    .info-left {
      font-size: 15px;
      width: 75%;
      overflow: hidden;
      div:first-child {
        font: bolder;
        font-size: 22px;
        margin-bottom: 10px;
      }
      div:last-child {
        margin: 10px 0;
        width: 80%;
      }
    }
    .el-button {
      position: absolute;
      right: 5%;
      bottom: 20%;
    }
  }
}
</style>