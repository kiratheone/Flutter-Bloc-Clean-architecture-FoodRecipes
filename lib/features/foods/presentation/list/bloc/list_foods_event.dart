import 'package:equatable/equatable.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';

class ListFoodsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnAppear extends ListFoodsEvent{}
class OnLoaded extends ListFoodsEvent{
  final List<FoodDomainModel> listItem;
  OnLoaded(this.listItem);

  @override
  List<Object> get props => [listItem];
}

