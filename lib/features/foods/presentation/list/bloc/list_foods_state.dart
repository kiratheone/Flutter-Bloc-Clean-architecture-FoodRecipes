import 'package:equatable/equatable.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';

class ListFoodsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Idle extends ListFoodsState {}
class Loading extends ListFoodsState {}

class Loaded extends ListFoodsState {
  final List<FoodDomainModel> listItem;

  Loaded(this.listItem);

  @override
  List<Object> get props => super.props;
}

class FailedToLoad extends ListFoodsState {
  final String error;

  FailedToLoad(this.error);

  @override
  List<Object> get props => [error];
}