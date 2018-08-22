function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const machineAddress = document.getElementById('machine_location');

    if (machineAddress) {
      const autocomplete = new google.maps.places.Autocomplete(machineAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(machineAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
