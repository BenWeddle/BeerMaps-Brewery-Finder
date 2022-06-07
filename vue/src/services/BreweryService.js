import axios from 'axios';


export default {
    getBreweries() {
        return axios.get('/brewery/all')
    },

    addBrewery(brewery) {
        return axios.post('/brewery/add', brewery)
    },

    updateBrewery(brewery) {
        return axios.put('/brewery/update/register', brewery)
    },

    deleteBrewery(id) {
        return axios.delete('/brewery', id)
    },

    getBreweryById(breweryId) {
        return axios.get(`/brewery/${breweryId}`)
    },

    getBreweryByBrewerId(brewerId){
        return axios.get(`/brewery/brewer/${brewerId}`)
    }


}