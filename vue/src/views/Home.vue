<template>
  <div class="home">
    <h1>Home</h1>
    <router-link to="/addBrewery">Add New Brewery</router-link>
    <br />
    <router-link to="/addBeer">Add New Beer</router-link>
  </div>
</template>

<script>
export default {
  name: "home",
  components: {


  }
};
</script>

<style scoped>
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
</style>
