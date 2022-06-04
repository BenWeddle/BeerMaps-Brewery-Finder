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

    deletebeverage(beverageId) {
        return axios.delete(`/beverage/delete/${beverageId}`)
    },

    getBeverageByBeverageId(beverageId){
        return axios.get(`/beverage/${beverageId}`)
    },

    getBeveragesByBreweryId(breweryId){
        return axios.get(`/beverage/brewery/${breweryId}`)
    }
}