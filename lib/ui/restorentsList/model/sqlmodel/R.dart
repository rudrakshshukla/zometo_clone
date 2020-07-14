
import 'HasMenuStatus.dart';

class R {
    HasMenuStatus has_menu_status;
    bool is_grocery_store;
    int res_id;

    R({this.has_menu_status, this.is_grocery_store, this.res_id});

    factory R.fromJson(Map<String, dynamic> json) {
        return R(
            has_menu_status: json['has_menu_status'] ,
            is_grocery_store: json['is_grocery_store'], 
            res_id: json['res_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['is_grocery_store'] = this.is_grocery_store;
        data['res_id'] = this.res_id;
        if (this.has_menu_status != null) {
            data['has_menu_status'] = this.has_menu_status.toJson();
        }
        return data;
    }
}