<template>
    <div id="header">
        <h2>Home</h2>
        <h1>BeerMaps</h1>

        <b-dropdown text="Menu" split split-to="/" class="m-2" >
            <template #button-content>
                <div>
                    <b-avatar variant="primary"></b-avatar>
                </div>
            </template>
            <b-dropdown-item href="#">An item</b-dropdown-item>
            <b-dropdown-item href="#">Another item</b-dropdown-item>
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
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-style:italic;
}
#__BVID__11{
  border: 5px solid red;
}

h1 {
    padding-left: 150px;
    font-size: 500%;
}




</style>
