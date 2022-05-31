import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080'
});

export default {
    //URL not active yet
    getBreweries() {
        return http.get('/breweries')
    },
    
    addBrewery(brewery) {
        return http.post('/breweries', brewery)
    },

    updateBrewery(id) {
        return http.put('/breweries', id)
    },

    deleteBrewery(id) {
        return http.delete('/breweries', id)
    },

    
}