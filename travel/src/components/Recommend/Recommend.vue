<template>
  <el-row>
    <el-col
      :span="6"
      v-for="(item, index) in list"
      :key="index"
    >
      <el-card :body-style="{ padding: '0px' }" shadow="hover">
        <img
          :src="item.imgUrl"
          class="image"
        />
        <div style="padding: 14px" class="title">
          <el-link v-if="item.hotelName" :underline="false" type="primary" style="te" @click = "displayhotel(item.id)"><div>{{ item.hotelName }}</div></el-link>
          <el-link v-else :underline="false" type="primary" style="te" @click = "displayspot(item.id)"><div>{{ item.spotName }}</div></el-link>
         
          <div class="bottom clearfix">
            <time v-if="item.hotelAddress" class="time">{{ item.hotelAddress }}</time>
            <time v-else class="time">{{ item.spotAddress }}</time>
          </div>
        </div>
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: "Recommend",
  props: ["list"],
  methods:{
     displayhotel(id){
        window.open("/hotelDetail?id="+id,'_blank');
      },
      displayspot(id){
        window.open("/spotDetail?id="+id,'_blank');
      },
  }
};
</script>

<style>
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
  height: 200px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
.el-card {
    width: 300px;
    margin-bottom: 10px;
    margin-top: 5px;
}
</style>