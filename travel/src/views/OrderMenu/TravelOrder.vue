<template>
  <div>
    <Navbar />
     <div style="margin-top: 20px">
      <el-button @click="deleteOrder1()">取消订单</el-button>
    </div>
    <el-table
      ref="multipleTable"
      :data="orderList"
      tooltip-effect="dark"
      style="width: 100%"
      :row-class-name="tableRowClassName"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="订单编号" width="150"></el-table-column>
      
      <el-table-column
        prop="userId"
        label="预订人ID"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="username"
        label="用户名"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="spotName"
        label="景点"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="ticketPrice"
        label="票价"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="ticketTime"
        label="预订时间"
        show-overflow-tooltip
        width="300"
      >
      </el-table-column>
      <el-table-column
        prop="ticketType"
        label="门票类型"
        show-overflow-tooltip
        width="150"
      >
      <template slot-scope = "scope">
              <p v-if="scope.row.ticketType == 0" style="color:green">儿童票</p>
              <p v-if="scope.row.ticketType == 1" style="color:blue">成人票</p>
              <p v-if="scope.row.ticketType == 2" style="color:orange">老年票</p>
          </template>
      </el-table-column>
      <el-table-column
        prop="touristName"
        label="联系人"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="touristLink"
        label="联系方式"
        width="150"
      ></el-table-column>
    </el-table>
   
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue";
export default {
  name: 'TravelOrder',
  data() {
    return {
      multipleSelection: [],
      idlist: [],
      orderList: [],
      userInfo: {},
    };
  },
  components: {
    Navbar,
  },
  mounted() {
    this.userInfo = JSON.parse(localStorage.getItem("userInfo"));
  },
  beforeRouteEnter(to, from, next) {
    if (to.path == '/travelorder') {
      let userInfo = JSON.parse(localStorage.getItem("userInfo"));
      if (userInfo) {
        next((vm)=>{ //参数vm就是当前组件的实例。     
              vm.getUserInfo()
        })
      } else {
        alert("请先登录后查看");
        next(false)
      }
    }else {
      next()
    }
  },
  methods: {
    //先获取用户登录后的信息
    //根据用户id获取订单信息
    async getUserInfo() {
      try {
        var userinfo = await this.$store.dispatch("user/getUserInfo");
        if (!userinfo) {
          alert("请先登录！");
          this.$router.push("/login");
          localStorage.clear();
          return;
        } else {
          try {
            //根据用户id获取相应的订单信息
            let result = await this.$store.dispatch(
              "order/getTicketOrderList",
              userinfo.id
            );
            this.orderList = result;
          } catch (error) {
            alert(error.message);
          }
        }
      } catch (error) {
        alert(error.message);
      }
    },
    toggleSelection(rows) {
      if (rows) {
        rows.forEach((row) => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    tableRowClassName({ row, rowIndex }) {
      if (rowIndex % 2 === 1) {
        return "warning-row";
      }
      return "";
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val);
      this.idlist = [];
      this.multipleSelection.forEach((item) => {
        this.idlist.push(item.id);
      });
    },
    deleteOrder1(){
        if(this.multipleSelection.length >0){
          this.$confirm('此操作将取消所选的预定, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                  }).then(() => {
                    this.deleteOrder();
                  }).catch(() => {
                          
                  });
        }else{
          this.$message.warning("请选择需要取消的预定");
        }
        
      
    },


    async deleteOrder() {
      try {
        await this.$store.dispatch("order/deleteTicketOrder", this.idlist.join(","));
        // this.$message.success(res.data.message);
        alert('取消成功')
        this.getUserInfo();
      } catch (error) {
        alert(error.message);
      }
    },
  },
};
</script>

<style>
.el-table .warning-row {
  background: oldlace;
}
</style>