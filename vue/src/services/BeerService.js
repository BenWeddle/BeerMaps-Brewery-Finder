import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080'
});

export default {
    //URL not active yet
    getBeers() {
        return http.get('/beer')
    },
    
    addBeer(beer) {
        return http.post('/beverage/add', beer)
    },

    updateBeer(id) {
        return http.put('/beer', id)
    },

    deleteBeer(id) {
        return http.delete('/beer', id)
    },

    
}