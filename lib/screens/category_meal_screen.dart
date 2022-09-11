import 'package:flutter/material.dart';
import 'package:navigationproject/models/meals.dart';
import 'package:navigationproject/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  //const CategoryMealScreen({Key? key}) : super(key: key);

  // final String categoryId, categoryTitle;

  //  CategoryMealScreen(this.categoryId,this.categoryTitle);

  static const CategoryScreen = '/catergory-meal';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> selectedMeal = [];
  String? categoryTitle;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    //The id of the category of meals on the home screen
    final id = routeArgs['id'];

    selectedMeal = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(id);
    }).toList();

    super.didChangeDependencies();
  }


  void deleteItem(String id) {
    setState(() {
          selectedMeal.removeWhere((element) => element.id == id);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            //return Text(selectedMeal[index].title);
            return MealItem(
              id: selectedMeal[index].id,
              affordability: selectedMeal[index].affordability,
              complexity: selectedMeal[index].complexity,
              duration: selectedMeal[index].duration,
              imageUrl: selectedMeal[index].imageUrl,
              title: selectedMeal[index].title,
              function: deleteItem,
            );
          },
          itemCount: selectedMeal.length,
        ));
  }
}
