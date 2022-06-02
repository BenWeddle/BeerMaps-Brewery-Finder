<template>
    <div id="header">
        <h1>Home</h1>
        <h1>BeerMaps</h1>

        <b-dropdown split split-to="/" text="Example" class="m-2">
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
}
</style>
