import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color coloor;

  CategoryItem(this.id,this.title, this.coloor);

void selectCategory(BuildContext ctx)
{
  Navigator.of(ctx).pushNamed(  CategoryMealsScreen.mealsreen ,arguments:{ 'id':id,'title':title}
    //MaterialPageRoute(builder: (_)
   // {
   //   return CategoryItemScreen(id,title);
   // }
    // )
     );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: EdgeInsets.all(15),
        // ignore: deprecated_member_use
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [coloor.withOpacity(0.7), coloor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
