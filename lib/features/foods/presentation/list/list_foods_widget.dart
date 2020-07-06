import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodrecipes/features/foods/presentation/detail/detail_food_widget.dart';
import 'package:foodrecipes/features/foods/presentation/list/bloc/bloc.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';
import 'package:injectorio/injectorio.dart';

class ListFoodsWidget extends StatefulWidget {
  @override
  _ListFoodsWidgetState createState() => _ListFoodsWidgetState();
}

class _ListFoodsWidgetState extends State<ListFoodsWidget> {

  ListFoodBloc _bloc;

  @override
  void initState() {
    _bloc = ListFoodBloc(get());
    WidgetsBinding.instance.addPostFrameCallback((_)=>_bloc.add(OnAppear()));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void goToDetail(FoodDomainModel food) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailFoodWidget(
            food: food,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: content(context),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Food Recipes"),
    );
  }

  Widget content(BuildContext context) {
    return SafeArea(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is Loading) {
            return loading();
          }

          if (state is Loaded) {
            return listFoods(context, state.listItem);
          }

          if (state is FailedToLoad) {
            return onError(state.error);
          }

          return blank();
        },
      ),
    );
  }

  Widget listFoods(BuildContext context, List<FoodDomainModel> data) {
    return Center(
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: data.map((food) => itemFood(context, food)).toList()),
    );
  }

  Widget itemFood(BuildContext context, FoodDomainModel food) {
    print("food name ->> ${food.name}");
    print("food image ->> ${food.image}");
    return GestureDetector(
      onTap: () => goToDetail(food),
      child: GridTile(
        child: Hero(
          tag: food.name,
          child: Image.network(
            food.image,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(food.name),
        ),
      ),
    );
  }

  Widget onError(String msg) => Center(child: Text(msg, textAlign: TextAlign.center));

  Widget blank() => Container();

  Widget loading() => Center(child: CircularProgressIndicator());

}
