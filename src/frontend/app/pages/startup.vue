<template>
  <v-ons-page>
    <div class="startbody">
      <div class="top-image">
        <img src="~/assets/images/icon.svg" width="20%" alt>
        <p class="top-text">田胡研Sweets
          <br>電子決済システム
        </p>
      </div>

      <div style="text-align: center">
        <el-button round type="primary" @click="start">Start</el-button>
      </div>
    </div>
  </v-ons-page>
</template>

<script>
import index from "~/pages/index";
export default {
  methods: {
    start() {
      this.$emit("push-page", index);
    }
  }
};
</script>

<style lang="scss" scoped>
.startbody {
  width: 100vw;
  height: 100vh;
  background-color: white;
  .top-image {
    padding-top: 20vh;
    padding-bottom: 50px;
    .top-text {
      margin-top: 20px;
      font-size: 25px;
      font-weight: 500;
      color: #4b9ad8;
    }
  }
}
</style>

<style lang="scss">
.startbody {
  .el-button.is-round {
    border-radius: 100px;
    padding: 15px 40px;
    color: white;
    span {
      font-size: 40px;
    }
  }
}
</style>

