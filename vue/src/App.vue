<template>
  <div id="app">
    <div id="nav">
      <!-- <router-link class="home" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    </div>

    <main-header></main-header>
    <div :id="vertical">
      <nav-top-bar v-show="!isLoginPage"></nav-top-bar>
      <router-view />
    </div>
  </div>
</template>
<script>

import NavTopBar from "@/components/Nav-Top-Bar.vue"

export default ({
  components: {
    NavTopBar
  },
  computed: {
    isLoginPage(){
      return this.$route.name === 'login' || this.$route.name === 'register'
    },
    vertical(){
      if (this.isLoginPage === true){
        return ""
      }
      else {
        return "vertical"
      }
      }
    }
})
</script>


<style>

/*html {*/
/* */
/*  margin-left: 5%;*/
/*  margin-right: 5%;*/
/*  background-image: linear-gradient(to top right, rgb(218, 230, 57), rgb(255, 60, 0));*/
/*}*/

body {
  border-radius: 70px;
}

.home {
  margin-left: 10px;
}

/*#app{*/
/*  background-image: linear-gradient(to top left,  rgb(218, 230, 57), rgb(255, 60, 0));*/
/*}*/

#vertical{
  display: grid;
  gap: 10px;
}

</style>
