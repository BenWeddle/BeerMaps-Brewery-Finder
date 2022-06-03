<template>
    <div id="map">
        <gmap-map
            :zoom="14"
            :center="center"
            style= "width:100%; height: 600px;"
        >
        </gmap-map>
        <div class="filter">
            <h4>Filter boxes and search stuff</h4>
        </div>
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
    display: flex;
    gap: 5px;
}

.filter {
    background-color: white
}
    
</style>
