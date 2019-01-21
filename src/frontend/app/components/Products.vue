<template>
  <el-card :body-style="{ padding: '0px' }">
    <div
      class="product-card"
      @click="add(product.id)"
      :class="{selected: isSelected}"
      :align="styles"
    >
      <img :src="product.image_path" class="image">
      <div style="padding: 14px;">
        <span>{{ product.name }}</span>
        <div class="bottom clearfix">
          <time class="price">&yen; {{ product.price }}</time>
        </div>
      </div>
    </div>
  </el-card>
</template>

<script>
export default {
  data() {
    return {
      quentity: 0
    };
  },
  props: ["product"],
  methods: {
    add(id) {
      this.quentity++;
      this.addCart({ id: id, quentity: this.quentity });
    },
    addCart(product) {
      this.$emit("addCart", product);
    },
    resetCart() {
      this.quentity = 0;
    }
  },
  computed: {
    styles() {
      return this.quentity > 0 ? this.quentity : "";
    },
    isSelected() {
      return this.quentity > 0;
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

<style lang="scss" scoped>
.selected {
  position: relative;
  &::after {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    box-shadow: 0 0 0 3px #81b8e3 inset;
  }
  &::before {
    content: attr(align);
    position: absolute;
    top: 0;
    right: 0;
    color: white;
    padding: 10px 20px;
    font-size: 25px;
    border-radius: 0 0 0 50%;
    background-color: #4b9ad8;
  }
}
.product-card {
  .price {
    font-size: 13px;
    color: #999;
  }
  .image {
    width: 100%;
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
