import 'package:foodrecipes/food_api/models/food_domain_model.dart';

abstract class FoodRepository {
  Future<List<FoodDomainModel>> getListFoods();

  void onCancelRequest();
}