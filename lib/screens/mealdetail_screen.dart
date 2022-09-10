// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const MealDetailsRoute = 'meal-details';
  // const MealDetailScreen({Key? key}) : super(key: key);

  Widget showHeading(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
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
            showHeading(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                // ignore: deprecated_member_use
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index])),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            showHeading(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#${index + 1}')),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  )),
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
