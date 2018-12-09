<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="center">商品一覧</div>
    </v-ons-toolbar>
    <v-ons-search-input placeholder="Search something" v-model="search_str"></v-ons-search-input>
    <el-row :gutter="20">
      <el-col :span="6" v-for="product in search" :key="product.id">
        <products :product="product"/>
      </el-col>
    </el-row>
    <p style="text-align: center">
      <v-ons-button @click="$ons.notification.alert('Hello World!')">Click me!</v-ons-button>
    </p>
  </v-ons-page>
</template>

<script>
import AppLogo from "~/components/AppLogo.vue";
import Products from "~/components/Products.vue";

export default {
  asyncData() {
    return {
      products: [
        {
          id: 1,
          name: "いしグロ",
          image_path: require("~/assets/images/R0001619.jpg"),
          price: "1"
        },
        {
          id: 2,
          name: "いしグロ2",
          image_path: require("~/assets/images/R0001619.jpg"),
          price: "10"
        }
      ],
      cart: [],
      search_str: ""
    };
  },
  components: {
    AppLogo,
    Products
  },
  methods: {
    addCart(product) {
      let isExist = false;
      this.cart.some(item => {
        if (item.id == product.id) {
          isExist = !isExist;
          item.quentity = product.quentity;
          return true;
        }
      });
      if (!isExist) this.cart.push(product);
    }
  },
  async fetch({ store }) {},
  created() {
    this._products = this.products.concat();
  },
  computed: {
    search: function() {
      var products = [];
      if (!this.search_str) return this.products.concat();
      this.products.forEach(product => {
        if (product.name.indexOf(this.search_str) != -1) products.push(product);
      });
      return products;
    }
  }
};
</script>

<style lang="scss" scoped>
ons-search-input {
  min-width: 95%;
}
</style>
