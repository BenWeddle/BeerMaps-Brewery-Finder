<template>
    <div id="navbar">
        <router-link class="home" v-bind:to="{ name: 'home' }"><h1>Home</h1></router-link>
        <br />
        <router-link to="/addBrewery">Add New Brewery</router-link>
        <br />
        <router-link to="/addBeer">Add New Beer</router-link>
        <br />
        <router-link to="/admin">Go to Admin Page</router-link>
        <br />
        <b-dropdown text="Menu" id="dropdown">
            <template #button-content>
                <b-avatar variant="primary"></b-avatar>
            </template>
            <b-dropdown-item href="#">An item</b-dropdown-item>
            <b-dropdown-item><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link></b-dropdown-item>
        </b-dropdown>

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
    display: flex;
    align-items: center;
    justify-content: flex-end;
    justify-content: space-between;
    border: solid black 1px;
    padding: 5px;
    padding-left: 10px;
    padding-right: 15px;
    border-radius: 25px;
    background-color: #8ca4b8;
    font-weight: bolder;
    font-style: italic;
    font-family: tangerine;
    
    
}

:hover {
  color: rgb(233, 204, 110);
}

.router-link-exact-active {
  
}


</style>
