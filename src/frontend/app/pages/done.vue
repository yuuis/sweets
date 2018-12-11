<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left"></div>
      <div class="center">完了</div>
    </v-ons-toolbar>
    <sweet-modal
      ref="modal"
      width="80%"
      overlay-theme="dark"
      :blocking="true"
      :hide-close-button="true"
      icon="success"
    >
      <div class="main">
        <p>購入が完了しました。</p>
        <el-button type="primary" @click="reload" round>決済を終了する</el-button>
      </div>
    </sweet-modal>
  </v-ons-page>
</template>

<script>
export default {
  data() {
    return {
      loading: undefined
    };
  },
  mounted() {},
  methods: {
    recognization() {
      this.loading = this.$loading({
        text: "Loading",
        lock: false
      });
    },
    reload() {
      location.reload();
    }
  },
  mounted() {
    this.$refs.modal.open();
  }
};
</script>

<style lang="scss">
.loading {
  width: 100%;
  height: 90vh;
}
.el-loading-spinner .circular {
  width: 100px;
  height: 100px;
}
.el-loading-spinner .el-loading-text {
  font-size: 30px;
}
</style>

<style lang="scss" scoped>
.main {
  width: 100%;
  font-size: 30px;
  p {
    margin: 20px auto;
  }
  button {
    font-size: 20px;
  }
}
</style>
