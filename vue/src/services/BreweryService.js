import axios from 'axios';

// const http = axios.create({
//     baseURL: 'http://localhost:8080'
// });

export default {
    getBreweries() {
        return axios.get('/brewery/all')
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