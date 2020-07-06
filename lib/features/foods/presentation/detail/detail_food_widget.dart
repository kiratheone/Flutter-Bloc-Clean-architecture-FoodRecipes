import 'package:flutter/material.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';

class DetailFoodWidget extends StatefulWidget {
  final FoodDomainModel food;

  const DetailFoodWidget({Key key, this.food}) : super(key: key);
  @override
  _DetailFoodWidgetState createState() => _DetailFoodWidgetState();
}

class _DetailFoodWidgetState extends State<DetailFoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: content(),
    );
  }

  Widget appBar() => AppBar(title: Text("Food Detail"));

  Widget content() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              foodImage(),
              foodTitle(),
              foodLabel(),
              foodDesc()
            ],
          ),
        ),
      ),
    );
  }

  Widget foodImage() {
    return Center(
      child: Hero(
        tag: widget.food.name,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(widget.food.image),
        ),
      ),
    );
  }

  Widget foodTitle() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Text(
          widget.food.name,
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget foodLabel() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        "How to : ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget foodDesc() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: Center(
          child: Text(widget.food.desc)),
    );
  }
}
