<template>
  <div class="home">
    <h1>Home</h1>
    <router-link to="/addBrewery">Add New Brewery</router-link>
    <br />
    <router-link to="/addBeer">Add New Beer</router-link>
    <br />
    <br />
    <AddGoogleMap></AddGoogleMap>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"

export default {
  name: "home",
  components: {
    AddGoogleMap,

  }
};
</script>

<style scoped>

</style>
