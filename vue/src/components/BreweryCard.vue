<template>
  <div>
    <h1>{{ brewery.breweryName }}</h1>
    <p>{{ brewery.description }}</p>
    <p>{{ brewery.hasOutdoorSeating }}</p>
    <p>{{ brewery.hasFood }}</p>
    <p>{{ brewery.hasOnSiteBrewing }}</p>
    <p>{{ brewery.isPetFriendly }}</p>
  </div>
</template>

<script>
import BreweryService from "../services/BeverageService";
export default {
  name: "brewery-card",
  components: {},

  data() {
    return {
      brewery: {
        breweryName: "",
        description: "",
        hasOutdoorSeating: "",
        hasFood: "",
        hasOnSiteBrewing: "",
        isPetFriendly: "",
      },
    };
  },
  created() {
    BreweryService.getBreweryById(this.$store.state.testBreweryId).then(
      (response) => {
        this.brewery.breweryName = response.data.breweryName;
      }
    );
  },
};
</script>

<style>
</style>