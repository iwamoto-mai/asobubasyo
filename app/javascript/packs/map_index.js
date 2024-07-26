console.log("#map_index")

let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") // 追記
  map = new Map(document.getElementById("map"), {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 6,
    mapId: "DEMO_MAP_ID", // 追記    mapTypeControl: false
  });

  // 追記
  try {
    const response = await fetch("/spots.json");
    if (!response.ok) throw new Error('Network response was not ok');
    const items = await response.json();
    //const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");

    items.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const name = item.name;
      const spot_id = item.id;
      const content = item.content;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: name,
        // 他の任意のオプションもここに追加可能
      });
      
      const infowindow = new google.maps.InfoWindow({
        content: `
          <div class="card" style="width:15rem;">
            <div class="card-body">
              <h5 class="card-title">
                ${name}
              </h5>
              <p class="card-text">
                ${content}
              </p>
              <a href="spots/${spot_id}" class="btn btn-primary">詳細</a>
            </div>
          </div>
        `,
        ariaLabel: name,
      });
      
      marker.addListener("click", () => {
          infowindow.open({
          anchor: marker,
          map,
        })
      });
    });
  } catch (error) {
    console.error('Error fetching or processing post images:', error);
  }}

initMap()