import axios from 'axios';

// const http = axios.create({
//     baseURL: 'http://localhost:8080'
// });

export default {
    //URL not active yet
    getbeverages() {
        return axios.get('/beverage/all')
    },
    
    addbeverage(beverage) {
        return axios.post('/beverage/add', beverage)
    },

    addBeverageToMenu(beverageId){
        return axios.post(`/beverage/brewery/add/${beverageId}`)
    },

    updatebeverage(id) {
        return axios.put('/beverage', id)
    },

    deletebeverage(beverageId) {
        return axios.delete(`/beverage/delete/${beverageId}`)
    },

    deleteBeverageGloballyById(beverageId) {
        return axios.delete(`/beverage/delete/global/${beverageId}`)
    },

    getBeverageByBeverageId(beverageId){
        return axios.get(`/beverage/${beverageId}`)
    },

    getBeveragesByBreweryId(breweryId){
        return axios.get(`/beverage/brewery/${breweryId}`)
    }
}