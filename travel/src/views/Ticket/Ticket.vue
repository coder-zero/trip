<template>
  <div>
    <Navbar />
    <div class="ticket">
      <div class="tickettop" v-for="item in ticketinfo" :key="item.id">
        <div class="imginfo">
          <img :src="imgUrl" alt="" />
        </div>
        <div class="otherinfo">
          <span>请选择预订时间：</span>
          <el-date-picker v-model="item.date" type="date" placeholder="选择日期">
          </el-date-picker>
          <span>请输入联系方式：</span>
          <el-input
            placeholder="请输入电话"
            prefix-icon="el-icon-phone-outline"
            v-model="item.phone"
            maxlength="11"
          >
          </el-input>
          <el-input
            placeholder="请输入姓名"
            prefix-icon="el-icon-user"
            v-model.number="item.name"
            maxlength="5"
          >
          </el-input>
          <div class="price">
            <span style="color:red;padding-right: 20px">价格：￥ {{ item.ticketPrice }}</span>
            <span
            >
            <el-tag v-if="item.ticketType === 0" type="warning">儿童票</el-tag>
            <el-tag v-if="item.ticketType === 1" type="warning">成年票</el-tag>
            <el-tag v-if="item.ticketType === 2" type="warning">老年票</el-tag>
          </span>
          </div>
          
        </div>
        <div class="title"></div>
        <div class="ticketdetail">
          <div class="describeinfo">
            <div style="color: orange; font-size: 20px; margin-bottom: 10px">
              使用须知
            </div>
            {{ item.ticketCondition }}
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
import Navbar from "@/views/Navbar/Navbar.vue";
export default {
  name: "",
  data() {
    return {
      ticketinfo: [],
      userInfo: {},
      imgUrl: ""
    };
  },
  components: {
    Navbar,
  },
  mounted() {
    localStorage.removeItem('ticketinfo')
    let id = this.$route.query.id
    this.imgUrl = this.$route.query.imgUrl
    this.$store.dispatch('order/getTicketInfo', id).then(res=>{
      console.log(res);
      localStorage.setItem('ticketinfo', JSON.stringify(res))
      this.ticketinfo = JSON.parse(localStorage.getItem('ticketinfo'))
    })

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
      if (!item.date) {
        alert("日期不能为空，请先选择预订时间");
        return;
      }
      if(!this.test) {
        alert('电话号码格式错误，请重新输入')
        return
      }
      if (confirm("是否确认预订门票？")) {
        try {
          await this.$store.dispatch("order/postTicketOrder", {
            ticketId: item.id,
            userId: this.userInfo.id,
            ticketTime: this.format(item.date.getTime()),
            touristLink: item.phone,
            touristName: item.name,
            spotId: item.spotId,
            isFull: 0,
          });
          // try {
          //   let result = await this.$store.dispatch(
          //     "order/getTicketInfo",
          //     item.SpotId
          //   );
          //   localStorage.removeItem("ticketinfo");
          //   localStorage.setItem("ticketinfo", JSON.stringify(result));
          //   this.ticketinfo = JSON.parse(localStorage.getItem("ticketinfo"));
            alert("预订成功 ");
          // } catch (error) {
          //   alert(error.message);
          // }
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
.ticket {
  margin: 20px auto;
  width: 90%;
  .tickettop {
    display: flex;
    margin-top: 20px;
    .imginfo {
      margin-left: 180px;
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
    }
    .title {
      margin-left: 30px;
      font-size: 20px;
      background-color: orange;
      line-height: 100%;
      width: 2px;
    }
    .ticketdetail {
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