<template>
  <div id="login" class="login-div">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="login-header">Welcome To BeerMaps</h1>
      <h2 class="login-quote">Find your next destination today!</h2>
      <h2 class="login-header-2">Please Sign In</h2>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control-login"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control-login"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link class="need-an-account" :to="{ name: 'register' }">Need an account?</router-link>
      <button id="sign-in-button" type="submit">Sign in</button>
    </form>
    <image id="background-image" src="https://heltonbrewing.com/wp-content/uploads/2015/07/Brewery.jpg"></image>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
        image: 'https://mymichiganbeach.com/wp-content/uploads/2022/03/michigan-brew.jpg'
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>




