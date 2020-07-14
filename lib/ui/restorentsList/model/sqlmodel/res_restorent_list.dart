import 'Restaurant.dart';


class res_restorent_list {
    List<Restaurant> restaurants;
    int results_found;
    int results_shown;
    int results_start;

    res_restorent_list({this.restaurants, this.results_found, this.results_shown, this.results_start});

    factory res_restorent_list.fromJson(Map<String, dynamic> json) {
        return res_restorent_list(
            restaurants: json['restaurants'] != null ? (json['restaurants'] as List).map((i) => Restaurant.fromJson(i)).toList() : null, 
            results_found: json['results_found'], 
            results_shown: json['results_shown'], 
            results_start: json['results_start'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['results_found'] = this.results_found;
        data['results_shown'] = this.results_shown;
        data['results_start'] = this.results_start;
        if (this.restaurants != null) {
            data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
        }
        return data;
    }
}