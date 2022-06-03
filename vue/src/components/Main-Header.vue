<template>
    <div id="header">
        <router-link class="home" v-bind:to="{ name: 'home' }"><h1>Home</h1></router-link>
        <h1>BeerMaps</h1>

        <b-dropdown text="Menu">
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
    setup() {
        
    },
})
</script>

<style scoped>
#header {
    display: flex;
    justify-content: space-between;
    font-family:cursive;
}

h1 {
    padding-left: 40%;
    font-size: 500%;
}
<<<<<<< HEAD

div {
    background-color: white;
    
=======
#home {
    all: none,
>>>>>>> main
}



</style>
