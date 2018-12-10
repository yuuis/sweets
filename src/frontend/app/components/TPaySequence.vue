<template>
  <div class="tutorial">
    <div class="animation">
      <div class="handbox">
        <img class="hand" src="~/assets/images/felica_hand.svg" alt>
      </div>
      <img class="reader" src="~/assets/images/felica.png" alt>
    </div>
    <div class="warning">
      <p>リーダーに、Felicaをかざしてください</p>
    </div>
    <p style="text-align: center">
      <v-ons-button @click="reSelect">back</v-ons-button>
    </p>
  </div>
</template>

<script>
export default {
  methods: {
    reSelect() {
      this.$emit("reSelect");
    }
  }
};
</script>


<style lang="scss" scoped>
.tutorial {
  width: 100%;
  display: inline-block;
}

.animation {
  text-align: center;
  .handbox {
    .hand {
      max-width: 55vh;
      margin-left: 25vh;
      animation-name: felicaHandAnimation;
      animation-duration: 1.5s;
      animation-direction: alternate;
      animation-iteration-count: infinite;
    }
  }
  .reader {
    max-width: 50vh;
    margin-right: 25vh;
    margin-top: -200px;
  }
}
.warning {
  text-align: center;
  margin: 50px;
  font-size: 30px;
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