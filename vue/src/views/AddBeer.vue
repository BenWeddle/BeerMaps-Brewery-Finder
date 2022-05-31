<template>
  <div>
    <h1>Add new Beer</h1>
    <add-beer-form></add-beer-form>
  </div>
</template>

<script>
import AddBeerForm from '../components/Add-Beer-Form.vue';


export default {
  name: "addBeer",
  components: {
    AddBeerForm,

  }
};
</script>