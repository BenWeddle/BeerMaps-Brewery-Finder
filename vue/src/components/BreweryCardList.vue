<template>
  <div id="card-container">
    <div class="card" v-for="brewery in breweries" v-bind:key="brewery.id">
      <h1 class="text-center">{{ brewery.breweryName }}</h1>
      <p>Description: {{ brewery.description }}</p>
      <p>Does it have outdoor seating? {{ brewery.hasOutDoorSeating }}</p>
      <p>Does it have a kitchen? {{ brewery.hasFood }}</p>
      <p>Do they brew the beer on site? {{ brewery.hasOnSiteBrewing }}</p>
      <p>Do they allow my lizard? {{ brewery.petFriendly }}</p>
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

.card{
  
  background-color: orange;
}

</style>