<template>
  <div>
    <b-form id="leave-rating-form">

      <b-form-rating id="rating-number" v-model="rating.rating" variant="primary"></b-form-rating>

      <b-form-group
          id="review-body"
          label="Tell us what you think"
          label-for="rating-text"
      >
        <b-form-textarea
            id="rating-text"
            v-model="rating.ratingText"
            type= "text-area"
            placeholder= "Leave a Review"
        ></b-form-textarea>
        <b-button id="submit-rating" class="mt-3" variant="outline-success"  @click="leaveRating">Submit</b-button>
      </b-form-group>
    </b-form>
  </div>
</template>

<script>
import RatingService from "../services/RatingService";
export default {
  name: "LeaveBeverageRatingForm",
  data() {
    return {
      rating: {
        ratingText: '',
        rating: 3,
        type: 'beverage',
        id: '',
        reviewerId: '',
        date: ''
      }
    };
  },
  computed: {
    getUserID() {
      return this.$store.state.user.id
    },
    getBeverageId(){
      return this.$store.state.selectedBeverageRating
    }
  },
  created() {
    this.setRatingAttributes();
  },
  methods: {
    setRatingAttributes(){
      let today = new Date().toISOString().slice(0, 10);
      this.rating.date = today;
      this.rating.reviewerId = this.getUserID;
      this.rating.id = this.getBeverageId;
    },
    leaveRating(){
      console.log(this.rating)
      RatingService.addRating(this.rating).then((response) => {
        if(response.status == 202){
          alert("Rating Added");
        }
      })
          .catch(error => {
            console.log(error)
            alert("Rating Not Added")
          })
    }
  }
}
</script>

<style scoped>

</style>