<template>
  <v-ons-card>
    <img :src="product.image_path" alt="Onsen UI" style="width: 100%">
    <div class="title">{{ product.name }}</div>
    <div class="title">¥ {{ product.price }}</div>
    <div class="content">
      <el-input-number
        v-model="quentiry"
        @click="addCart({id:product.id, quentiry:quentiry})"
        :min="0"
        :max="10"
      ></el-input-number>
    </div>
  </v-ons-card>
</template>

<script>
export default {
  data() {
    return {
      quentiry: 0
    };
  },
  props: ["product"],
  methods: {
    addCart(product) {
      this.$emit("addCart", product);
    }
  }
};
</script>

<style lang="scss">
.el-input-number {
  width: 100%;
  .el-input-number__decrease,
  .el-input-number__increase {
    width: 80px;
  }
}
</style>
