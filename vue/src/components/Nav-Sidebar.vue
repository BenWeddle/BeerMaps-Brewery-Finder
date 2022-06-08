<template>
    <div>
    <b-navbar toggleable="lg" id="navbar">
        <router-link v-bind:to="{ name: 'home' }" id="home"><h1>Home</h1></router-link>
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <div id="manage">
       <div>
        <b-navbar-nav>
         <b-button size="sm"><router-link to="/admin">Go to Admin Page</router-link></b-button>
        </b-navbar-nav>
       </div>
       <div>
        <b-navbar-nav id="showbevs">
            <b-button size="sm" @click="showGlobalBeverages">View All Beverages</b-button>
        </b-navbar-nav>
        </div>
      </div>

      <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
        <b-nav-item-dropdown right>
            <!-- Using 'button-content' slot -->
            <template #button-content>
                <b-avatar variant="primary"></b-avatar>
            </template>
            <b-dropdown-item @click="showAddBeverage">Add a Beverage</b-dropdown-item>
            <b-dropdown-item @click="showGlobalBeverages">Manage Beverages</b-dropdown-item>
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

#home {
    padding-right: 200px;
    padding-left: 30px;
    color: red;
}

#home:hover {
  color: green;
}

#navbar {
  background-image: linear-gradient(to bottom right, rgb(247, 223, 195), rgb(247, 153, 30));
  border-radius: 25px;
}

#manage {
  display: flex;
  
}

#showbevs {
  color: red;
}

</style>
