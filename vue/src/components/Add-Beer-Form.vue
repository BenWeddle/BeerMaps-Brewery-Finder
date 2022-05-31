<template>
    <div>
        <form id="NewBeerForm">
            <label for="beerName">Enter Name of Beer: </label>
            <input id="beerName" type="text" />

            <label for="beerDescription">Enter a description of your new beer: </label>
            <input id="beerDescription" type="text" />

            <!-- abv -->
            <label for="abv">Enter the alcohol by volume(ABV) amount: </label>
            <input id="abv" type="text" />

            <!-- ibu -->
            <label for="ibu">Enter the International Bitterness Units(IBU) amount: </label>
            <input id="ibu" type="text" />

            <!-- type -->
            <label for="beerType">Enter the type of beer: </label>
            <input id="beerType" type="text" />

            <!-- image -->
            <label for="img">Select image:</label>
            <input type="file" id="img" name="img" accept="image/*">

        </form>
    </div>
</template>

<script>

export default({
    setup() {
        
    },
    name: "add-beer-form",
    
})
</script>

<style>

</style>
