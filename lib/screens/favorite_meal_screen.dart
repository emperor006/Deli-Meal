import 'package:flutter/material.dart';
import 'package:navigationproject/models/meals.dart';

import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  // const Favorites({ Key? key }) : super(key: key);

  List<Meal> _favoriteMeals;
  Favorites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      print('its empty');
    }

    return _favoriteMeals.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              //return Text(selectedMeal[index].title);
              return MealItem(
                id: _favoriteMeals[index].id,
                affordability: _favoriteMeals[index].affordability,
                complexity: _favoriteMeals[index].complexity,
                duration: _favoriteMeals[index].duration,
                imageUrl: _favoriteMeals[index].imageUrl,
                title: _favoriteMeals[index].title,
              );
            },
            itemCount: _favoriteMeals.length,
          )
        : const Center(
            child: Text('Sorry you do not have favorites!'),
          );
  }
}
