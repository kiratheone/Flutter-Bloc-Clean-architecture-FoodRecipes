import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodrecipes/core/domain/usecase.dart';
import 'package:foodrecipes/features/foods/domain/usecases/get_list_foods_usecase.dart';
import 'package:foodrecipes/features/foods/presentation/list/bloc/bloc.dart';

class ListFoodBloc extends Bloc<ListFoodsEvent, ListFoodsState> {
  final GetListFoodsUseCase _getListFoodsUseCase;

  ListFoodBloc(this._getListFoodsUseCase) : super(Idle());

  @override
  Stream<ListFoodsState> mapEventToState(ListFoodsEvent event) async* {
    if (event is OnAppear) {
      yield Loading();
      yield* _getListFoodsUseCase
          .call(NoParams())
          // ignore: unnecessary_cast
          .then((value) => Loaded(value) as ListFoodsState)
          .catchError((e) => Future.value(FailedToLoad(e.toString()))).asStream();
    }
  }




}
