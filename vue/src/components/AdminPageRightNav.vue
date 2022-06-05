<template>
  <div id="nav-container">
    <h1 class="text-center">A BUNCH OF LINKS WILL GO UNDER HERE</h1>
    <b-button size="lg" @click="showGlobalBeverages">View Global Beverages</b-button>
    <b-button size="lg" @click="showAddBeverage">Add a Beverage Globally</b-button>
    <b-button size="lg" href="#">I am also also link</b-button>
    <b-button size="lg" href="#">I am also kind of a link</b-button>
    <b-button size="lg" href="#">I am not a link, or am i?</b-button>

    <b-modal id="global-beverage"
             v-model="showGlobal"
             title="Global Beverages"
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
export default {
  name: 'right-nav',
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
}
</script>


<style scoped>

.finish-button-container{
  display: flex;
  justify-content: end;
}

</style>