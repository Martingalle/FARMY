import mapboxgl from "mapbox-gl/dist/mapbox-gl.js";

mapboxgl.accessToken = 'pk.eyJ1IjoiYW50aG9ueWxudCIsImEiOiJjamw5Z3ViZ3gwYjdwM3BvNW4wazBtc3EzIn0.-DZt62XvxGWU3X2RGZxD_g';

const mapElement = document.querySelector('#map');

if (mapElement) {
  const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v10',
  center: [2.349014, 48.864716], // starting position [lng, lat]
  zoom: 4
  });

  const markers = JSON.parse(mapElement.dataset.markers);
  if (markers.length === 1) {
    new mapboxgl.Marker(el)
        .setLngLat([markers[0].lng, markers[0].lat])
        .addTo(map)
        .fitBounds(markers);
  } else if (markers.length > 1) {
    markers.forEach( marker => {
      let el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = 'url(/assets/favicon/favicon.ico)';
      el.style.width = '40px';
      el.style.height = '40px';
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
    });
  }
}
