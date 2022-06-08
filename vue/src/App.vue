<template>
  <div id="app">
    <div id="nav">
      <!-- <router-link class="home" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    </div>

    <main-header></main-header>
    <div :id="vertical">
      <nav-sidebar v-show="!isLoginPage"></nav-sidebar>
      <router-view />
    </div>
  </div>
</template>
<script>

import NavSidebar from "@/components/Nav-Sidebar.vue";
export default ({
  components: {
    
    NavSidebar,
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
html {

  
  background-image: linear-gradient(to top right, rgb(218, 230, 57), rgb(255, 60, 0));
}

body {
  border-radius: 70px;
}



#app{
  background-image: linear-gradient(to top left,  rgb(218, 230, 57), rgb(255, 60, 0));
}

#vertical{
  display: grid;
  gap: 10px;
}

</style>
