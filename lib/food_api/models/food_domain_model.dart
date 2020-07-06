import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FoodDomainModel extends Equatable {
  final String name;
  final String image;
  final String desc;

  FoodDomainModel({@required this.name, @required this.image, @required this.desc});

  @override
  List<Object> get props => [name,image,desc];

}