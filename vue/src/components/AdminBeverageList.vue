<template>
<div class="beverage-container">

  <b-alert v-model="displayAlert" variant="success" dismissible>
    Successfully Deleted!
  </b-alert>
  <b-table :items="beverages" :fields="fields" striped responsive="sm">
    <template #cell(show_details)="row">
      <b-button size="sm" @click="row.toggleDetails" class="mr-2">
        {{ row.detailsShowing ? 'Hide' : 'Show'}} Details
      </b-button>
    </template>

    <template #row-details="row">
      <b-card>
        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Abv: </b></b-col>
          <b-col>{{ row.item.abv }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Available:</b></b-col>
          <b-col>{{ row.item.available }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>IBUs:</b></b-col>
          <b-col>{{ row.item.ibu }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Description:</b></b-col>
          <b-col>{{ row.item.description }}</b-col>
        </b-row>

        <b-button size="sm" @click="row.toggleDetails">Hide Details</b-button>

        <b-modal ref="confirm-delete"
                 hide-footer centered
                 title="Are you sure?"
                 >
          <div class="d-block text-center">
            <h3>Are you sure you want to remove this beverage?</h3>
          </div>
          <div id="popup-buttons">
            <b-button class="mt-3" variant="outline-danger" block  @click="deleteBeverageById(row.item.beverageId)">Delete Beverage</b-button>
            <b-button class="mt-3" variant="outline-warning" block @click="exitDeleteConfirmation">Cancel</b-button>
          </div>
        </b-modal>

        <b-button size ="sm" variant ="danger" id="delete-button" @click="confirmDelete">Delete</b-button>
      </b-card>
    </template>
  </b-table>
  <b-button size ="md" variant ="primary" id="add-button" @click="addBeverage">Add Beverage</b-button>

  <b-modal id="add-beverage"
           v-model="showMe"
           title="Add a New Beverage"
           hide-footer centered
  >
    <add-beer-form></add-beer-form>
    <div id="finish-button-container">
      <b-button class="mt-3" variant="outline-primary"  @click="showMe = false">Finish</b-button>
    </div>
  </b-modal>


</div>
</template>

<script>
import BeverageService from "../services/BeverageService";
import AddBeerForm from "./Add-Beer-Form";
export default {
  name: "AdminBeverageList",
  components: {
    AddBeerForm
  },
  data() {
    return {
      fields: ['beverageName', 'beverageType', 'show_details'],
      beverages: [],
      displayAlert: false,
      showMe: false
    }
  },
  computed: {},
  created() {
    this.loadBeverages();
  },
  methods: {
    deleteBeverageById(beverageId) {
      BeverageService.deletebeverage(beverageId);
      this.exitDeleteConfirmation();
      this.displayAlert = true;
      // this.confirmationToast();
    },
    confirmDelete() {
      this.$refs['confirm-delete'].show()
    },
    exitDeleteConfirmation() {
      this.$refs['confirm-delete'].hide()
    },
    loadBeverages() {
      BeverageService.getBeveragesByBreweryId(this.$store.state.breweryIdFromBrewer).then(response => {
        this.beverages = response.data;
      })
    },
    confirmationToast(){
      this.$root.$bvToast.toast('Beverage has been successfully deleted', {
        title: 'Confirmation',
        noAutoHide: true
      })
    },
    addBeverage(){
      this.showMe = true;
    }
  }
}

</script>

<style scoped>

#popup-buttons{
  display: flex;
  justify-content: space-evenly;
}

#finish-button-container{
  display: flex;
  justify-content: end;
}

</style>