<template>
  <div class="home">
    <welcome-message></welcome-message>
    <AddGoogleMap v-bind:breweries="listOfBreweries"></AddGoogleMap>
    <UserBrewerySearch></UserBrewerySearch>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"
import WelcomeMessage from "../components/Welcome-Message.vue"
import BreweryService from "../services/BreweryService";
import UserBrewerySearch from "../components/UserBrewerySearch";

export default {
  name: "home",
  components: {
    AddGoogleMap,
    WelcomeMessage,
    UserBrewerySearch
  },
  data(){
    return {
      listOfBreweries: [],
    }
  },
  created() {
    BreweryService.getBreweries().then(response => {
      // this.listOfBreweries = response.data
      this.$store.commit("LIST_OF_BREWERIES", response.data)
      })
      .catch(error => {
        alert(error + "There was an error getting breweries")
      }),

      BreweryService.getBreweryByBrewerId(this.getBrewerID).then(response => {
        this.$store.commit('SET_BREWERY_ID_FROM_BREWER', response.data.breweryId)
      })
  },
  computed: {
    getBrewerID() {
      return this.$store.state.user.id
    }
  }
  
};
</script>

<style scoped>

#content {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

</style>
