import 'package:flutter/material.dart';
import './categoriesscreen.dart';

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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 299, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}
