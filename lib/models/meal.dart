import 'package:flutter/cupertino.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}
enum Affordability{
  Affordable , //بأسعار معقولة، ميسور، متناول اليد
  Pricey,     //غالى - ثمين
  Luxurious //فاخر -باهظ الثمن
}

class Meal{
  final String id;
  final List<String> categories;
  final String title ;
  final String imageUrl;
  final List<String> ingredients;  //مكونات
  final List<String> steps ;
  final int duration ;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree ; //خالي من الغلوتين
  final bool isLactoseFree; 
  final bool isVegan; //نباتى
  final bool isVegetarian; 
  const Meal({@required this.id ,@required this.title ,@required this.affordability 
   ,@required this.categories ,@required this.complexity ,
  @required this.duration ,@required this.imageUrl ,@required this.ingredients ,
  @required this.isGlutenFree,@required this.isLactoseFree,@required this.isVegan,
  @required this.isVegetarian,@required this.steps});
}
