<template>
  <div class="home">

<!--    <video autoplay muted loop id="myVideo">-->
<!--      <source src="../../public/Tap.mp4" type="video/mp4">-->
<!--    </video>-->
    <welcome-message id="message"></welcome-message>
    <AddGoogleMap id="map"></AddGoogleMap>

    <div class="top-photos">
    </div>

    <div id="brewery-search">
      <UserBrewerySearch ></UserBrewerySearch>
   </div> 
   <!-- <about-us id="about-us"></about-us> -->
    
    <!-- <div id="bottom-photo">
      <img src="../../public/brewww.png" id="bottom-filler-photo"/>
      <div id="inner-bottom-photo">
        <img src="../../public/re.png" id="small-beer-photo"/>
        <img src="../../public/Guy.jpg" id="guy"/>
      </div> --> -->
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
    background-image: linear-gradient(to bottom right, rgb(247, 223, 195), #eb9630);
    align-items: center;
    justify-content: center;
    font-family: tangerine;
    font-style: italic;
}

#map {
  grid-area: map;
}

#brewery-search {
  grid-area: search;
  opacity: .9;
  overflow: auto;
}

#about-us {
  grid-area: about-us
}

/* .top-photos {
  height: 350px;
  width: 500px;
  grid-area: t-photo;

}
#guy{
  border-radius: 50%;
  max-width: 300px;
  max-height: 300px;
  grid-area: bottom-right;
}
#small-beer-photo{
  border-radius: 50%;
  max-width: 300px;
  max-height: 300px;
  grid-area: top-left;
} */

/* #inner-bottom-photo{
  display: grid;
  span: 3;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
  "top-left ."
  ". bottom-right"
  ;
} */

#bottom-photo{
  display: flex;
  grid-area: b-photo;
  opacity: .6;
}

#myVideo {
  width: 100vw;
  height: 100vh;
  object-fit: cover;
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: -1;
}

#bottom-filler-photo {
  margin-top: 20%;
  border-radius: 50%;
  width: 25em;
  max-height: 20em;
}

.home {
  display: grid;
  margin-top: 100px;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
  gap: 15px;
  margin-left: 3%;
  margin-right: 3%;
  z-index: 1;
  position: relative;
  
  grid-template-areas: 
  "message message message message message message"
  "map map map t-photo t-photo t-photo"
  "map map map t-photo t-photo t-photo"
  "map map map search search search"
  "about-us about-us about-us search search search"
  "about-us about-us about-us search search search"
  ;
}
</style>
