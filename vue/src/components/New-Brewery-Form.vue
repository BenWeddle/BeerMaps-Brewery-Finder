<template>
    <div>
        <b-form id="breweryForm">
          <b-form-group
            id="breweryName"
            label="Enter Name of Brewery:"
            label-for="name"
          >
          <b-form-input
            id="name"
            v-model="brewery.breweryName"
            type= "text"
            placeholder= "Brewery Name..."
            required
          ></b-form-input>
          </b-form-group>

          <b-form-group
            id="breweryDescription"
            label="Enter a description of the brewery"
            label-for="description"
          >
          <b-form-textarea
            id="description"
            v-model="brewery.description"
            type= "text-area"
            placeholder= "Brewery Description..."
          ></b-form-textarea>
          </b-form-group>

           <b-form-checkbox
            id="outdoorSeating"
            v-model="brewery.hasOutDoorSeating"
            name="checkbox-1"
            value="true"
            unchecked-value="false"
          >Does it have outdoor seating?</b-form-checkbox>

          <b-form-checkbox
            id="allowsPets"
            v-model="brewery.isPetFriendly"
            name="allowsPets"
            value="true"
            unchecked-value="false"
          >Does it allow pets?</b-form-checkbox>

          <b-form-checkbox
            id="hasFood"
            v-model="brewery.hasFood"
            name="hasFood"
            value="true"
            unchecked-value="false"
          >Does it serve food?</b-form-checkbox>

          <b-form-checkbox
            id="onsiteBrewing"
            v-model="brewery.hasOnSiteBrewing"
            name="onsiteBrewing"
            value="true"
            unchecked-value="false"
          >Does it have onsite brewing?</b-form-checkbox>




            <!-- <input v-model="brewery.outdoorSeating" v-bind:value="true" type="checkbox" id="outdoorSeating" />
            <label  for="outdoorSeating">Does it have outdoor seating? </label>
            
            <input v-model="brewery.allowsPets" v-bind:value="true" type="checkbox" id="allowsPets" />
            <label for="allowsPets">Does it allow pets? </label>

            <input v-model="brewery.hasFood" v-bind:value="true" type="checkbox" id="hasFood" />
            <label for="hasFood">Does it serve food? </label>

            <input v-model="brewery.onSiteBrewing" v-bind:value="true" type="checkbox" id="onSiteBrewing" />
            <label for="onSiteBrewing">Does it have on-site brewing? </label> -->

            <b-button v-on:click="addNewBrewery" variant="primary" id="breweryFormSubmit" type="submit">Submit Brewery</b-button>

        </b-form>
    </div>
</template>

<script>
import breweryService from "../services/BreweryService";
export default({
    setup() {
        
    },
    data() {
      return{
        brewery: {
          breweryName: '',
          description: '',
          hasOutDoorSeating: false,
          hasFood: false,
          hasOnSiteBrewing: false,
          isPetFriendly: false
        } 
      }
    },
      
    name: "new-brewery-form",

  methods: {
      addNewBrewery(){
        breweryService.addBrewery(this.brewery).then(response => {
          if(response.status == 201){
            alert("beverage successfully added");
          }
        })
            .catch(error => {
              console.log(error)
              alert("beverage was not added")
            })
      }
  }
})
</script>

<style scoped>
div {
  padding: 10px;
}
</style>
