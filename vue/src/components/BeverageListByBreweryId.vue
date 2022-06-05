<template>
<div id="beverage-menu">

  <b-table :items="beverages" :fields="fields" striped responsive="sm">
  </b-table>

</div>
</template>

<script>
import BeverageService from "../services/BeverageService";
export default {
  name: "BeverageListByBreweryId",
  data(){
    return {
      fields: ['beverageName', 'beverageType', 'abv', 'ibu', 'description'],
      beverages: []
    };
  },
  created(){
    this.loadAllBeverages();
  },
  methods: {
    loadAllBeverages() {
      BeverageService.getBeveragesByBreweryId(this.$store.state.selectedBreweryMenu).then(response => {
        this.beverages = response.data;
      })
    }
  }
}
</script>

<style scoped>

</style>