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
          ><div>{{ item.hotelName }}</div></el-link
        >

        <div>{{ item.hotelDescribe }}</div>
      </div>
      <div class="info-right">
        <!-- <div class="price">￥{{ item.price }}</div> -->
        <div class="info">
          <div class="address">
            <i class="el-icon-location-information"></i>{{ item.hotelAddress }}
          </div>
          <div class="phone">
            <i class="el-icon-phone-outline"></i>{{ item.hotelPhone }}
          </div>
        </div>
        <el-button type="warning" @click="handleClick(item.roomList)">
          预订
        </el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "OrderItem",
  props: ["item"],
  data() {
    return {
      date: "",
      visible: false,
    };
  },
  methods: {
    handleClick(obj) {
      this.$router.push({
        name: "room",
        params: {
          ...obj,
        },
      });
      // console.log(obj);
      localStorage.removeItem("roominfo");
      localStorage.setItem("roominfo", JSON.stringify(obj));
    },
    display(id) {
      window.open("/hotelDetail?id=" + id, "_blank");
    },
    
  },
};
</script>


<style lang="less" scoped>
.container {
  margin: 10px 0;
  width: 100%;
  height: 220px;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  .orderimg {
    width: 280px;
    height: 200px;
    img {
      width: 100%;
      height: 100%;
      border-radius: 30px;
      object-fit: cover;
    }
  }
  .orderinfo {
    width: calc(100% - 300px);
    width: 70%;
    padding: 35px;
    padding-left: 60px;
    position: relative;
    .info-left {
      div:first-child {
        font: bolder;
        font-size: 22px;
        margin-bottom: 10px;
      }
    }
    .info-right {
      .price {
        color: orange;
        font-size: 20px;
        position: absolute;
        top: 40px;
        right: 50px;
      }
      .info {
        position: relative;
        top: 50px;
        font-size: 14px;
      }
      .el-button {
        position: absolute;
        right: 30px;
        font-size: 16px;
        margin-top: 20px;
      }
    }
  }
}
</style>