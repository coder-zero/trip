<template>
  <div>
    <Navbar/>
    <!-- 搜索框 -->
    <div class="travelPart">
      <el-input v-model="input" placeholder="搜索目的地"></el-input>
      <el-button
        type="warning"
        icon="el-icon-search"
        @click="search"
      ></el-button>
    </div>
    <div class="recommend">
      <span v-if="showRecommend">景点推荐</span>
      <span v-else>热门景点</span>
      <hr style="background-color: #e5e5e5; height: 2px; border: none" />
      <!-- 判断是否有关键字搜索，没有显示推荐 -->
      <Recommend
        v-if="showRecommend"
        :list="scenceList"
      />
      <ScenceOrder v-else :list="scenceList"/>
    </div>
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue"
import Recommend from "@/components/Recommend/Recommend.vue";
import ScenceOrder from "@/components/ScenceOrder/ScenceOrder.vue";
import { mapState } from "vuex";
export default {
  name: "Travel",
  components: {
    Recommend,
    ScenceOrder,
    Navbar
  },
  mounted() {
    this.$router.push('/travel')
    this.$store.dispatch("home/getScenceList");
  },
  computed: {
    ...mapState("home", ["scenceList"]),
  },
  data() {
    return {
      input: "",
      //是否显示推荐景点
      showRecommend: true
    };
  },
  methods: {
    async search() {
      try {
        await this.$store.dispatch("home/getScenceList", {spotAddress: this.input});
        this.$router.push({
          path: `/travel/${this.input}`,
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
.travelPart {
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