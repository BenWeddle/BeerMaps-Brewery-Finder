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
body {
  width: 100%;
  height: 100%;
}
</style>
