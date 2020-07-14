
import 'RestaurantX.dart';

class Restaurant {
    RestaurantX restaurant;

    Restaurant({this.restaurant});

    factory Restaurant.fromJson(Map<String, dynamic> json) {
        return Restaurant(
            restaurant: json['restaurant'] != null ? RestaurantX.fromJson(json['restaurant']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.restaurant != null) {
            data['restaurant'] = this.restaurant.toJson();
        }
        return data;
    }
}