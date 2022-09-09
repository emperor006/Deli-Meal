import 'package:flutter/material.dart';
import 'package:navigationproject/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  //const CategoryMealScreen({Key? key}) : super(key: key);

  // final String categoryId, categoryTitle;

  //  CategoryMealScreen(this.categoryId,this.categoryTitle);
  static const CategoryScreen = '/catergory-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    //The id of the category of meals on the home screen
    final id = routeArgs['id'];

    final selectedMeal = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            //return Text(selectedMeal[index].title);
            return MealItem(
              id: selectedMeal[index].id ,
              affordability: selectedMeal[index].affordability,
              complexity: selectedMeal[index].complexity,
              duration: selectedMeal[index].duration,
              imageUrl: selectedMeal[index].imageUrl,
              title: selectedMeal[index].title,
            );
          },
          itemCount: selectedMeal.length,
        ));
  }
}
