<template>
    <div id="welcome">
<<<<<<< HEAD
        <h3>Welcome</h3>
=======
        <h3>Welcome {{getUserName}}! Let's find you a cold one!</h3>
>>>>>>> main
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
    border-radius: 25px;
    padding: 5px;
}
</style>
