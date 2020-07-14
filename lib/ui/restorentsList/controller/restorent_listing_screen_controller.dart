import 'package:flutter/cupertino.dart';
import 'package:zometo_clone/apis/api_manager.dart';
import 'package:zometo_clone/ui/restorentsList/model/sqlmodel/Sql_Restorent_model.dart';
import 'package:zometo_clone/utils/consts/pref_constant.dart';
import 'package:zometo_clone/utils/pref_meneger_utils.dart';
import 'package:zometo_clone/utils/progress_dialog_utils.dart';
import 'package:zometo_clone/utils/sql_manager.dart';

class RestorentListingScreenController{


  Future<List<SqlRestorentModel>>  getDataFromApi(BuildContext context) async {
    try{
      List<SqlRestorentModel> returnList=[];
      var result=await ApiManager().getZometoData(280, "city", 0, 10, 1);
      for(var resto in result.restaurants){
        var restorent=SqlRestorentModel(id: resto.restaurant.id,restorentName: resto.restaurant.name,restorentThumbnail: resto.restaurant.featured_image
        ,restorentTimings: resto.restaurant.timings,restorentAddress: resto.restaurant.location.address,restorentRating: double.parse(resto.restaurant.user_rating.aggregate_rating)
        ,restorentPhotos: resto.restaurant.photos_url,restorentPhone: resto.restaurant.phone_numbers);
        returnList.add(restorent);
        await SqlManager.db.insertNewRestro(restorent);
      }
      var pref=await PreferenceUtils.getInstance();
      pref.putBool(isUserFirstTime,true);
      return returnList;




    }catch(e)
    {
      print(e);
    }
  }


  Future<List<SqlRestorentModel>> getAllRecords(BuildContext context,String startFrom,String till) async {
    try{
      var result=await SqlManager.db.getRestorent(startFrom,till);
      return result;
    }catch(e)
    {
      print(e);
    }
  }
  
}