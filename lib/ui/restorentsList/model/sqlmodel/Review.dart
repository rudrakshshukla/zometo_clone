
class Review {
    List<Object> review;

    Review({this.review});

    factory Review.fromJson(Map<String, dynamic> json) {
        return Review(
            review: json['review'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.review != null) {
            data['review'] = this.review;
        }
        return data;
    }
}