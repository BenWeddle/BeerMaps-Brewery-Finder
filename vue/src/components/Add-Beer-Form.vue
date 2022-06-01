<template>
    <div id="add-beverage-div">
        <b-form id="NewbeverageForm">
          <b-form-group
            id="beverageName"
            label="Enter Name of beverage:"
            label-for="name"
          >
          <b-form-input
            id="name"
            v-model="beverage.name"
            type= "text"
            placeholder= "Beverage Name..."
            required
          ></b-form-input>
          </b-form-group>

          <b-form-group
            id="beverageDescription"
            label="Enter a description of the beverage"
            label-for="description"
          >
          <b-form-textarea
            id="description"
            v-model="beverage.beverageDescription"
            type= "text-area"
            placeholder= "Beverage Description..."
          ></b-form-textarea>
          </b-form-group>

          <b-form-group
            id="abv"
            label="Enter the alcohol by volume(ABV) amount: "
            label-for="abv"
          >
          <b-form-input
            id="abv"
            v-model="beverage.abv"
            type= "text"
            placeholder= "ABV %"
            required
          ></b-form-input>
          </b-form-group>

          <b-form-group
            id="ibu"
            label="Enter the International Bitterness Units(IBU) amount: "
            label-for="ibu"
          >
          <b-form-input
            id="ibu"
            v-model="beverage.ibu"
            type= "text"
            placeholder= "IBU #"
            required
          ></b-form-input>
          </b-form-group>

          <b-form-group
            id="type"
            label="Enter the type of beverage: "
            label-for="type"
          >
          <b-form-select v-model="selected" :options="options"></b-form-select>
          </b-form-group>

            <!-- image upload doesnt work, havent decided yet
            <label for="img">Select image:</label>
            <input  type="file" id="img" name="img" accept="image/*"> -->

            <b-button variant="primary" v-on:click="addNewbeverage" id="beverageFormSubmit" type="submit">Submit beverage</b-button>

        </b-form>
    </div>
</template>

<script>
import beverageService from '../services/BeverageService'
export default({
    setup() {
        
    },
    data() {
      return {
        beverage: {
          name: '',
          beverageDescription: '',
          abv: '',
          ibu: '',
          type: '',
          image: '',
          availabilty: false
        },
        options: [
          { value: null, text: 'Please select an option' },
          { value: 'beer', text: 'Beer' },
          { value: 'cider', text: 'Cider' },
          { value: 'Wine', text: 'Wine' },
          { value: 'NA', text: 'N/A Beverage'}
        ]
      }
    },

    name: "add-beverage-form",
    
    methods: {
      addNewbeverage() {
      beverageService.addbeverage(this.beverage).then(response => {
        if(response.status == 201) {
          alert("beverage successfully added");
          }
        })
        .catch(error => {
          console.log(error)
          alert("beverage was not added")
        })
      }
    },
      updatebeverage() {
        beverageService.updatebeverage(this.beverage).then(response => {
          if(response.status == 201) {
            alert("beverage successfully updated")
          }
        }) 
      },

      deletebeverage() {
        beverageService.deletebeverage(this.beverage).then(response => {
          if(response.status == 201) {
            alert("beverage Deleted")
          }
        })
      },
});




</script>

<style scoped>
div {
  padding: 10px;
}


#beverageFormSubmit{
  margin-top: 10px;
}

</style>
