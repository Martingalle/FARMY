import mapboxgl from "mapbox-gl/dist/mapbox-gl.js";

mapboxgl.accessToken = 'pk.eyJ1IjoiYW50aG9ueWxudCIsImEiOiJjamw5Z3ViZ3gwYjdwM3BvNW4wazBtc3EzIn0.-DZt62XvxGWU3X2RGZxD_g';

const mapElement = document.querySelector('#map');

if (mapElement) {
  let map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v10',
  center: [2.349014, 48.864716], // starting position [lng, lat]
  zoom: 4
  });

  const markers = JSON.parse(mapElement.dataset.markers);
  if (markers.length === 1) {
    const mark = document.createElement('div');
    mark.className = 'marker';
    mark.style.width = '60px';
    mark.style.height = '60px';
    new mapboxgl.Marker(mark)
        .setLngLat([markers[0].lng, markers[0].lat])
        .addTo(map);
    map.fitBounds([
      [markers[0].lng, markers[0].lat],
      [markers[0].lng, markers[0].lat]],
      {zoom: 12});
  } else if (markers.length > 1) {
      markers.forEach( marker => {
        const el = document.createElement('div');
        el.className = 'marker';
        el.style.width = '50px';
        el.style.height = '50px';
        new mapboxgl.Marker(el)
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      });
  }
}
