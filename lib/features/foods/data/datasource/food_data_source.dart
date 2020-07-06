import 'package:dio/dio.dart';

abstract class FoodDataSource {
  Future<Response<String>> apiFoodList();

  void cancelRequest();
}

class FoodDataSourceImpl extends FoodDataSource {
  final String _url = "http://192.227.240.179:7000/foods";
  final Dio _client;
  final CancelToken _token = CancelToken();
  FoodDataSourceImpl(this._client);

  @override
  Future<Response<String>> apiFoodList() => _client.get(_url, cancelToken: _token);

  @override
  void cancelRequest() {
    _token.cancel();
  }

}