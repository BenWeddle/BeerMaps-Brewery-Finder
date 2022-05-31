<template>
    <div>
        <form id="breweryForm">
            <label for="breweryName">Enter Name of Brewery: </label>
            <input v-model="brewery.name" id="breweryName" type="text" />

            <label for="breweryDescription">Enter a description of your brewery: </label>
            <input v-model="brewery.breweryDescription" id="breweryDescription" type="text" />

            <input v-model="brewery.outdoorSeating" v-bind:value="true" type="checkbox" id="outdoorSeating" />
            <label  for="outdoorSeating">Does it have outdoor seating? </label>
            
            <input v-model="brewery.allowsPets" v-bind:value="true" type="checkbox" id="allowsPets" />
            <label for="allowsPets">Does it allow pets? </label>

            <input v-model="brewery.hasFood" v-bind:value="true" type="checkbox" id="hasFood" />
            <label for="hasFood">Does it serve food? </label>

            <input v-model="brewery.onSiteBrewing" v-bind:value="true" type="checkbox" id="onSiteBrewing" />
            <label for="onSiteBrewing">Does it have on-site brewing? </label>

            <button id="breweryFormSubmit" type="submit">Submit Brewery</button>

        </form>
    </div>
</template>

<script>

export default({
    setup() {
        
    },
    data() {
      return{
        brewery: {
          name: '',
          breweryDescription: '',
          outdoorSeating: false,
          hasFood: false,
          onSiteBrewing: false
        } 
      }
    },
      
    name: "new-brewery-form",

})
</script>

<style scoped>

</style>
