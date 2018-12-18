<template>
  <div class="tutorial">
    <qriously :value="testURL" :size="200"/>
    <div class="warning">
      <p>QRコードを読み取り
        <br>ブラウザを起動してください。
      </p>
      <el-button @click="reSelect" type="text">別の支払方法を選択する</el-button>
      <el-button @click="recognization" type="text">決済テスト</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      testURL: "http://www.google.com",
      isPause: false
    };
  },
  methods: {
    reSelect() {
      this.$emit("reSelect");
    },
    recognization() {
      this.isPause = true;
      this.loading = this.$loading({
        text: "Loading",
        lock: false
      });
      setTimeout(() => {
        this.loading.close();
        this.$emit("pushSuccess");
      }, 3000);
    }
  }
};
</script>


<style lang="scss" scoped>
.tutorial {
  width: 100%;
  display: inline-block;
  text-align: center;
}

.warning {
  text-align: center;
  margin: 2vh 50px;
  font-size: 30px;
}
</style>

<style lang="scss">
.el-loading-mask.is-fullscreen {
  z-index: 30000 !important;
}
</style>

