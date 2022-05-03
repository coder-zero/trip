<template>
  <div class="container">
    <div class="scenceimg">
      <img :src="item.imgUrl" alt="" />
    </div>
    <div class="scenceinfo">
      <div class="info-left">
        <el-link :underline="false" type="primary" style="te" @click = "display(item.id)"><div>{{ item.spotName }}</div></el-link>
        <!-- <div @click = "display(scope.row.id)">{{ item.spotName }}</div> -->
        <div>{{ item.spotDescribe }}</div>
        
      </div>
      <div class="info-right">
        <div>￥{{ item.spotPrice }}</div>
        <div>
          <i class="el-icon-location-information"></i>{{ item.spotAddress }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ScenceItem",
  props: ["item"],

  methods:{
     display(id){
        window.open("/spotDetail?id="+id,'_blank');
      },
  }
};
</script>

<style lang="less" scoped>
.container {
  margin: 10px 0;
  width: 100%;
  height: 220px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: wrap;
  .scenceimg {
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
  .scenceinfo {
    width: calc(100% - 300px);
    float: right;
    height: 500px;
    display: flow-root;
    position: relative;
    .info-left {
      margin-top: 30px;
      margin-left: 30px;
      font-size: 15px;
      width: 60%;
      overflow: hidden;
      & div:first-child {
        font: 20px bolder;
        margin-bottom: 10px;
      }
    }
    .info-right {
      float: right;
      position: absolute;
      right: 10px;
      top: 30px;
      margin-right: 20px;
      & div:first-child {
        font: 20px bolder;
        color: #ff8a52;
        margin-bottom: 100px;
      }
    }
  }
}
</style>