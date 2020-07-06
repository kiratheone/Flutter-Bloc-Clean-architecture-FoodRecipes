import 'package:flutter/material.dart';
import 'package:foodrecipes/features/foods/presentation/list/list_foods_widget.dart';
import 'package:injectorio/injectorio.dart';
import 'features/foods/di/AppModule.dart';

void main() {
  InjectorIO.start(mode: InjectorMode.DEBUG)
      .module(AppModule());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListFoodsWidget(),
    );
  }
}

