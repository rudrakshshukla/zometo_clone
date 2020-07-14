import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zometo_clone/ui/restorentsList/controller/restorent_listing_screen_controller.dart';
import 'package:zometo_clone/ui/restorentsList/model/sqlmodel/Sql_Restorent_model.dart';
import 'package:zometo_clone/ui/restorentsList/screen/restaurant_details.dart';
import 'package:zometo_clone/utils/consts/color_constant.dart';
import 'package:zometo_clone/utils/consts/pref_constant.dart';
import 'package:zometo_clone/utils/pref_meneger_utils.dart';
import 'package:zometo_clone/utils/progress_dialog_utils.dart';
class RestorentListing extends StatefulWidget {
  @override
  _RestorentListingState createState() => _RestorentListingState();
}

class _RestorentListingState extends State<RestorentListing> {

  List<SqlRestorentModel>  listItems=[];
  ScrollController _scrollController = new ScrollController();
  int previousIndex=0;
  int tillLastIndex=10;
  bool isLoding=false;



  void initState() {
    // TODO: implement initState
    super.initState();

    if (_scrollController.hasClients) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        new Future.delayed(Duration.zero, () {

          print("scroll");
        });
      }
    }


    _getData();
  }
  _getData() async{
    var pref=await PreferenceUtils.getInstance();
    var isFirstTime=pref.getBool(isUserFirstTime)==null?false:pref.getBool(isUserFirstTime);

    if(isFirstTime)
      {
        ProgressDialogUtils.showProgressDialog(context);
        isLoding=true;
        var result=await RestorentListingScreenController().getAllRecords(context,previousIndex.toString(),tillLastIndex.toString());
        previousIndex=tillLastIndex;
        tillLastIndex=tillLastIndex+10;
        ProgressDialogUtils.dismissProgressDialog();
        isLoding=false;

        setState(() {
          listItems=result;
        });

      }else{
      isLoding=true;

      ProgressDialogUtils.showProgressDialog(context);
      var result=await RestorentListingScreenController().getDataFromApi(context);
      ProgressDialogUtils.dismissProgressDialog();
      isLoding=false;

      setState(() {
        listItems=result;
      });


    }
  }

  _loadNextPage()
  async {
    if(!isLoding) {
      isLoding = true;
      ProgressDialogUtils.showProgressDialog(context);
      var result=await RestorentListingScreenController().getAllRecords(context,previousIndex.toString(),tillLastIndex.toString());
      previousIndex=tillLastIndex;
      tillLastIndex=tillLastIndex+10;
      ProgressDialogUtils.dismissProgressDialog();
      isLoding = false;

      var nextResult=listItems;

      result.forEach((model){
        nextResult.add(model);
      });
      ProgressDialogUtils.dismissProgressDialog();


      setState(() {
        listItems=nextResult;
      });

    }

      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Center(
          child: Text(
            "Back",
             style: TextStyle( color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 18.0,),
          ),
        ),
        centerTitle: true,
        title: Text("Restaurent list",style: TextStyle(color: Colors.white),),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrolllNotification) {
          if (scrolllNotification.metrics.pixels ==
              (scrolllNotification.metrics.maxScrollExtent)) {
                      _loadNextPage();



          }
        },

      child: listItems!=null?listItems.length==0?Container(
        child: Center(
          child: Text("No ad found"),
        ),
      ):
      Container(
        color: Colors.white,
        child: ListView.builder(
          controller:_scrollController ,
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          itemCount: listItems == null ? 0 : listItems.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => RestaurantDetails(item: listItems[index],)));
                },
              child: Container(
                  height: 108,
                  margin: EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width-24,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 92,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 8,
                                        ),
                                      ),
                                      child: listItems[index].restorentThumbnail == null
                                          ? Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.195,
                                        width: 100.0,
                                        child: InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/shop-pin.png"),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 5)
                                                ],
                                              ),
                                              child: Padding(
                                                  padding:
                                                  EdgeInsets.all(16),
                                                  child: Image.asset(
                                                     "assets/images/shop-pin.png")),
                                            )),
                                      )
                                          : Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.195,
                                        width: 100.0,
                                        child: InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 5)
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl: listItems[index].restorentThumbnail,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                         "assets/images/shop-pin.png"),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(4),
                            child: Column(
                              children: [
                                Container(
                                  height: 92,
                                  width: MediaQuery.of(context).size.width - 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listItems[index].restorentName,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          for (int i = 0; i < 5; i++)
                                            Icon(
                                              Icons.star,
                                              color: i<listItems[index].restorentRating?Color(0xffebc634):Colors.grey,
                                              size: 18.0,
                                            ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                BorderRadius.circular(5),

                              ),
                              width: 28,
                              height: 36,
                              padding: EdgeInsets.all(4),
                              alignment: Alignment.center, // This is needed
                              child: Image.asset(
                                
                               "assets/images/map.png",
                                fit: BoxFit.fitHeight,
                                height: 44,
                                width: 78,
                               ),
                               ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      )
                    ],
                  )),
            );

          },

        ),
      )
          :Container(

      ),
      ),


    );
  }
}
