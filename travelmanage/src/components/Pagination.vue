<template>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pageData.currentPage"
      :page-sizes="pageData.pageSizes"
      :page-size="pageData.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="pageData.total">
    </el-pagination>
</template>
<script>
  export default {
    name:'Pagination',
    props:['pageData','getPageData'],
    methods: {
      handleSizeChange(val) {
        this.pageData.pageSize = val
        this.pageData.currentPage = 1
        this.getPageData();
      },
      handleCurrentChange(val) {
        this.pageData.currentPage = val
        this.getPageData();
      }
    }
  }
</script>
<style scoped>
  .el-pagination{
    position:absolute; bottom:50px;
    /* z-index:999;
    background-color: rgb(255, 255, 255); */
  }
</style>