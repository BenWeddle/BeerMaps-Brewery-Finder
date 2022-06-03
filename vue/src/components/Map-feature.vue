<template>
    <div id="map">

        <label>
        
      </label>

        <gmap-map
            :zoom="14"
            :center="center"
            style= "width:100%; height: 600px;"
        >
        <gmap-marker
            :key="index"
            v-for="(m,index) in locationMarkers"
            :position="m.position"
            @click="center=m.position"
        ></gmap-marker>



        </gmap-map>
        <div class="filter">
            <h4>Please select a location</h4>
            <gmap-autocomplete @place_changed="initMarker"></gmap-autocomplete>
            <button @click="addLocationMarker">Add</button>
            <br />
            <!-- <p v-for="brewery in breweries" v-bind:key="brewery.id">{{brewery.breweryName}}</p> -->
        </div>
    </div>
</template>

<script>

export default({
    setup() {},
    name: 'map',
    props: ['breweries'],
    data() {
        return {
            center: {
                lat: 39.783704,
                lng: -100.4458825,
            },
            locationMarkers: [],
            locPlaces: [],
            existingPlace: null,
        }
    },
    created() {
        this.locateGeoLocation();
        this.dropPinsForBreweries();
    },
    computed: {
        
    },
    methods: {
        locateGeoLocation: function() {
            navigator.geolocation.getCurrentPosition(res => {
                this.center = {
                    lat: res.coords.latitude,
                    lng: res.coords.longitude
                }
            })
        },
        initMarker(loc) {
            this.existingPlace = loc;
        },
        addLocationMarker() {
            if (this.existingPlace) {
                const marker = {
                    lat: this.existingPlace.geometry.location.lat(),
                    lng: this.existingPlace.geometry.location.lng()
                }
                this.locationMarkers.push({position: marker})
                this.locPlaces.push(this.existingPlace)
                this.center = marker
                this.existingPlace = null
            }
        },
        dropPinsForBreweries() {
            this.breweries.forEach(this.addLocationMarker)

        }
        
    }

})
</script>

<style scoped>
#map{
    
    margin-top: 0px;
    display: flex;
    
}

.filter {
    background-color: #8ca4b8;
    border-bottom-right-radius: 25px;
    border-left: solid black 1px;
    border-right: solid black 1px;
    border-bottom: solid black 1px;
    padding: 5px;
}

    
</style>
