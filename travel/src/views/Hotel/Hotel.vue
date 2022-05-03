<template>
  <div>
    <Navbar/>
    <!-- 搜索框 -->
    <div class="hotelPart">
      <el-input v-model="input" placeholder="出行目的地"></el-input>
      <el-button type="warning" icon="el-icon-search" @click="search"></el-button>
    </div>
    <div class="recommend">
      <span v-if="showRecommend">酒店推荐</span>
      <span v-else>热门酒店</span>
      <hr style='background-color:#e5e5e5; height:2px; border:none;'/>
      <Recommend v-if="showRecommend" :list="hotelList"/>
      <HotelOrder v-else :list="hotelList"/>
    </div>
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue"
import Recommend from "@/components/Recommend/Recommend.vue";
import HotelOrder from '@/components/HotelOrder/HotelOrder.vue'
import { mapState } from "vuex";
export default {
  name: "Hotel",
  components: {
    Recommend,
    HotelOrder,
    Navbar
  },
  data() {
    return {
      input: "",
      //是否显示推荐酒店
      showRecommend: true
    };
  },
  mounted() {
    this.$router.push('/hotel');
    this.$store.dispatch("home/getHotelList");
  },
  computed: {
    ...mapState("home", ["hotelList"]),
  },
  
   methods: {
    async search() {
      try {
        await this.$store.dispatch("home/getHotelList", {hotelAddress: this.input});
        this.$router.push({
          path: `/hotel/${this.input}`,
        });
        //判断是否搜索了目的地，若搜索了显示结果，没有显示推荐
        if(this.$route.params !== 'undefined')
          this.showRecommend = false
      } catch (error) {
        //搜索出错，默认显示推荐
        this.showRecommend = true
        alert(error.message);
      }
    },
  },
};
</script>

<style lang="less" scoped>
.hotelPart {
  position: absolute;
  left: 50%;
  top: 20%;
  margin: 0 auto;
  transform: translate(-50%, -50%);
  width: 50%;
  padding: 50px;
  background: rgba(78, 77, 71, 0.199);
  box-sizing: border-box;
  border-radius: 15px;
  .el-input {
    width: 85%;
    margin-right: 15px;
  }
}
.recommend {
  top: 33%;
  position: absolute;
  width: 80%;
  margin: 0 auto;
  left: 50%;
  transform: translateX(-50%);
  span {
    font-size: 25px;
    color: #fff;
    background: orange;
    line-height: 60px;
    display: inline-block;
    margin-bottom: 5px;
  }
}
</style>