
class HasMenuStatus {
    int delivery;
    int takeaway;

    HasMenuStatus({this.delivery, this.takeaway});

    factory HasMenuStatus.fromJson(Map<String, dynamic> json) {
        return HasMenuStatus(
            delivery: json['delivery'], 
            takeaway: json['takeaway'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['delivery'] = this.delivery;
        data['takeaway'] = this.takeaway;
        return data;
    }
}