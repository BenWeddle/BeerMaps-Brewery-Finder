<template>
  <div id="nav-container">
    <h1 class="text-center">Admin Management</h1>
    <b-button size="lg" @click="showGlobalBeverages">View All Beverages</b-button>
    <b-button size="lg" @click="showAddBeverage">Add a Beverage to Website</b-button>
    <b-button size="lg" @click="showUpdateBrewery">Update Brewery Information</b-button>
    <b-button size="lg" href="#">I am also kind of a link</b-button>
    <b-button size="lg" href="#">I am not a link, or am i?</b-button>

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

    <b-modal id="update-brewery"
             v-model="showUpdate"
             title="Update Brewery Info"
             size="xl"
             hide-footer centered
    >
      <update-brewery-form></update-brewery-form>
      <div class="finish-button-container">
        <b-button class="mt-3" variant="outline-primary"  @click="showUpdate = false">Finish</b-button>
      </div>
    </b-modal>

  </div>
</template>

<script>
import ViewGlobalBeverages from "./ViewGlobalBeverages";
import AddBeerForm from "./Add-Beer-Form";
import UpdateBreweryForm from "./UpdateBreweryForm";
export default {
  name: 'right-nav',
  components: {
    ViewGlobalBeverages,
    AddBeerForm,
    UpdateBreweryForm
  },
  data(){
    return {
      showGlobal: false,
      showAdd: false,
      showUpdate: false
    };
  },
  methods: {
    showGlobalBeverages(){
      this.showGlobal = true;
    },
    showAddBeverage(){
      this.showAdd = true;
    },
    showUpdateBrewery(){
      this.showUpdate = true;
    }
  }
}
</script>


<style scoped>

.finish-button-container{
  display: flex;
  justify-content: end;
}

.text-center {
  text-decoration: underline;
}

div {
  font-family: tangerine;
  font-style: italic;
}

</style>