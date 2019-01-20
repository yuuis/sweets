<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="center">商品一覧</div>
    </v-ons-toolbar>
    <v-ons-search-input placeholder="Search something" v-model="search_str"></v-ons-search-input>
    <el-row>
      <el-col :span="5" v-for="product in search" :key="product.id" :offset="0">
        <products ref="prod" :product="product" @addCart="addCart"/>
      </el-col>
    </el-row>
    <transition name="el-zoom-in-bottom">
      <total-account
        :isShowTotal="isShowTotal"
        :items="items"
        :totalQuentity="totalQuentity"
        :totalPrice="totalPrice"
        @pushSuccess="pushSuccess"
        @showTotal="showTotal"
        @removeCart="removeCart"
      />
    </transition>
    <div class="tabber" :class="{visible: isShowSubtotal}">
      <div class="contents tabber-contents">
        <el-row class="middle-center">
          <el-col :span="16">
            <el-row class="quentity">
              <el-col :span="12">お買い上げ点数</el-col>
              <el-col :span="12">{{ totalQuentity }}点</el-col>
            </el-row>
            <el-row class="price">
              <el-col :span="12">小計</el-col>
              <el-col :span="12">¥{{ totalPrice }}</el-col>
            </el-row>
          </el-col>
          <el-col :span="4">
            <el-button class="tab-button" type="primary" @click="showTotal(true)" round>Purchase</el-button>
          </el-col>
          <el-col :span="4">
            <el-button class="tab-button" type="info" @click="resetCart()" round>Reset</el-button>
          </el-col>
        </el-row>
      </div>
    </div>
    <div v-show="isShowSubtotal" style="height:80px;"></div>
  </v-ons-page>
</template>

<script>
import Products from "~/components/Products.vue";
import TotalAccount from "~/components/TotalAccount.vue";
import DonePage from "~/pages/main/done";

export default {
  data() {
    return {
      products: [
        {
          id: 1,
          name: "カップ麺",
          image_path: require("~/assets/images/Product001.png"),
          price: 130
        },
        {
          id: 2,
          name: "ペットボトル飲料",
          image_path: require("~/assets/images/Product002.png"),
          price: 100
        },
        {
          id: 3,
          name: "缶ジュース",
          image_path: require("~/assets/images/Product003.png"),
          price: 50
        },
        {
          id: 4,
          name: "アイス",
          image_path: require("~/assets/images/Product004.png"),
          price: 100
        },
        {
          id: 5,
          name: "焼きおにぎり",
          image_path: require("~/assets/images/Product005.png"),
          price: 30
        },
        {
          id: 6,
          name: "チャーハン1/2",
          image_path: require("~/assets/images/Product006.png"),
          price: 80
        },

        {
          id: 7,
          name: "ゼリー",
          image_path: require("~/assets/images/Product007.png"),
          price: 30
        },
        {
          id: 8,
          name: "今川焼き",
          image_path: require("~/assets/images/Product008.png"),
          price: 60
        },
        {
          id: 9,
          name: "ポッキー・プリッツ小袋",
          image_path: require("~/assets/images/Product009.png"),
          price: 30
        },
        {
          id: 10,
          name: "スナック・チョコレート",
          image_path: require("~/assets/images/Product010.png"),
          price: 100
        },
        {
          id: 11,
          name: "柿の種・おかき",
          image_path: require("~/assets/images/Product011.png"),
          price: 50
        },
        {
          id: 12,
          name: "ラムネ菓子",
          image_path: require("~/assets/images/Product012.png"),
          price: 70
        }
      ],
      cart: [],
      search_str: "",
      isShowTotal: false
    };
  },
  components: {
    Products,
    TotalAccount
  },
  methods: {
    // 商品をカートに追加する
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
    },
    showTotal(bool) {
      if (bool == undefined) {
        bool = this.isShowSubtotal;
      } else {
        this.isShowTotal = bool;
      }
    },
    removeCart(id) {
      this.$refs.prod.some((item, index) => {
        if (item.product.id == id) {
          this.$refs.prod[index].quentity = 0;
          return true;
        }
      });
      this.cart.some((item, index) => {
        if (item.id == id) {
          this.cart.splice(index, 1);
          this.showTotal();
          return true;
        }
      });
    },
    resetCart(id) {
      this.cart = [];
      this.$refs.prod.forEach((_, index) => {
        this.$refs.prod[index].resetCart();
      });
    },
    pushSuccess() {
      this.showTotal(false);
      this.$emit("push-page", DonePage);
    }
  },
  async fetch({ store }) {},
  computed: {
    search: function() {
      // 商品のリアルタイム検索
      var products = [];
      if (!this.search_str) return this.products.concat();
      this.products.forEach(product => {
        if (product.name.indexOf(this.search_str) != -1) products.push(product);
      });
      return products;
    },
    isShowSubtotal() {
      return this.cart.length > 0;
    },
    items() {
      var items = [];
      this.products.forEach(product => {
        this.cart.some(_item => {
          if (_item.id == product.id) {
            items.push({
              quentity: _item.quentity,
              ...product
            });
          }
        });
      });
      return items;
    },
    totalQuentity() {
      let quentity = 0;
      this.items.forEach(item => {
        quentity += item.quentity;
      });
      return quentity;
    },
    totalPrice() {
      let price = 0;
      this.items.forEach(item => {
        price += item.price * item.quentity;
      });
      return price.toLocaleString();
    }
  }
};
</script>

<style lang="scss" scoped>
.contents {
  width: 80%;
  &.tabber-contents {
    margin: 0 auto;
    .el-row {
      margin-top: 8px;
      .quentity {
        color: #777;
      }
      .tab-button {
        margin-top: 12px;
        width: 95%;
      }
    }
  }
}
.el-col-offset-0 {
  margin: 2%;
}
ons-search-input {
  min-width: 95%;
}
.tabber {
  font-family: -apple-system, "Helvetica Neue", "Helvetica", "Arial",
    "Lucida Grande", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-weight: 400;
  display: none;
  bottom: 0;
  left: 0;
  right: 0;
  white-space: nowrap;
  position: fixed;
  margin: 0;
  padding: 0;
  background-color: #fafafa;
  border-top: 1px solid #ccc;
  width: 100%;
  height: 80px;
  &.visible {
    display: flex;
  }
}
</style>

<style lang="scss">
.page__background {
  background: url(~assets/images/background.png);
}
</style>
