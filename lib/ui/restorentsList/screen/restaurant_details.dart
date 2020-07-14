import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zometo_clone/ui/restorentsList/model/sqlmodel/Sql_Restorent_model.dart';
import 'package:zometo_clone/ui/restorentsList/screen/more_photo_details.dart';

class RestaurantDetails extends StatefulWidget {
  SqlRestorentModel item;

  RestaurantDetails({this.item});
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MorePhotoDetails(photoUrls: widget.item.restorentPhotos,restorentnName: widget.item.restorentName,)));
                },
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.item.restorentThumbnail,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Image.asset(
                            "assets/images/img.png"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.item.restorentName,style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(widget.item.restorentPhone,style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,bottom: 16.0),
                  child: Row(
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          color: i<widget.item.restorentRating?Color(0xffebc634):Colors.grey,
                          size: 18.0,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "( ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "1000",
                            style: TextStyle(
                              color: Color(0xff34ebc3),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " Reviews ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ")",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ])),
                      )
                    ],
                  ),
                ),
                _getRestaurantInfo("Timing"),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _getRestaurantInfo("Address"),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _getRestaurantInfo(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title=="Timing"?widget.item.restorentTimings:widget.item.restorentAddress,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      );
}
