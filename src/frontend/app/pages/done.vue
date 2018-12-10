<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left"></div>
      <div class="center">完了</div>
    </v-ons-toolbar>
    <div class="main"></div>
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
    }
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
  .tutorial {
    width: 80%;
    margin-top: 10vh;
    display: inline-block;
  }

  .animation {
    text-align: center;
    .handbox {
      .hand {
        width: 40%;
        margin-left: 20%;
        animation-name: felicaHandAnimation;
        animation-duration: 1s;
        animation-direction: alternate;
        animation-iteration-count: infinite;
      }
    }
    .reader {
      width: 30%;
      margin-right: 10%;
      margin-top: -250px;
    }
  }
  .warning {
    text-align: center;
    margin: 50px;
    font-size: 30px;
  }
}
@keyframes felicaHandAnimation {
  0% {
    transform: rotate(0deg);
  }
  10% {
    transform: rotate(0deg);
  }
  90% {
    transform: rotate(-40deg);
  }
  100% {
    transform: rotate(-40deg);
  }
}
</style>
