import axios from 'axios';

// const http = axios.create({
//     baseURL: 'http://localhost:8080'
// });

export default {
    //URL not active yet
    getbeverages() {
        return axios.get('/beverage')
    },
    
    addbeverage(beverage) {
        return axios.post('/beverage/add', beverage)
    },

    updatebeverage(id) {
        return axios.put('/beverage', id)
    },

    deletebeverage(id) {
        return axios.delete('/beverage', id)
    },

    getBeverageByBeverageId(beverageId){
        return axios.get(`/beverage/${beverageId}`)
    }
}