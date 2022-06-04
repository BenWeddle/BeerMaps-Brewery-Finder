<template>
    <div id="welcome">
        <h3>Welcome {{getUserName}}! Let's find you a cold one!</h3>
    </div>
</template>

<script>


export default({
    setup() {},
    computed: {
        getUserName() {
            return this.$store.state.user.username
        },
    },
})
</script>

<style scoped>
#welcome {
    display: flex;
    border: solid black 1px;
    border-top-right-radius: 25px;
    border-top-left-radius: 25px;
    padding: 5px;
    background-color: #8ca4b8;
    align-items: center;
    justify-content: center;
    font-style: italic;
}
</style>
