import 'AllReviews.dart';
import 'Location.dart';
import 'R.dart';
import 'UserRating.dart';


class RestaurantX {
    AllReviews all_reviews;
    int all_reviews_count;
    String apikey;
    int average_cost_for_two;
    String book_again_url;
    String book_form_web_view_url;
    String cuisines;
    String currency;
    String deeplink;
    List<String> establishment;
    String events_url;
    String featured_image;
    int has_online_delivery;
    int has_table_booking;
    List<String> highlights;
    int id;
    bool include_bogo_offers;
    int is_book_form_web_view;
    int is_delivering_now;
    int is_table_reservation_supported;
    int is_zomato_book_res;
    Location location;
    String menu_url;
    String mezzo_provider;
    String name;
    List<Object> offers;
    int opentable_support;
    String phone_numbers;
    int photo_count;
    String photos_url;
    int price_range;
    R r;
    String store_type;
    int switch_to_order_menu;
    String thumb;
    String timings;
    String url;
    UserRating user_rating;

    RestaurantX({this.all_reviews, this.all_reviews_count, this.apikey, this.average_cost_for_two, this.book_again_url, this.book_form_web_view_url, this.cuisines, this.currency, this.deeplink, this.establishment, this.events_url, this.featured_image, this.has_online_delivery, this.has_table_booking, this.highlights, this.id, this.include_bogo_offers, this.is_book_form_web_view, this.is_delivering_now, this.is_table_reservation_supported, this.is_zomato_book_res, this.location, this.menu_url, this.mezzo_provider, this.name, this.offers, this.opentable_support, this.phone_numbers, this.photo_count, this.photos_url, this.price_range, this.r, this.store_type, this.switch_to_order_menu, this.thumb, this.timings, this.url, this.user_rating});

    factory RestaurantX.fromJson(Map<String, dynamic> json) {
        return RestaurantX(
            all_reviews: json['all_reviews'] != null ? AllReviews.fromJson(json['all_reviews']) : null, 
            all_reviews_count: json['all_reviews_count'], 
            apikey: json['apikey'], 
            average_cost_for_two: json['average_cost_for_two'], 
            book_again_url: json['book_again_url'], 
            book_form_web_view_url: json['book_form_web_view_url'], 
            cuisines: json['cuisines'], 
            currency: json['currency'], 
            deeplink: json['deeplink'], 
            establishment: json['establishment'] != null ? new List<String>.from(json['establishment']) : null, 
            events_url: json['events_url'], 
            featured_image: json['featured_image'], 
            has_online_delivery: json['has_online_delivery'], 
            has_table_booking: json['has_table_booking'], 
            highlights: json['highlights'] != null ? new List<String>.from(json['highlights']) : null, 
            id: json['id'], 
            include_bogo_offers: json['include_bogo_offers'], 
            is_book_form_web_view: json['is_book_form_web_view'], 
            is_delivering_now: json['is_delivering_now'], 
            is_table_reservation_supported: json['is_table_reservation_supported'], 
            is_zomato_book_res: json['is_zomato_book_res'], 
            location: json['location'] != null ? Location.fromJson(json['location']) : null, 
            menu_url: json['menu_url'], 
            mezzo_provider: json['mezzo_provider'], 
            name: json['name'], 
            offers: json['offers'] ,
            opentable_support: json['opentable_support'], 
            phone_numbers: json['phone_numbers'], 
            photo_count: json['photo_count'], 
            photos_url: json['photos_url'], 
            price_range: json['price_range'], 
            r: json['r'] != null ? R.fromJson(json['r']) : null, 
            store_type: json['store_type'], 
            switch_to_order_menu: json['switch_to_order_menu'], 
            thumb: json['thumb'], 
            timings: json['timings'], 
            url: json['url'], 
            user_rating: json['user_rating'] != null ? UserRating.fromJson(json['user_rating']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['all_reviews_count'] = this.all_reviews_count;
        data['apikey'] = this.apikey;
        data['average_cost_for_two'] = this.average_cost_for_two;
        data['book_again_url'] = this.book_again_url;
        data['book_form_web_view_url'] = this.book_form_web_view_url;
        data['cuisines'] = this.cuisines;
        data['currency'] = this.currency;
        data['deeplink'] = this.deeplink;
        data['events_url'] = this.events_url;
        data['featured_image'] = this.featured_image;
        data['has_online_delivery'] = this.has_online_delivery;
        data['has_table_booking'] = this.has_table_booking;
        data['id'] = this.id;
        data['include_bogo_offers'] = this.include_bogo_offers;
        data['is_book_form_web_view'] = this.is_book_form_web_view;
        data['is_delivering_now'] = this.is_delivering_now;
        data['is_table_reservation_supported'] = this.is_table_reservation_supported;
        data['is_zomato_book_res'] = this.is_zomato_book_res;
        data['menu_url'] = this.menu_url;
        data['mezzo_provider'] = this.mezzo_provider;
        data['name'] = this.name;
        data['opentable_support'] = this.opentable_support;
        data['phone_numbers'] = this.phone_numbers;
        data['photo_count'] = this.photo_count;
        data['photos_url'] = this.photos_url;
        data['price_range'] = this.price_range;
        data['store_type'] = this.store_type;
        data['switch_to_order_menu'] = this.switch_to_order_menu;
        data['thumb'] = this.thumb;
        data['timings'] = this.timings;
        data['url'] = this.url;
        if (this.all_reviews != null) {
            data['all_reviews'] = this.all_reviews.toJson();
        }
        if (this.establishment != null) {
            data['establishment'] = this.establishment;
        }
        if (this.highlights != null) {
            data['highlights'] = this.highlights;
        }
        if (this.location != null) {
            data['location'] = this.location.toJson();
        }
        data['offers'] = this.offers;

        if (this.r != null) {
            data['r'] = this.r.toJson();
        }
        if (this.user_rating != null) {
            data['user_rating'] = this.user_rating.toJson();
        }
        return data;
    }
}