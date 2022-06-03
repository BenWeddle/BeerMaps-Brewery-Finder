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
    border: solid black 1px;
    border-radius: 25px;
    padding: 5px;
}
</style>
