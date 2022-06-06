<template>
  <div id="card-container">
    <div class="card" v-for="brewery in breweries" v-bind:key="brewery.id">
      <h1 class="text-center">{{ brewery.breweryName }}</h1>
      <div id="description">
      <p>{{ brewery.description }}</p>
      </div>
      <div id="attributes">
      <p>Does it have outdoor seating? {{ brewery.hasOutDoorSeating }}</p>
      <p>Does it have a kitchen? {{ brewery.hasFood }}</p>
      <p>Do they brew the beer on site? {{ brewery.hasOnSiteBrewing }}</p>
      <p>Do they allow my lizard? {{ brewery.petFriendly }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'brewery-card-list',
  props: ['breweries'],
  data() {
    return {
    };
  },
  computed: {
    getBrewerID() {
      return this.$store.state.user.id
    }
  },
  created() {
  },
};
</script>


<style scoped>

.card {
  background-color: #8ca4b8;
  border-radius: 25px;
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

#attributes {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-family: tangerine;
  font-style: italic;
}

</style>