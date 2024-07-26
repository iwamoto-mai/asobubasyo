console.log("#map_show")

let map;
const mapField = document.getElementById("map")
const spotId = mapField.dataset.spot
async function initMap() {

  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記
  map = new Map(mapField, {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 15,
    mapId: "DEMO_MAP_ID", // 追記    mapTypeControl: false
  });

  // 追記
  try {
    const response = await fetch(`/spots/${spotId}.json`);
    //console.log(await response.json().item)
    const data = await response.json()
    //const { data: { items } } = await response.json();
    //if (!Array.isArray(items)) throw new Error("Items is not an array");

    //items.forEach( item => {
    const latitude = data.item.latitude;
    const longitude = data.item.longitude;

    const marker = new google.maps.marker.AdvancedMarkerElement ({
      position: { lat: latitude, lng: longitude },
      map,
    });
      
    map.setCenter({ lat: latitude, lng: longitude })
    //});
  } catch (error) {
    console.error('Error fetching or processing post images:', error);
  }}

initMap()