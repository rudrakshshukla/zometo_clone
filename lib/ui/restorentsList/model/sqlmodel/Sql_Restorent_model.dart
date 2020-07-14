// ClientModel.dart
import 'dart:convert';

SqlRestorentModel clientFromJson(String str) {
  final jsonData = json.decode(str);
  return SqlRestorentModel.fromMap(jsonData);
}

String clientToJson(SqlRestorentModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class SqlRestorentModel {
  int id;
  String restorentName;
  String restorentThumbnail;
  String restorentTimings;
  String restorentAddress;
  double restorentRating;
  String restorentPhone;

  String restorentPhotos;


  SqlRestorentModel({
    this.id,
    this.restorentName,
    this.restorentThumbnail,
    this.restorentTimings,
    this.restorentAddress,
    this.restorentRating,
    this.restorentPhone,
    this.restorentPhotos
  });




  factory SqlRestorentModel.fromMap(Map<String, dynamic> json) => new SqlRestorentModel(
      id: json["id"],
      restorentName: json["restorent_name"],
      restorentThumbnail: json["restorent_thumbnail"],
      restorentTimings: json["restorent_timings"],
      restorentAddress: json["restorent_address"],
      restorentPhone: json["restorent_phone"],
      restorentPhotos: json["restorent_photosUrl"],
      restorentRating:json["restorent_rating"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "restorent_name":restorentName,
    "restorent_thumbnail":restorentThumbnail,
    "restorent_timings":restorentTimings,
    "restorent_address":restorentAddress,
    "restorent_phone":restorentPhone,
    "restorent_photosUrl":restorentPhotos,
    "restorent_rating":restorentRating


  };
}