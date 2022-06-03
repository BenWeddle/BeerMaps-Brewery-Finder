<template>
<div class="beverage-container">

  <b-table :items="beverages" :fields="fields" striped responsive="sm">
    <template #cell(show_details)="row">
      <b-button size="sm" @click="row.toggleDetails" class="mr-2">
        {{ row.detailsShowing ? 'Hide' : 'Show'}} Details
      </b-button>

      <!-- As `row.showDetails` is one-way, we call the toggleDetails function on @change -->
<!--      <b-form-checkbox v-model="row.detailsShowing" @change="row.toggleDetails">-->
<!--        Details via check-->
<!--      </b-form-checkbox>-->
    </template>

    <template #row-details="row">
      <b-card>
        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Abv: </b></b-col>
          <b-col>{{ row.item.abv }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Available:</b></b-col>
          <b-col>{{ row.item.available }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>IBUs:</b></b-col>
          <b-col>{{ row.item.ibu }}</b-col>
        </b-row>

        <b-row class="mb-2">
          <b-col sm="3" class="text-sm-right"><b>Description:</b></b-col>
          <b-col>{{ row.item.description }}</b-col>
        </b-row>

        <b-button size="sm" @click="row.toggleDetails">Hide Details</b-button>
      </b-card>
    </template>
  </b-table>

</div>
</template>

<script>
export default {
  name: "AdminBeverageList",
  data(){
    return {
      fields: ['beverageName', 'beverageType', 'show_details'],
      beverages: [
        { available: true, abv: 6, beverageName: 'Coors', beverageType: 'Beer', ibu: 10, description: 'As cold as the Rockies' },
        { available: false, abv: 8, beverageName: 'Bud-Light', beverageType: 'Beer', ibu: 25, description: 'Not the best beer' },
        {available: false, abv: 4, beverageName: 'Reds', beverageType: 'Cider', ibu: 5, description: 'There are apples in it'},
        { available: true, abv: 5, beverageName: 'Red Stripe', beverageType: 'Beer', ibu: 50, description: 'Hooray Beer!!!!' }
      ]
    }
  }
}
</script>

<style scoped>

</style>