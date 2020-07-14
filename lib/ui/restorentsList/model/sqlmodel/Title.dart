
class Title {
    String text;

    Title({this.text});

    factory Title.fromJson(Map<String, dynamic> json) {
        return Title(
            text: json['text'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['text'] = this.text;
        return data;
    }
}