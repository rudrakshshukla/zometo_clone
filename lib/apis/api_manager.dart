import 'package:dio/dio.dart';
import 'package:zometo_clone/ui/restorentsList/model/sqlmodel/res_restorent_list.dart';
import 'api_service.dart';
import 'error_model.dart';

 class ApiManager {
  final ApiService _apiService = ApiService();

  Future<res_restorent_list> getZometoData
      (
      int _entityId,
      String _entityType,
      int _start,
      int _count,
      int _collectionId,
      ) async {
    try {
      final response = await _apiService.get(
        'search',
        params: {
          'entity_id': _entityId,
          'entity_type': _entityType,
          'start': _start,
          'count': _count,
          'collection_id': _collectionId,
        },
      );
      return res_restorent_list.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorModel.fromJson(error.response.data);
    }
  }
}
