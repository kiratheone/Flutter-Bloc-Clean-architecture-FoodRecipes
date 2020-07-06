import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodrecipes/features/foods/data/datasource/food_data_source.dart';
import 'package:foodrecipes/features/foods/data/models/food_model.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';
import 'package:foodrecipes/food_api/repository/FoodRepository.dart';

class FoodRepositoryImpl extends FoodRepository {
  final FoodDataSource _dataSource;

  FoodRepositoryImpl(this._dataSource);

  @override
  Future<List<FoodDomainModel>> getListFoods() async {
    try {
      return _dataSource.apiFoodList()
          .then((value) => jsonDecode(value.data))
          .then((value) =>
          (value as List).map((item) => FoodModel.fromJson(item)).toList());
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  @override
  void onCancelRequest() => _dataSource.cancelRequest();

}
