import '../models/meal.dart';
import 'package:flutter/material.dart';
import '../screens/favourits.dart';
import './Categories_screen.dart';
import '../widget/drawer_page.dart';

// ignore: must_be_immutable
class Bottontab extends StatefulWidget {

 final List<Meal> favouritfroMain ;
  Bottontab(this.favouritfroMain);
  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<Bottontab> {

  List <Map<String,Object>> _pages;
@override
  void initState() {
    _pages =
   [
     {'page':CategoriesScreen() ,'title':'Categories'}, 
      {'page':Favourits(widget.favouritfroMain) ,'title':'Your Favourits'}];
    super.initState();
  }
  var _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: DrawerPage(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white, 
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,//animation
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star), title: Text('Favourits')),
          ],
        ),
      ),
    );
  }
}
