import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/mealdetail_screen.dart';
import './screens/tab_screen.dart';
import './models/meals.dart';
import './screens/category_meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'glutenFree': false,
    'veganFree': false,
    'lactoseFree': false,
    'vegetarianFree': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favoriteMealList = [];

  void updateFilters(Map<String, bool> filtered_data) {
    setState(() {
      _filters['glutenFree'] = filtered_data['glutenFree'] as bool;
      _filters['veganFree'] = filtered_data['veganFree'] as bool;
      _filters['vegetarianFree'] = filtered_data['vegetarianFree'] as bool;
      _filters['lactoseFree'] = filtered_data['lactoseFree'] as bool;

      availableMeals = DUMMY_MEALS.where((element) {
        if (filtered_data['glutenFree'] as bool && !element.isGlutenFree) {
          return false;
        }

        if (filtered_data['veganFree'] as bool && !element.isVegan) {
          return false;
        }

        if (filtered_data['lactoseFree'] as bool && !element.isLactoseFree) {
          return false;
        }

        if (filtered_data['vegetarianFree'] as bool && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

//checks if meal is already liked
  void addFavorites(String mealId) {
    final selectedItem = favoriteMealList.indexWhere((element) => element.id == mealId);


setState(() {
  if(selectedItem>0){
   favoriteMealList.removeAt(selectedItem);
  }else{
   favoriteMealList.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));

  }
});


  }

  bool isFavorite(String mealId) {
    return favoriteMealList.any((element) => element.id == mealId);
    }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 247, 247, 219),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(favoriteMealList),
        CategoryMealScreen.CategoryScreen: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.MealDetailsRoute: (ctx) =>
            MealDetailScreen(addFavorites, isFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(updateFilters, _filters)
      },
    );
  }
}
