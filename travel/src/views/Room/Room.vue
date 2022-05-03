<template>
  <div>
    <Navbar />
    <div class="room">
      <div class="roomtop" v-for="item in roominfo" :key="item.id">
        <div class="imginfo">
          <img :src="item.imgUrl" alt="" />
        </div>
        <div class="otherinfo">
          <span>请选择入住时间：</span>
          <el-date-picker
            v-model="date"
            type="daterange"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
          >
          </el-date-picker>

          <div class="price">
            <span>价格：￥ {{ item.roomPrice }}</span>
          </div>
          <span
            >房间类型：
            <el-tag v-if="item.roomType === 1" type="warning">单人间</el-tag>
            <el-tag v-if="item.roomType === 2" type="warning">双人间</el-tag>
          </span>
          <div>
            <span style="margin-right: 40px"
              >房间总数：{{ item.roomCount }}</span
            >
            <span>房间余量：{{ item.currentNum }}</span>
          </div>
        </div>
        <div class="title"></div>
        <div class="roomdetail">
          <div class="describeinfo">
            <div style="color: orange; font-size: 20px; margin-bottom: 10px">
              房间详情：
            </div>
            {{ item.roomDescribe }}
          </div>
          <el-button
            type="warning"
            @click="handleOrder(item)"
            :disabled="item.currentNum < 1"
            >立即预订</el-button
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue"
export default {
  name: "Room",
  data() {
    return {
      roominfo: [],
      date: "",
      userInfo: {},
    };
  },
  components: {
    Navbar
  },
  mounted() {
    this.roominfo = JSON.parse(localStorage.getItem("roominfo"));
    this.userInfo = JSON.parse(localStorage.getItem("userInfo"));
    if (!this.userInfo) {
      alert("请先登录后预订");
      this.$router.push("/login");
      localStorage.clear();
    }
  },
  methods: {
    //定义处理时间戳两个的函数
    add0(m) {
      return m < 10 ? "0" + m : m;
    },
    format(shijianchuo) {
      var time = new Date(shijianchuo);
      var y = time.getFullYear();
      var m = time.getMonth() + 1;
      var d = time.getDate();
      var h = time.getHours();
      var mm = time.getMinutes();
      var s = time.getSeconds();
      return (
        y +
        "-" +
        this.add0(m) +
        "-" +
        this.add0(d) +
        " " +
        this.add0(h) +
        ":" +
        this.add0(mm) +
        ":" +
        this.add0(s)
      );
    },
    async handleOrder(item) {
      if (!this.date) {
        alert("日期不能为空，请先选择入住时间");
        return;
      }
      if (confirm("是否确认预订房间？")) {
        try {
          await this.$store.dispatch("order/postRoomOrder", {
            roomId: item.id,
            userId: this.userInfo.id,
            startTime: this.format(this.date[0].getTime()),
            endTime: this.format(this.date[1].getTime()),
            hotelId: item.hotelId,
            isAccept: 0,
          });
          try {
            let result = await this.$store.dispatch(
              "order/getRoomInfo",
              item.hotelId
            );
            localStorage.removeItem("roominfo");
            localStorage.setItem("roominfo", JSON.stringify(result));
            this.roominfo = JSON.parse(localStorage.getItem("roominfo"));
            alert("预订成功 ");
          } catch (error) {
            alert(error.message);
          }
        } catch (error) {
          alert(error.message);
        }
      } else {
        return;
      }
    },
  },
};
</script>

<style lang="less" scoped>
.room {
  margin: 20px auto;
  width: 90%;
  .roomtop {
    display: flex;
    margin-top: 20px;
    .imginfo {
      margin-left: 100px;
      margin-right: 50px;
      width: 450px;
      height: 300px;
      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
    .otherinfo {
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;
      .price {
        color: red;
      }
    }
    .title {
      margin-left: 30px;
      font-size: 20px;
      background-color: orange;
      line-height: 100%;
      width: 2px;
    }
    .roomdetail {
      margin-left: 30px;
      width: 250px;
      position: relative;
      .describeinfo {
        font-size: 18px;
        overflow: hidden;
      }
      .el-button {
        width: 100%;
        position: absolute;
        bottom: 0;
        left: 0;
      }
    }
  }
}
</style>