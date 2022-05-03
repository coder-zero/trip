<template>
  <div>
    <Navbar />
     <div style="margin-top: 20px">
      <!-- <el-button @click="toggleSelection()">取消选择</el-button> -->
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
        prop="username"
        label="用户名"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="hotelName"
        label="酒店名"
        width="150"
      ></el-table-column>
      <el-table-column
        prop="roomType"
        label="房间类型"
        width="150"
      >
        <template slot-scope = "scope">
              <p v-if="scope.row.roomType == 1">单人房</p>
              <p v-if="scope.row.roomType == 2">双人房</p>
          </template>
      </el-table-column>
      <el-table-column
        prop="startTime"
        label="入住时间"
        show-overflow-tooltip
        width="300"
      >
      </el-table-column>
      <el-table-column
        prop="endTime"
        label="离店时间"
        show-overflow-tooltip
        width="300"
      ></el-table-column>
      <el-table-column
        prop="roomPrice"
        label="价格"
        show-overflow-tooltip
        width="150"
      ></el-table-column>
      <el-table-column
        prop="roomPrice"
        label="当前状态"
        show-overflow-tooltip
        width="150"
      >
      <template slot-scope = "scope">
              <p v-if="scope.row.isAccept == 0" style="color:red">等待处理</p>
              <p v-if="scope.row.isAccept == 1" style="color:green">已经接受</p>
          </template>
      </el-table-column>
    </el-table>
   
  </div>
</template>

<script>
import Navbar from "@/views/Navbar/Navbar.vue";
export default {
  name: 'HotelOrder',
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
    if (to.path == '/hotelorder') {
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
              "order/getHotelOrderList",
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
        let res = await this.$store.dispatch("order/deleteHotelOrder", this.idlist.join(","));
        this.$message.success(res.data.message);
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