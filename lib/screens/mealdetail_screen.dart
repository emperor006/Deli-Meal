// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:navigationproject/data/dummy_data.dart';
import 'package:navigationproject/widgets/meal_item.dart';

import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const MealDetailsRoute = 'meal-details';
  // const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            height: 300,
            width: 200,
            child: ListView.builder(
              // ignore: deprecated_member_use
              itemBuilder: (context, index) => 
              Card(color: Theme.of(context).accentColor,child: Text(meal.title),),
              itemCount: meal.ingredients.length,
            ),
          ),
        ],
      ),
    );
  }
}
