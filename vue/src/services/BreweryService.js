import axios from 'axios';

// const http = axios.create({
//     baseURL: 'http://localhost:8080'
// });

export default {
    //URL not active yet
    getBreweries() {
        return axios.get('/brewery')
    },

    addBrewery(brewery) {
        return axios.post('/brewery/add', brewery)
    },

    updateBrewery(id) {
        return axios.put('/brewery', id)
    },

    deleteBrewery(id) {
        return axios.delete('/brewery', id)
    },

    getBreweryById(breweryId) {
        return axios.get(`/brewery/${breweryId}`)
    }


}