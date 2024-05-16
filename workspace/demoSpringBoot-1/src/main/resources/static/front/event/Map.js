  let map;
        let currentPosition;
        let selectedRestaurant;
        let marker;
        let directionService;


        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 23.553118, lng: 121.0211024 },
                zoom: 7,
            });

            navigator.geolocation.getCurrentPosition(function (position) {
                currentPosition = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                };

                map.setCenter(currentPosition);
                map.setZoom(16);

                const autocomplete = new google.maps.places.Autocomplete(
                    document.getElementById('search-input'),
                    {
                        types: ['restaurant'],
                        bound: {
                            east: currentPosition.lng + 0.001,
                            west: currentPosition.lng - 0.001,
                            south: currentPosition.lat - 0.001,
                            north: currentPosition.lat + 0.001,
                        },
                        strictBounds: false,
                    }
                );

                autocomplete.addListener('place_changed', function () {
                    const place = autocomplete.getPlace();

                    selectedRestaurant = {
                        location: place.geometry.location,
                        placeId: place.place_id,
                        name: place.name,
                        address: place.formatted_address,
                        phoneNumber: place.formatted_phone_number,
                        rating: place.rating,
                    };


                    console.log(selectedRestaurant);

                    map.setCenter(selectedRestaurant.location);

                    if (!marker) {
                        marker = new google.maps.Marker({
                            map: map,
                        });
                    }

                    marker.setPosition(selectedRestaurant.location);
                });


            });
        }