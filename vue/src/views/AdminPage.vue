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
  border: 1px solid black;
  padding-top: 10px;
  background-color: #8ca4b8;
  border-radius: 25px;
}

#brew:hover{
  background-color: #8ca4b8;
  border: 1px solid black;
}

#bev{
  grid-area: beverage;
  border: 1px solid black;
  padding: 10px;
  background-color: #8ca4b8;
  border-radius: 25px;
}

#bev:hover{
  background-color: #8ca4b8;
  border: 1px solid black;
}

#bev-list{
  grid-area: bevlist;
  border: 1px solid black;
  padding: 10px;
  border-radius: 25px;
}

#nav{
  grid-area: right;
  border: 1px solid black;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-evenly;
  background-color: #8ca4b8;
  border-radius: 25px;
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
