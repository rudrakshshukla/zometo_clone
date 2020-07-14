
class Location {
    String address;
    String city;
    int city_id;
    int country_id;
    String latitude;
    String locality;
    String locality_verbose;
    String longitude;
    String zipcode;

    Location({this.address, this.city, this.city_id, this.country_id, this.latitude, this.locality, this.locality_verbose, this.longitude, this.zipcode});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            address: json['address'], 
            city: json['city'], 
            city_id: json['city_id'], 
            country_id: json['country_id'], 
            latitude: json['latitude'], 
            locality: json['locality'], 
            locality_verbose: json['locality_verbose'], 
            longitude: json['longitude'], 
            zipcode: json['zipcode'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['city_id'] = this.city_id;
        data['country_id'] = this.country_id;
        data['latitude'] = this.latitude;
        data['locality'] = this.locality;
        data['locality_verbose'] = this.locality_verbose;
        data['longitude'] = this.longitude;
        data['zipcode'] = this.zipcode;
        return data;
    }
}