<template>
  <div class="home">
    <welcome-message></welcome-message>
    <AddGoogleMap></AddGoogleMap>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"
import WelcomeMessage from "../components/Welcome-Message.vue"
import BreweryService from "../services/BreweryService";

export default {
  name: "home",
  components: {
    AddGoogleMap,
    WelcomeMessage,
  },
  computed: {
    getBrewerID() {
      return this.$store.state.user.id
    }
  },
  created() {
    BreweryService.getBreweryByBrewerId(this.getBrewerID).then(response => {
      this.$store.commit('SET_BREWERY_ID_FROM_BREWER', response.data.breweryId)
    })
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
