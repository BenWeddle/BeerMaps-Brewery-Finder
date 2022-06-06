<template>
    <div id="brewery-map">

        <label>
      </label>

        <gmap-map
            :zoom="11"
            :center="center"
            style= "width:100%; height: 600px;"
        >
<<<<<<< HEAD
        <!-- <gmap-marker
            :key="index"
            v-for="(m,index) in locationMarkers"
            :position="m.position"
            @click="center=m.position"
        ></gmap-marker> -->

        <gmap-marker
            :key="m.id"
            v-for="(m) in locationMarkers"
            :position="m.position"
            @click="center=m.position"
        ></gmap-marker>


=======
           <gmap-marker
               :key="index"
               v-for="(m,index) in this.dropPinsForBreweries"
               :position="m.position"
               @click="center=m.position"
           ></gmap-marker>
>>>>>>> main

        </gmap-map>
        <div class="filter">
            <h4>Please select a location</h4>
            <gmap-autocomplete @place_changed="initMarker"></gmap-autocomplete>
            <button @click="addLocationMarker">Add</button>
            <br />
        </div>
    </div>
</template>

<script>

export default({
    setup() {},
    name: 'map-area',
    props: ['breweries'],
    data() {
        return {
            center: {
                lat: 39.983334,
                lng: -82.983330,
                // current coordinates for Columbus OH
            },
            locationMarkers: [],
            locPlaces: [],
            existingPlace: null,
<<<<<<< HEAD
            // listOfBreweries: 
        }
    },
    created() {
        // this.locateGeoLocation();
        
    },
    mounted() {
        this.dropPinsForBreweries();
=======
            listOfBreweries: this.$store.state.listOfBreweries,
            isLoading: true
        };
>>>>>>> main
    },
    computed: {
        storeListOfBreweries(){
          return this.$store.state.listOfBreweries
        },
        dropPinsForBreweries() {
        let locations = []
        this.storeListOfBreweries.forEach((brewery) => {
          const marker = {
            lat: brewery.latitude,
            lng: brewery.longitude
          }
          locations.push({position: marker})
        })
        return locations;
      }
    },
    methods: {
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
<<<<<<< HEAD

            // this.dropPinsForBreweries()
        },
        dropPinsForBreweries() {
            this.$store.state.listOfBreweries.forEach((brewery) => {
                const marker = {
                    lat: brewery.latitude,
                    lng: brewery.longitude
                }
                this.locationMarkers.push({position: marker})
                this.locPlaces.push(this.existingPlace)
                // this.center = marker
                this.existingPlace = null
            })
=======
>>>>>>> main
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
    font-style: italic;
}

    
</style>
