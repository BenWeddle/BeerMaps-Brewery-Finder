<template>
  <div class="home">
  
    <!-- <div id="spacer"> -->
      
    <!-- </div> -->
    <welcome-message id="message"></welcome-message>
    <AddGoogleMap id="map"></AddGoogleMap>
    <img src="../../public/re.png" id="top-filler-photo"/>
    <UserBrewerySearch id="brewery-search"></UserBrewerySearch>
    <img src="../../public/brewww.png" id="bottom-filler-photo"/>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"
import WelcomeMessage from "../components/Welcome-Message.vue"
import BreweryService from "../services/BreweryService";
import UserBrewerySearch from "../components/UserBrewerySearch";
import AddressService from "../services/AddressService";
import UserService from "../services/UserService";

export default {
  name: "home",
  components: {
    AddGoogleMap,
    WelcomeMessage,
    UserBrewerySearch,
  },
  data(){
    return {
      listOfBreweries: [],
    }
  },
  methods: {
    getAllBreweriesAddToStore(){
      BreweryService.getBreweries().then(response => {
        this.$store.commit("LIST_OF_BREWERIES", response.data)
      }).catch(error => {
        alert(error + "There was an error getting breweries")
      })
    },
    setStoreBreweryId(){
      BreweryService.getBreweryByBrewerId(this.getBrewerID).then(response => {
        this.$store.commit('SET_BREWERY_ID_FROM_BREWER', response.data.breweryId)
      })
    },
    setStoreAddressList(){
      AddressService.getAllAddresses().then(response => {
        this.$store.commit('SET_ADDRESS_LIST', response.data);
      })
    },
    setUsernameList(){
      UserService.getAllUsernames().then(response => {
        this.$store.commit('SET_USERNAME_LIST', response.data)
      })
    }
  },
  created() {
    this.getAllBreweriesAddToStore();
    this.setStoreBreweryId();
    this.setStoreAddressList();
    this.setUsernameList();
  },
  computed: {
    getBrewerID() {
      return this.$store.state.user.id
    }
  }
  
};
</script>

<style scoped>

#message {
  grid-area: message;
  display: flex;
    border: solid black 1px;
    border-top-right-radius: 25px;
    border-top-left-radius: 25px;
    padding: 5px;
    background-image: linear-gradient(to bottom right, rgb(247, 223, 195), rgb(255, 145, 0));
    align-items: center;
    justify-content: center;
    font-family: tangerine;
    font-style: italic;
}

#map {
  grid-area: map;
  /* background-image: linear-gradient(to top right, rgb(247, 223, 195), rgb(255, 145, 0)); */
}

#brewery-search {
  grid-area: search;
  max-height: 500px;
}

#top-filler-photo {
  grid-area: t-photo;
  /* width: 150%;
  height: 70%; */
}

#bottom-filler-photo {
  grid-area: b-photo;
  /* width: 150%;
  height: 70%; */
}


.home {
  display: grid;
  margin-top: 100px;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
  gap: 15px;
  margin-left: 3%;
  margin-right: 3%;
  
  grid-template-areas: 
  "message message message message message message"
  "map map map . t-photo t-photo"
  "map map map . t-photo t-photo"
  "map map map search search search"
  "b-photo b-photo . search search search"
  "b-photo b-photo . search search search"
  ;
}
</style>
