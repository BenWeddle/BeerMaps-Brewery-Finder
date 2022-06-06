import axios from 'axios';


export default {

    getBreweryRatingsById(breweryId) {
        return axios.get(`/rating/all/brewery/${breweryId}`)
    }
}