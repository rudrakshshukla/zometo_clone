import 'Review.dart';


class AllReviews {
    List<Review> reviews;

    AllReviews({this.reviews});

    factory AllReviews.fromJson(Map<String, dynamic> json) {
        return AllReviews(
            reviews: json['reviews'] != null ? (json['reviews'] as List).map((i) => Review.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.reviews != null) {
            data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
        }
        return data;
    }
}