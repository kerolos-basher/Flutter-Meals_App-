import '../dummt_data.dart';
import 'package:flutter/material.dart';
import '../widget/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
      padding: EdgeInsets.all(25),
      children: DUMY_DATA
          .map((catdata) => CategoryItem(catdata.id,catdata.title, catdata.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ),
    );
  }
}
