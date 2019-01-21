<template>
  <el-card :body-style="{ padding: '0px' }">
    <div class="product-card">
      <img :src="menu.img" class="image">
      <div style="padding: 14px;">
        <span>{{ menu.title }}</span>
      </div>
    </div>
  </el-card>
</template>

<script>
export default {
  props: ["menu"]
};
</script>

<style lang="scss" scoped>
.product-card {
  .image {
    width: 100%;
    min-height: 200px;
    display: block;
  }
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both;
  }
}

.button {
  padding: 0;
  float: right;
}
</style>
