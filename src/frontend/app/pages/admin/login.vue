<template>
  <v-ons-page>
    <v-ons-toolbar>
      <div class="center">管理者ログイン</div>
    </v-ons-toolbar>

    <v-ons-card>
      <el-form ref="form" :model="form" label-width="120px">
        <el-form-item label="Email" prop="name">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="Password" prop="pass">
          <el-input type="password" v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login(form)">Login</el-button>
        </el-form-item>
      </el-form>
    </v-ons-card>
  </v-ons-page>
</template>

<script>
import { mapActions } from "vuex";
import Cookie from "js-cookie";

export default {
  middleware: "notAuthenticated",
  data() {
    return {
      form: {
        email: "",
        password: ""
      },
      roles: {
        name: [
          {
            required: true,
            message: "Please inpu Activity name",
            trigger: "blue"
          },
          {
            min: 3,
            max: 10,
            message: "Length should be 3 to 10",
            trigger: "blue"
          }
        ],
        pass: [
          { required: true, message: "invalid password.", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    postLogin() {
      setTimeout(() => {
        const auth = {
          accessToken: ""
        };
        this.$store.commit("update", auth); // クライアントレンダリング用
        Cookie.set("auth", auth);
        this.$router.path("/admin");
      }, 1000);
    },
    ...mapActions(["login"])
  },
  layout: "base"
};
</script>
