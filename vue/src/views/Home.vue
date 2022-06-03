<template>
  <div class="home">
    <welcome-message></welcome-message>
    <AddGoogleMap v-bind:breweries="listOfBreweries"></AddGoogleMap>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"
import WelcomeMessage from "../components/Welcome-Message.vue"
import BreweryService from "../services/BreweryService"

export default {
  name: "home",
  components: {
    AddGoogleMap,
    WelcomeMessage,
  },
  data(){
    return {
      listOfBreweries: [],
    }
  },
  created() {
    BreweryService.getBreweries().then(response => {
      const indivBrewery = response.data
      this.listOfBreweries = indivBrewery
      }
    )}
};
</script>

<style scoped>

#content {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

</style>
