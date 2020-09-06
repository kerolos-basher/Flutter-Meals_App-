import 'package:flutter/material.dart';
import '../dummt_data.dart';

// ignore: must_be_immutable
class MealDetails extends StatelessWidget {
  static const rootNameForDetailsScreen = '/Meal_detail';
  final Function toggleFavouriItem;
  final Function isFavourits;

  MealDetails(this.toggleFavouriItem, this.isFavourits);

  Widget buidwidget(BuildContext context, String name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: (AppBar(
        title: Text('${selectedMeal.title}'),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buidwidget(context, 'Ingradients'),
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).primaryColorDark,
                        child: Center(
                          child: Text(
                            selectedMeal.ingredients[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length),
            ),
            buidwidget(context, 'Steps'),
            Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('-${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ]),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourits(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavouriItem(mealid),
        //   Navigator.of(context).pop(mealid);//نقدر نرجع للصفحة السابقة محملينها بمعلومات
      ),
    );
  }
}
