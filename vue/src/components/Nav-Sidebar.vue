<template>
    <div id="navbar">
        <h3>Navigation</h3>

        <router-link to="/addBrewery">Add New Brewery</router-link>
        <br />
        <router-link to="/addBeer">Add New Beer</router-link>
    </div>
</template>

<script>

export default({
    setup() {},
    name: "nav-sidebar",

})
</script>

<style scoped>
#navbar {
    border: solid black 1px;
    padding: 5px;
}
</style>
