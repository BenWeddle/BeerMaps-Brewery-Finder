<template>
  <div id="page-container">
    <brewery-card id="brew"></brewery-card>
    <beverage-card id="bev"></beverage-card>
    <right-nav id="nav"></right-nav>
    <admin-beverage-list id="bev-list"></admin-beverage-list>
  </div>
</template>

<script>
import BreweryCard from '../components/BreweryCard';
import BeverageCard from "../components/BeverageCard";
import RightNav from "../components/AdminPageRightNav";
import AdminBeverageList from "../components/AdminBeverageList";
export default {
  components: {
    RightNav,
    BreweryCard,
    BeverageCard,
    AdminBeverageList
  },
  setup() {

  },
  name: "AdminPage",
};
</script>

<style scoped>

#brew{
  grid-area: brewery;
  border: 3px solid #F48C06;
  padding: 10px;
  background-color: #FAA307;
  border-radius: 10%;
}

#brew:hover{
  background-color: #F48C06;
  border: 3px solid #FAA307;
}

#bev{
  grid-area: beverage;
  border: 3px solid #FAA307;
  padding: 10px;
  background-color: #FFBA08;
  border-radius: 10%;
}

#bev:hover{
  background-color: #FAA307;
  border: 3px solid #FFBA08;
}

#bev-list{
  grid-area: bevlist;
  border: 5px solid purple;
  padding: 10px;
}

#nav{
  grid-area: right;
  border: 5px solid orange;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-evenly;
  background-color: #F48C06;
  border-radius: 15%;
}

#page-container{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;

  grid-template-areas:
  "brewery brewery brewery right"
  "beverage beverage beverage right"
  "beverage beverage beverage right"
  "bevlist bevlist bevlist right"
  "bevlist bevlist bevlist right"
  ;
  gap: 10px;
}

</style>
