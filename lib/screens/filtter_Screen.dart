import 'package:flutter/material.dart';
import '../widget/drawer_page.dart';


class FillterScreen extends StatefulWidget {
  static const rootName = '/FiltterScreen';
   final Function savefilteronMain;
   final Map<String,bool> currntFilters;
  FillterScreen(this.currntFilters,this.savefilteronMain);

  @override
  _FillterScreenState createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {

  bool isGlutenFree =false;
  bool isLactoseFree=false;
  bool isVegan=false;
  bool isVegetarian=false;
 @override
  void initState() {
   isGlutenFree = widget.currntFilters['gluten'];
   isLactoseFree = widget.currntFilters['lactos'];
   isVegan = widget.currntFilters['vegen'];
   isVegetarian = widget.currntFilters['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed:(){
            final selectedfilters ={
               'gluten':isGlutenFree,
               'lactos':isLactoseFree,
             'vegen':isVegan,
             'vegetarian':isVegetarian
            };
           widget.savefilteronMain(selectedfilters);
           
           }
           )
        ],
      ),
      drawer: DrawerPage(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('Only Contains Gluten Free Meals'),
                  value: isGlutenFree,
                  onChanged: (newvalue) {
                    setState(() {
                      isGlutenFree = newvalue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  subtitle: Text('Only Contains Lactose Free Meals'),
                  value: isLactoseFree,
                  onChanged: (newvalue) {
                    setState(() {
                      isLactoseFree = newvalue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan-Free'),
                  subtitle: Text('Only Contains Vegan Free Meals'),
                  value: isVegan,
                  onChanged: (newvalue) {
                    setState(() {
                      isVegan = newvalue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian-Free'),
                  subtitle: Text('Only Vontains Vegetarian Free Meals'),
                  value: isVegetarian,
                  onChanged: (newvalue) {
                    setState(() {
                      isVegetarian = newvalue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
