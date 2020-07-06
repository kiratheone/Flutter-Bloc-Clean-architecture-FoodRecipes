import 'package:equatable/equatable.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);

  void onDispose();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
