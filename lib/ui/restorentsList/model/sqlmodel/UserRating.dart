import 'RatingObj.dart';


class UserRating {
    String aggregate_rating;
    String rating_color;
    RatingObj rating_obj;
    String rating_text;
    int votes;

    UserRating({this.aggregate_rating, this.rating_color, this.rating_obj, this.rating_text, this.votes});

    factory UserRating.fromJson(Map<String, dynamic> json) {
        return UserRating(
            aggregate_rating: json['aggregate_rating'], 
            rating_color: json['rating_color'], 
            rating_obj: json['rating_obj'] != null ? RatingObj.fromJson(json['rating_obj']) : null, 
            rating_text: json['rating_text'], 
            votes: json['votes'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aggregate_rating'] = this.aggregate_rating;
        data['rating_color'] = this.rating_color;
        data['rating_text'] = this.rating_text;
        data['votes'] = this.votes;
        if (this.rating_obj != null) {
            data['rating_obj'] = this.rating_obj.toJson();
        }
        return data;
    }
}