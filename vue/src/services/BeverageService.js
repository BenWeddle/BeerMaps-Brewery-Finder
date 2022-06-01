import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080'
});

export default {
    //URL not active yet
    getbeverages() {
        return http.get('/beverage')
    },
    
    addbeverage(beverage) {
        return http.post('/beverage/add', beverage)
    },

    updatebeverage(id) {
        return http.put('/beverage', id)
    },

    deletebeverage(id) {
        return http.delete('/beverage', id)
    },

    
}