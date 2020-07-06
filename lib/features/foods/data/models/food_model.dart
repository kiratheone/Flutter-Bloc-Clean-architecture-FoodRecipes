
import 'package:flutter/material.dart';
import 'package:foodrecipes/food_api/models/food_domain_model.dart';

class FoodModel extends FoodDomainModel {
  FoodModel(
      {@required String name, @required String image, @required String desc})
      : super(name: name, image: image, desc: desc);

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(name: json['name'], image: json['image'], desc: json['desc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['desc'] = this.desc;
    return data;
  }
}
