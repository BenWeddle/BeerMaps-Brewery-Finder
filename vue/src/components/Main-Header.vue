<template>
    <div id="header">
        <router-link class="home" v-bind:to="{ name: 'home' }"><h1>Home</h1></router-link>
        <h1>BeerMaps</h1>
        <!-- <img :src="image"/> -->
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
// import image from "../src/beer_PNG2382"
// export default({
//     data: function() {
//         return {
//             image: image
//         }
//     },
// })
</script>

<style scoped>
#header {
    display: flex;
    justify-content: space-between;
    
}

h1 {
    padding-right:2%;
    font-size: 500%;
    font-family: tangerine;
    font-style: italic;
    font-weight: bolder;
    text-decoration: underline;
    text-decoration-color: #8ca4b8;
}
.home {
    font-size: 40%;
    padding-top: 40px;
    padding-left: 55px;
}

#dropdown {
  margin-top: 2%;
  margin-bottom: 1%;
  padding-right: 1%;
}



</style>
