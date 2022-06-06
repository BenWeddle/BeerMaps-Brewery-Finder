<template>
<div id="filter-container">
  <b-container id="filter-input" fluid>
    <b-row>
      <b-col sm="2">
        <label>Brewery Name:</label>
      </b-col>
      <b-col sm="4">
        <b-form-input :state="resultState" v-model="filter.name"></b-form-input>
      </b-col>
    </b-row>
    <b-row id="checkbox-row">
      <b-col>
        <b-form-checkbox v-model="filter.hasFood">Has Food</b-form-checkbox>
      </b-col>
      <b-col>
        <b-form-checkbox v-model="filter.hasOnSiteBrewing">On Site Brewing</b-form-checkbox>
      </b-col>
      <b-col>
        <b-form-checkbox v-model="filter.hasOutDoorSeating">Out Door Seating</b-form-checkbox>
      </b-col>
      <b-col>
        <b-form-checkbox v-model="filter.petFriendly">Pet Friendly</b-form-checkbox>
      </b-col>
    </b-row>
  </b-container>

  <b-table :items="filteredList" :fields="fields" striped responsive="sm">
    <template #cell(show_details)="row">
      <b-button size="sm" @click="row.toggleDetails" class="mr-2">
        {{ row.detailsShowing ? 'Hide' : 'Show'}} Details
      </b-button>
    </template>

    <template #row-details="row">
      <b-card>
        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Address: </b></b-col>
          <b-col>Get Address By ID</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Phone Number: </b></b-col>
          <b-col>{{row.item.phoneNumber}}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Hours of Operation:</b></b-col>
          <b-col>We do not yet have this information or access to it</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Some sort of brewery Imagery?</b></b-col>
          <b-col>There will be some lovely photos here - maybe - possibly.</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Latitude: </b></b-col>
          <b-col>{{row.item.latitude}}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Longitude: </b></b-col>
          <b-col>{{row.item.longitude}}</b-col>
        </b-row>
        <div class="detail-option-buttons">
          <b-button size="sm" @click="row.toggleDetails">Hide Details</b-button>

          <b-button size ="sm" variant ="outline-success" id="view-menu" @click="showBreweryMenu(row.item.breweryId)">View Offerings</b-button>

          <b-button size ="sm" variant ="outline-warning" id="view-ratings" @click="showBreweryRatings(row.item.breweryId)">Ratings</b-button>
        </div>

      </b-card>
    </template>
  </b-table>

  <b-modal id="menu-popup"
           v-model="showMenu"
           title="Current Offerings"
           hide-footer centered
           size="xl"
  >
  <beverage-list-by-brewery-id></beverage-list-by-brewery-id>
    <div class="finish-button-container">
      <b-button class="mt-3" variant="outline-danger"  @click="showMenu = false">Finish</b-button>
    </div>
  </b-modal>

  <b-modal id="ratings-popup"
           v-model="showRatings"
           title="Ratings"
           hide-footer centered
           size="xl"
  >
  <view-brewery-ratings></view-brewery-ratings>
    <div class="finish-button-container">
      <b-button class="mt-3" variant="outline-danger"  @click="showRatings = false">Finish</b-button>
    </div>
  </b-modal>
</div>
</template>

<script>
import BreweryService from "../services/BreweryService";
import BeverageListByBreweryId from "./BeverageListByBreweryId";
import ViewBreweryRatings from "./ViewBreweryRatings";
export default {
  name: "UserBrewerySearch",
  components: {
    BeverageListByBreweryId,
    ViewBreweryRatings
  },
  data() {
    return {
      breweries: [],
      fields: ['breweryName', 'hasOnSiteBrewing', 'hasOutDoorSeating', 'hasFood', 'petFriendly', 'description', 'show_details'],
      filter: {
        name: '',
        hasFood: '',
        petFriendly: '',
        hasOutDoorSeating: '',
        hasOnSiteBrewing: ''
      },
      showMenu: false,
      showRatings: false
    };
  },
  computed: {
    filteredList(){
      let filteredBreweries = this.breweries;
      if (this.filter.name != ""){
        filteredBreweries = filteredBreweries.filter((brewery) =>
            brewery.breweryName
            .toLowerCase()
            .includes(this.filter.name.toLowerCase())
        );
      }
      if (this.filter.hasFood === true){
        filteredBreweries = filteredBreweries.filter((brewery) =>
            brewery.hasFood === true
        );
      }
      if (this.filter.petFriendly === true){
        filteredBreweries = filteredBreweries.filter((brewery) =>
            brewery.petFriendly === true
        );
      }
      if (this.filter.hasOutDoorSeating === true){
        filteredBreweries = filteredBreweries.filter((brewery) =>
            brewery.hasOutDoorSeating === true
        );
      }
      if (this.filter.hasOnSiteBrewing === true){
        filteredBreweries = filteredBreweries.filter((brewery) =>
            brewery.hasOnSiteBrewing === true
        );
      }

        return filteredBreweries;
    },
    resultState(){
      if(this.filter.name === ''){
        return null;
      } else return this.filteredList.length > 0;
    }
  },
  methods: {
    loadAllBreweries() {
      BreweryService.getBreweries().then(response => {
        this.breweries = response.data;
      })
    },
    showBreweryMenu(breweryId){
      this.$store.commit('SET_SELECTED_MENU', breweryId);
      this.showMenu = true;
    },
    showBreweryRatings(breweryId){
      this.$store.commit('SET_SELECTED_BREWERY_RATINGS', breweryId);
      this.showRatings = true;
    }
  },
  created() {
    this.loadAllBreweries();
  }

}
</script>

<style scoped>

#filter-input{
  border: 1px solid black;
  padding: 10px;
  border-radius: 25px;
  margin-top: 20px;

}
#checkbox-row{
  margin-top: 10px;
}

.finish-button-container{
  display: flex;
  justify-content: end;
}
.detail-option-buttons{
  display: flex;
  justify-content: space-evenly;

div {
  background-color:#8ca4b8;
  border-radius: 25px;
  font-family: tangerine;
  font-style: italic;
  font-weight: bold;
}
</style>