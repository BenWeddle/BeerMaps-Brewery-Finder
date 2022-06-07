<template>
    <div>
    <b-navbar toggleable="lg" type="dark" variant="warning">
        <router-link class="home" v-bind:to="{ name: 'home' }"><h1>Home</h1></router-link>
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
            <router-link to="/addBrewery">Add New Brewery</router-link>
        </b-navbar-nav> 
        <b-navbar-nav> 
            <router-link to="/addBeer">Add New Beer</router-link>
        </b-navbar-nav> 
        <b-navbar-nav>
            <router-link to="/admin">Go to Admin Page</router-link>
        </b-navbar-nav>
        <b-nav-form>
            <b-button size="sm" @click="showGlobalBeverages">View All Beverages</b-button>
        </b-nav-form>
        <!-- <b-navbar-nav>
        
        </b-navbar-nav>
        <b-navbar-nav>
        <b-button size="lg" @click="showAddBeverage">Add a Beverage to Website</b-button>
        </b-navbar-nav> -->
      <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
        <b-nav-form>
          <div class="filter">
            <h4>Please select a location</h4>
            <gmap-autocomplete @place_changed="initMarker"></gmap-autocomplete>
            <button @click="addLocationMarker">Add</button>
            <br />
        </div>
        </b-nav-form>

        <b-nav-item-dropdown right>
            <!-- Using 'button-content' slot -->
            <template #button-content>
                <b-avatar variant="primary"></b-avatar>
            </template>
            <b-dropdown-item><b-button size="lg" @click="showGlobalBeverages">View All Beverages</b-button></b-dropdown-item>
            <b-dropdown-item></b-dropdown-item>
            <b-dropdown-item><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link></b-dropdown-item>
            </b-nav-item-dropdown>
        </b-navbar-nav>
        </b-collapse>
    </b-navbar>
    <b-modal id="global-beverage"
             v-model="showGlobal"
             title="All Our Beverages"
             size="xl"
             hide-footer centered
    >
        <view-global-beverages></view-global-beverages>
             <div class="finish-button-container">
        <b-button class="mt-3" variant="outline-primary"  @click="showGlobal = false">Finish</b-button>
            </div>
        </b-modal>

        <b-modal id="add-beverage"
             v-model="showAdd"
             title="Add a New Beverage"
             hide-footer centered
    >
        <add-beer-form></add-beer-form>
            <div class="finish-button-container">
        <b-button class="mt-3" variant="outline-primary"  @click="showAdd = false">Finish</b-button>
      </div>
    </b-modal>

    </div>
</template>

<script>
import ViewGlobalBeverages from "./ViewGlobalBeverages";
import AddBeerForm from "./Add-Beer-Form";
export default({
    name: "nav-sidebar",
    components: {
    ViewGlobalBeverages,
    AddBeerForm
  },
  data(){
    return {
      showGlobal: false,
      showAdd: false
    };
  },
  methods: {
    showGlobalBeverages(){
      this.showGlobal = true;
    },
    showAddBeverage(){
      this.showAdd = true;
    }
  }
})

</script>

<style scoped>
div {
    
    align-items: center;
    justify-content: space-between;
    font-family: tangerine;
    font-style: italic;
}

.home {
    padding-right: 200px;
    padding-left: 10px;
}

#links {
    
}

</style>
