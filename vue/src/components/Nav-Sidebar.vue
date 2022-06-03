<template>
    <div id="navbar">
        <h3 id="nav-title">Navigation</h3>

        <router-link to="/addBrewery">Add New Brewery</router-link>
        <br />
        <router-link to="/addBeer">Add New Beer</router-link>
        <br />
        <router-link to="/admin">Go to Admin Page</router-link>
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
    border-radius: 25px;
    background-color: #ebe6cf;
}

#nav-title {
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: underline;
    font-style:italic;
}
</style>
