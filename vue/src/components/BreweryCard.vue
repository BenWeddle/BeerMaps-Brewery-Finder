<template>
  <div id="card-container">
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
  font-style: italic;
  
  
}

#attributes {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

#description {
  /* display: flex;
  align-items: flex-start;
  justify-content: flex-start;
  flex-wrap: wrap; */
  padding-right: 50px;
  padding-left: 50px;
  
}

#card-container {
  
}


</style>