<template>
  <div class="container">
    <div class="hotelimg">
      <img :src="item.imgUrl" alt="" />
    </div>
    <div class="hotelinfo">
      <div class="info-left">
        <el-link :underline="false" type="primary" style="te" @click = "display(item.id)"><div>{{ item.hotelName }}</div></el-link>
        <div>{{ item.hotelDescribe }}</div>
      </div>
      <div class="info-right">
        <div>
          <i class="el-icon-location-information"></i>{{ item.hotelAddress }}
        </div>
        <div><i class="el-icon-phone-outline"></i>{{ item.hotelPhone }}</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HotelItem",
  props: ["item"],
  methods:{
     display(id){
        window.open("/hotelDetail?id="+id,'_blank');
      },
  }
};
</script>

<style lang="less" scoped>
.container {
  margin: 20px 0;
  width: 100%;
  height: 220px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: wrap;
  position: relative;
  .hotelimg {
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
  .hotelinfo {
    width: calc(100% - 300px);
    float: right;
    // height: 100%;
    display: flow-root;
    .info-left {
      margin: 15px;
      margin-left: 30px;
      font-size: 15px;
      width: 70%;
      overflow: hidden;
      & div:first-child {
        font: 25px bolder;
        margin-bottom: 15px;
      }
    }
    .info-right {
      float: right;
      position: absolute;
      right: 0;
      bottom: 0;
      margin-right: 20px;
      margin-bottom: 10px;
      & div:first-child {
        font: 15px bolder;
        margin-bottom: 20px;
      }
    }
  }
}
</style>