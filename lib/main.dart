import 'package:DeleiMeale_App/dummt_data.dart';
import 'package:flutter/material.dart';
import 'screens/category_meals_screen.dart';
import './screens/Meal_Detail_Screen.dart';
import './screens/filtter_Screen.dart';

import './models/meal.dart';
import './screens/bottom_tab_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegen': false,
    'vegetarian': false
  };
  List<Meal> _avalableMeals = DUMMY_MEALS;
  List<Meal> _favouritsMeals = [];
 

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _avalableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegen'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
 void _toogleFavouritItems(String mealid) {
    final existanseindx = _favouritsMeals.indexWhere((meal) => meal.id == mealid);
    
    if (existanseindx >= 0) {
     setState(() {
        _favouritsMeals.removeAt(existanseindx);
     }); 
    } else {
      setState(() {
        _favouritsMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });   
    }
  }

  bool  _isFavourits(String mealId) {
    return _favouritsMeals.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealiMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //  home: CategoriesScreen(),
      routes: {
        '/': (ctx) => Bottontab(_favouritsMeals),
        CategoryMealsScreen.mealsreen: (ctx) =>
            CategoryMealsScreen(_avalableMeals),
        MealDetails.rootNameForDetailsScreen: (ctx) => MealDetails(_toogleFavouritItems,_isFavourits),
        FillterScreen.rootName: (ctx) => FillterScreen(_filters, _setFilters),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(_avalableMeals));
      },
    );
  }
}
