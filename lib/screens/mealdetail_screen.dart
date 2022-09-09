import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const MealDetailsRoute = 'meal-details';
 // const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;

    return  Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
