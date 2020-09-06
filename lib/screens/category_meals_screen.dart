// ignore: unused_import
import 'package:DeleiMeale_App/models/categories.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item_design.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const mealsreen = '/categoty-item';
  final List<Meal> filterdListMeal;

  CategoryMealsScreen(this.filterdListMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categorytitle;
  List<Meal> displayedMeals;
  bool shangedcompletr = false;

  @override
 // void _removeMel(String mealid) {
 //   setState(() {
    //  displayedMeals.removeWhere((element) => element.id == mealid);
 //   });
 // }

  @override
  Widget build(BuildContext context) {
    if (!shangedcompletr) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = routArgs['id'];
      categorytitle = routArgs['title'];
      displayedMeals = widget.filterdListMeal.where((meals) {
        return meals.categories.contains(id);
      }).toList();
      shangedcompletr = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability
              //deletMeal: _removeMel
              );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
