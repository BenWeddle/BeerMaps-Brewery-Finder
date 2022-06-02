<template>
  <div id="page-container">
    <brewery-card id="brew"></brewery-card>
    <beverage-card id="bev"></beverage-card>
    <right-nav id="nav"></right-nav>
  </div>
</template>

<script>
import BreweryCard from '../components/BreweryCard';
import BeverageCard from "../components/BeverageCard";
import RightNav from "../components/AdminPageRightNav";
export default {
  components: {
    RightNav,
    BreweryCard,
    BeverageCard,
  },
  setup() {

  },
  name: "AdminPage",
};
</script>

<style scoped>

#brew{
  grid-area: brewery;
  border: 5px solid blue;
}

#bev{
  grid-area: beverage;
  border: 5px solid red;
  padding: 100px;
}

#nav{
  grid-area: right;
  border: 5px solid orange;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-evenly;
}

#page-container{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;

  grid-template-areas:
  "brewery brewery brewery right"
  "beverage beverage beverage right"
  "beverage beverage beverage right"
  ;
  gap: 10px;
}

</style>
