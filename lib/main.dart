import 'package:flutter/material.dart';
import 'package:navigationproject/screens/mealdetail_screen.dart';

import 'screens/categoriesscreen.dart';
import 'screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        '/': (context) => CategoriesScreen(),
        CategoryMealScreen.CategoryScreen: (ctx) => CategoryMealScreen(),
        MealDetailScreen.MealDetailsRoute: (ctx) => MealDetailScreen()
      },
    );
  }
}
