<template>
  <div id="app">
    <div id="nav">
      <router-link class="home" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
html {
 
  margin-left: 500px;
  margin-right: 500px;
  background-image: url(https://wallpaperboat.com/wp-content/uploads/2020/10/30/58635/beer-04.jpg);
  background-position: center;
  background-position-y: 0px;
}

body {
  background-color:rgb(238, 144, 56);
  border-radius: 70px;
  opacity: .9;
  
}

.home {
  margin-left: 50px;
 
}


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
  margin-left: 255px;

}


.register-header{
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 50px;
  margin-top: 0%;
  color: rgb(0, 0, 0);
  font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  
}

#register {
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-control-register {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-left: 5px;
  padding-right: 0px;
  margin-left: 70px;
}

.create-account-button {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 105px;
}

.have-account-link {
  
  margin-left: 100px;
}

</style>
