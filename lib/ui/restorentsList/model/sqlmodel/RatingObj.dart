import 'BgColor.dart';
import 'Title.dart';


class RatingObj {
    BgColor bg_color;
    Title title;

    RatingObj({this.bg_color, this.title});

    factory RatingObj.fromJson(Map<String, dynamic> json) {
        return RatingObj(
            bg_color: json['bg_color'] != null ? BgColor.fromJson(json['bg_color']) : null, 
            title: json['title'] != null ? Title.fromJson(json['title']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.bg_color != null) {
            data['bg_color'] = this.bg_color.toJson();
        }
        if (this.title != null) {
            data['title'] = this.title.toJson();
        }
        return data;
    }
}