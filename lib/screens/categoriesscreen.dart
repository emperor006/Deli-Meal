import 'package:flutter/material.dart';

import 'package:navigationproject/data/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Deli Meal'),), 
      body: GridView(
        padding:const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(e.color, e.title,e.id))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}