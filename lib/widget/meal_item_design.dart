// ignore: unused_import
import 'dart:developer';
import '../models/meal.dart';
import 'package:flutter/material.dart';
import '../screens/Meal_Detail_Screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function deletMeal;
  MealItem(
      {@required this.id,
      @required this.title,
      @required this.duration,
      @required this.affordability,
      @required this.complexity,
      @required this.imageUrl
      //@required this.deletMeal
      });
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetails.rootNameForDetailsScreen, arguments: id)
        .then((value) => {
              if (value != null) {
                //deletMeal(value)
                }
            });
  }

  String get complextyText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Chalanging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Un Known';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricy';
        break;
      default:
        return 'Un Known';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  //علشان اجبر الصورة انها تبقى بوردر رايديس
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    // لو المتغيير عندى داخل ملف الاسيتس Image.asset(name),
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit // علشان اقص الصورة على قد الكونتانير بتعاها
                        .cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    color: Colors.black54,
                    width: 280,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap:
                          true, // علشان الحجم ياخد حجم الكونتينر فقط  ولو كان طويل هيختفى
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(
                          '$duration min') // Text('${duration} min') عندما يكون عنصر واحد يمكن الاستغناء عن الاقواس
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(
                          complextyText) // Text('${duration} min') عندما يكون عنصر واحد يمكن الاستغناء عن الاقواس
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(
                          affordabilityText) // Text('${duration} min') عندما يكون عنصر واحد يمكن الاستغناء عن الاقواس
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
