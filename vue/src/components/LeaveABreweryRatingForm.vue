<template>
<div>
  <b-form id="leave-rating-form">

      <b-form-rating id="rating-number" v-model="userRating.rating" variant="primary"></b-form-rating>

    <b-form-group
        id="review-body"
        label="Discuss your experience"
        label-for="rating-text"
    >
      <b-form-textarea
          id="rating-text"
          v-model="userRating.ratingText"
          type= "text-area"
          placeholder= "Leave a Review"
      ></b-form-textarea>
    </b-form-group>

  </b-form>
</div>
</template>

<script>
export default {
  name: "LeaveABreweryRatingForm",
  data(){
    return {
      userRating: {
        ratingText: '',
        rating: 3,
        ratingType: 'brewery',
        breweryId: '',
        reviewerId: '',
        ratingDate: date()
    }
  };
  }
}
</script>

<style scoped>

#review-body{
  margin-top: 25px;
  padding: 10px;
  border-radius: 0px;
}

</style>