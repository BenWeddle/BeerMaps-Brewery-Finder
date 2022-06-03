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
            <h4>Filter boxes and search stuff</h4>
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
    border: solid black 3px;
    margin-top: 2px;
    display: flex;
    gap: 5px;
}

.filter {
    background-color: white
}
    
</style>
