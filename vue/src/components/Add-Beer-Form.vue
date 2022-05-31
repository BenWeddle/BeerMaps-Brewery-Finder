<template>
    <div id="add-beer-div">
        <form id="NewBeerForm">
            <label for="beerName">Enter Name of Beer: </label>
            <input v-model="beer.name" id="beerName" type="text" />

            <label for="beerDescription">Enter a description of your new beer: </label>
            <input v-model="beer.beerDescription" id="beerDescription" type="text" />

            <!-- abv -->
            <label for="abv">Enter the alcohol by volume(ABV) amount: </label>
            <input v-model="beer.abv" id="abv" type="text" />

            <!-- ibu -->
            <label for="ibu">Enter the International Bitterness Units(IBU) amount: </label>
            <input v-model="beer.ibu" id="ibu" type="text" />

            <!-- type -->
            <label for="beerType">Enter the type of beer: </label>
            <input v-model="beer.type" id="beerType" type="text" />

            <!-- image doesnt work, havent decided yet-->
            <label for="img">Select image:</label>
            <input  type="file" id="img" name="img" accept="image/*">

            <button v-on:click="addNewBeer" id="beerFormSubmit" type="submit">Submit Beer</button>

        </form>
    </div>
</template>

<script>
import beerService from '../services/BeerService'
export default({
    setup() {
        
    },
    data() {
      return {
        beer: {
          name: '',
          beerDescription: '',
          abv: '',
          ibu: '',
          type: '',
          image: ''
        }
      }
    },

    name: "add-beer-form",
    
    methods: {
      addNewBeer() {
      beerService.addBeer(this.beer).then(response => {
        if(response.status == 201) {
          alert("Beer successfully added");
          }
        })
        .catch(error => {
          console.log(error)
          alert("Beer was not added")
        })
      }
    },
      updateBeer() {
        beerService.updateBeer(this.beer).then(response => {
          if(response.status == 201) {
            alert("Beer successfully updated")
          }
        }) 
      },

      deleteBeer() {
        beerService.deleteBeer(this.beer).then(response => {
          if(response.status == 201) {
            alert("Beer Deleted")
          }
        })
      },

});




</script>

<style scoped>

#add-beer-div {
  background-color: blue;
}


</style>
