<template>
  <div id="app">
    <div id="nav">
      <router-link class="home" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>

    <main-header></main-header>
    <div :id="vertical">
      <nav-sidebar v-show="!isLoginPage"></nav-sidebar>
      <router-view />
    </div>
    
  </div>
</template>
<script>
import MainHeader from "@/components/Main-Header.vue"
import NavSidebar from "@/components/Nav-Sidebar.vue"

export default ({
  setup() {},
  components: {
    MainHeader,
    NavSidebar,
  },
  computed: {
    isLoginPage(){
      return this.$route.name === 'login'
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
 
  margin-left: 7%;
  margin-right: 7%;
  /*background-image: url(https://wallpaperboat.com/wp-content/uploads/2020/10/30/58635/beer-04.jpg);*/
  background-color: #EAE2B7;
  /*background-position: center;*/
  /*background-position-y: 0px;*/
}

body {
  /*background-color:rgb(240, 185, 130);*/
  background-color: #EAE2B7;
  border-radius: 70px;
  /*opacity: .9;*/
  /*padding: 25px;*/
}

.home {
  margin-left: 10px;
}

#app{
  background-color: #EAE2B7;
}

#vertical{
  display: grid;
  grid-template-columns: 1fr 6fr;
  gap: 10px;
}

</style>
