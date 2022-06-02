<template>
  <div>
    <h1>Add New Brewery</h1>
    <new-brewery-form></new-brewery-form>
  </div>
</template>

<script>
import NewBreweryForm from '../components/New-Brewery-Form.vue'

export default {
  name: "addBrewery",
  components: {
    NewBreweryForm,

  }
};
</script>

<style scoped>
#breweryForm{
    display: flex;
    flex-direction: column;
}

</style>
