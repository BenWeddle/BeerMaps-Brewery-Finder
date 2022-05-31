import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:8080'
});

export default {
    //URL not active yet
    addBrewery(brewery) {
        return http.post('/breweries', brewery)
    }
}