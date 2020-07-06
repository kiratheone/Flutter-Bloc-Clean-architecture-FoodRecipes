import 'package:foodrecipes/core/network/network.dart';
import 'package:foodrecipes/features/foods/data/datasource/food_data_source.dart';
import 'package:foodrecipes/features/foods/data/repository/FoodRepositoryImpl.dart';
import 'package:foodrecipes/features/foods/domain/usecases/get_list_foods_usecase.dart';
import 'package:foodrecipes/food_api/repository/FoodRepository.dart';
import 'package:injectorio/injectorio.dart';

class AppModule extends Module {

  AppModule(){
    // ignore: unnecessary_cast
   single(FoodDataSourceImpl(Network.dioClient()) as FoodDataSource);
   // ignore: unnecessary_cast
   single(FoodRepositoryImpl(inject()) as FoodRepository);
   single(GetListFoodsUseCase(inject()));
  }
}