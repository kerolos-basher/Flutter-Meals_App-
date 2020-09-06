import 'package:flutter/material.dart';
import '../screens/favourits.dart';
import './Categories_screen.dart';
import '../models/meal.dart';
// ignore: must_be_immutable
class TabScreens extends StatefulWidget {
   List<Meal> favouritfroMain ;
   TabScreens(this.favouritfroMain);
  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourits',
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen() , Favourits(widget.favouritfroMain),
        ],),
      ),
    );
  }
}
