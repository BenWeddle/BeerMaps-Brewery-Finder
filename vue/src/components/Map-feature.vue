<template>
    <div id="map">
        <h2>Brewery Map</h2>
        <gmap-map
            :zoom="14"
            :center="center"
            style= "width:100%; height: 600px;"
        >
        </gmap-map>
    </div>
</template>

<script>

export default({
    setup() {},
    name: 'map',
    data() {
        return {
            center: {
                lat: 39.783704,
                lng: -100.4458825,
            }

        }
    },
    created() {
        this.locateGeoLocation();
    },
    computed: {},
    methods: {
        locateGeoLocation: function() {
            navigator.geolocation.getCurrentPosition(res => {
                this.center = {
                    lat: res.coords.latitude,
                    lng: res.coords.longitude
                }
            })
        }
    }

})
</script>

<style scoped>
#map{
    border: solid black 3px;
    margin-top: 2px;
    border-radius: 25px;
    padding: 7px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: rgb(250, 74, 74);
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-style:italic;
}
    
</style>
