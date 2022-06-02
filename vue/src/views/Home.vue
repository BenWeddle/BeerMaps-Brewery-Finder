<template>
  <div class="home">
    <welcome-message></welcome-message>
    <AddGoogleMap></AddGoogleMap>
  </div>
</template>

<script>
import AddGoogleMap from "../components/Map-feature.vue"
import WelcomeMessage from "../components/Welcome-Message.vue"

export default {
  name: "home",
  components: {
    AddGoogleMap,
    WelcomeMessage,
  }
};
</script>

<style scoped>

#content {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

</style>
