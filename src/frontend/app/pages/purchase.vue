<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="left">
        <v-ons-back-button>戻る</v-ons-back-button>
      </div>
      <div class="center">認証</div>
    </v-ons-toolbar>
    <div class="main">
      <v-ons-card class="tutorial">
        <div class="animation">
          <div class="handbox">
            <img class="hand" src="~/assets/images/felica_hand.svg" alt>
          </div>
          <img class="reader" src="~/assets/images/felica.png" alt>
        </div>
        <div class="warning">
          <p>リーダーに、Felicaをかざしてください</p>
        </div>
      </v-ons-card>
    </div>
    <p style="text-align: center">
      <v-ons-button @click="recognization">Purchase</v-ons-button>
    </p>
  </v-ons-page>
</template>

<script>
import DonePage from "~/pages/done";
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
      setTimeout(() => {
        this.loading.close();
        this.pushSuccess();
      }, 3000);
    },
    pushSuccess() {
      this.$emit("push-page", DonePage);
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
