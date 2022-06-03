<template>
  <div id="card-container">
    <h1 class="text-center">{{ brewery.breweryName }}</h1>
    <p>Description: {{ brewery.description }}</p>
    <p>Does it have outdoor seating? {{ brewery.hasOutDoorSeating }}</p>
    <p>Does it have a kitchen? {{ brewery.hasFood }}</p>
    <p>Do they brew the beer on site? {{ brewery.hasOnSiteBrewing }}</p>
    <p>Do they allow my lizard? {{ brewery.petFriendly }}</p>
    
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService";
export default {
  name: 'brewery-card',
  data() {
    return {
      brewery: {
        breweryName: '',
        description: '',
        hasOutDoorSeating: '',
        hasFood: '',
        hasOnSiteBrewing: '',
        petFriendly: '',
      }
    };
  },
  computed: {
    getBrewerID() {
        return this.$store.state.user.id
    }
  },
  created() {
    BreweryService.getBreweryById(this.getBrewerID).then(response => {
        this.brewery = response.data;
      }
    );
  },
};
</script>


<style scoped>


</style>