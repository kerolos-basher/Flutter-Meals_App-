import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item_design.dart';
class Favourits extends StatelessWidget {
  final List<Meal> favouritfroMain ;
  Favourits(this.favouritfroMain);
  @override
  Widget build(BuildContext context) {
    
       if(favouritfroMain.isEmpty)
       {
       return  Center(
             child: Text('you havno favourits'),
           );
        
      
       }else{

          return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favouritfroMain[index].id,
              title: favouritfroMain[index].title,
              imageUrl: favouritfroMain[index].imageUrl,
              duration: favouritfroMain[index].duration,
              complexity: favouritfroMain[index].complexity,
              affordability: favouritfroMain[index].affordability,
             );
        },
        itemCount: favouritfroMain.length,
        
        );
       }
  }
}