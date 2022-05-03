<template>
  <div>
    <Navbar/>
    <Banner :list="bannerList" />
    <el-tabs type="border-card"  class="topbar">
      <el-tab-pane label="景点">
        <weather />
        <Scence />
      </el-tab-pane>
      <el-tab-pane label="酒店">
        <Hotel />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue"
import Banner from "../../components/Banner/Banner.vue";
import Hotel from "../HotelInfo/HotelInfo.vue";
import Scence from "../Scence/Scence.vue";
import Weather from "../../components/Weather/Weather.vue";
import { mapState } from "vuex";
export default {
  name: "Home",
  components: {
    Banner,
    Hotel,
    Scence,
    Weather,
    Navbar
  },
  mounted() {
    this.$store.dispatch("home/getBannerList");
  },
  computed: {
    ...mapState("home", ["bannerList"]),
  },
};
</script>

<style lang="less" scoped>
.topbar {
  width: 66%;
  margin: 0 auto;
}
</style>