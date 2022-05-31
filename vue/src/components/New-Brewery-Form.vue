<template>
    <div>
        <form id="breweryForm">
            <label for="breweryName">Enter Name of Brewery: </label>
            <input id="breweryName" type="text" />

            <label for="breweryDescription">Enter a description of your brewery: </label>
            <input id="breweryDescription" type="text" />

            <input type="checkbox" id="outdoorSeating" />
            <label for="outdoorSeating">Does it have outdoor seating? </label>
            
            <input type="checkbox" id="allowsPets" />
            <label for="allowsPets">Does it allow pets? </label>

            <input type="checkbox" id="hasFood" />
            <label for="hasFood">Does it serve food? </label>

            <input type="checkbox" id="onSiteBrewing" />
            <label for="onSiteBrewing">Does it have on-site brewing? </label>

        </form>
    </div>
</template>

<script>

export default({
    setup() {
        
    },
    name: "new-brewery-form",
    
})
</script>

<style>

</style>
