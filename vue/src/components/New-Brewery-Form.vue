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

<style scoped>
html {
 
  margin-left: 500px;
  margin-right: 500px;
  background-image: url(https://wallpaperboat.com/wp-content/uploads/2020/10/30/58635/beer-04.jpg);
  background-position: center;
  background-position-y: 0px;
}

body {
  background-color:rgb(238, 144, 56);
  border-radius: 70px;
  opacity: .9;
  
}

.home {
  margin-left: 60px;
 
}
</style>
