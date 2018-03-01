function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var horseLocalisation = document.getElementById('horse_localisation');

    if (horseLocalisation) {
      var autocomplete = new google.maps.places.Autocomplete(horseLocalisation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(horseLocalisation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
