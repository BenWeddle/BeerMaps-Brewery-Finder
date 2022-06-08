<template>
  <div id="login" class="login-div">

    <div class="video-wrapper">
      <video autoplay muted loop id="backgroundVideo">
        <source src="vue/src/assets/Pouring.mp4" type="video/mp4">
      </video>
    </div>


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
      <b-button variant="primary" id="sign-in-button" type="submit">Sign in</b-button>
    </form>
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
        password: ""
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
            this.$store.commit("GET_AUTHORITIES", response.data.user);
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

<style scoped>

.form-control-login {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-left: 5px;
  padding-right: 0px;
  margin-left: 190px;
}

#login {
  display: flex;
  align-items: center;
  justify-content: center;
  
}

.login-header {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 60px;
  margin-top: 0%;
  padding-bottom: 0px;
  color: rgb(0, 0, 0);
  font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  
}

.login-quote {
  display: flex;
  align-items: center;
  justify-content: center;
  
}

.login-header-2 {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-top: 20px;
}

label.sr-only {
  display: flex;
  align-items: center;
  justify-content: center;
}

.need-an-account {
  display: flex;
  align-items: center;
  justify-content: center;
}

#sign-in-button {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 250px;
}

#sign-in-button{
  margin-top: 10px;
}

div {
  font-family: tangerine;
  font-style: italic;
}

</style>




