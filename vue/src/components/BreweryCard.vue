<template>
  <div id="card-container" class="card">
    <h1 class="text-center">{{ brewery.breweryName }}</h1>
    <div id="description">
      <p>{{ brewery.description }}</p>
    </div>
    <div id="attributes">
      <p>Outdoor Seating {{ brewery.hasOutDoorSeating }}</p>
      <p>Food Menu {{ brewery.hasFood }}</p>
      <p>On-Site Brewing {{ brewery.hasOnSiteBrewing }}</p>
      <p>Pet Friendly {{ brewery.petFriendly }}</p>
    </div>
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
.text-center {
  font-family: tangerine;
  font-style: italic;
}

#attributes {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-family: tangerine;
  font-style: italic;
}

#description {
  padding-right: 50px;
  padding-left: 50px;
  font-family: tangerine;
  font-style: italic;
  font-size: larger;
}



</style>