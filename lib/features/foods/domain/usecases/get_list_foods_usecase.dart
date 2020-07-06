import 'package:foodrecipes/core/domain/usecase.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';
import 'package:foodrecipes/food_api/repository/FoodRepository.dart';

class GetListFoodsUseCase extends UseCase<List<FoodDomainModel>, NoParams> {
  final FoodRepository _repository;

  GetListFoodsUseCase(this._repository);

  @override
  Future<List<FoodDomainModel>> call(NoParams params) {
    return _repository.getListFoods();
  }

  @override
  void onDispose() => _repository.onCancelRequest();
}
