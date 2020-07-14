
class BgColor {
    String tint;
    String type;

    BgColor({this.tint, this.type});

    factory BgColor.fromJson(Map<String, dynamic> json) {
        return BgColor(
            tint: json['tint'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['tint'] = this.tint;
        data['type'] = this.type;
        return data;
    }
}