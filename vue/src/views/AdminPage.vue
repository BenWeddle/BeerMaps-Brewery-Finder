<template>
  <div id="page-container">
    <brewery-card id="brew"></brewery-card>
    <admin-beverage-list id="bev-list"></admin-beverage-list>
    <ViewAllBreweries id="all-breweries"></ViewAllBreweries>
  </div>
</template>

<script>
import BreweryCard from '../components/BreweryCard';
import AdminBeverageList from "../components/AdminBeverageList";
import ViewAllBreweries from "../components/ViewAllBreweries";
export default {
  components: {
    BreweryCard,
    AdminBeverageList,
    ViewAllBreweries
  },
  setup() {

  },
  name: "AdminPage",
};
</script>

<style scoped>

#all-breweries{
  grid-area: all-breweries;
 
}

#brew{
  grid-area: brewery;
  border: 1px solid black;
  padding-top: 10px;
  background-color: #f3bc23;
  border-radius: 25px;
}

#bev{
  grid-area: beverage;
}

#bev-list{
  grid-area: bevlist;
  border: 1px solid black;
  padding: 1px;
  border-radius: 25px;
  font-family: tangerine;
  font-style: italic;
  font-weight: bold;
  background-color: #51c556;
}

#nav{
  grid-area: right;
  border: 1px solid black;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  background-color: #f3bc23;
  border-radius: 25px;
  font-family: tangerine;
  font-style: italic;
  padding-top: 40px;
  padding-bottom: 100px;
  
}

#page-container{
  display: grid;
  grid-template-columns: 1fr 1fr;

  grid-template-areas:
  "brewery bevlist"
  "all-breweries all-breweries"
  ;
  gap: 10px;
}

</style>
