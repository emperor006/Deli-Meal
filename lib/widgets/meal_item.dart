import 'package:flutter/material.dart';
import 'package:navigationproject/models/meals.dart';
import 'package:navigationproject/screens/mealdetail_screen.dart';

class MealItem extends StatelessWidget {
  //const MealItem({ Key? key }) : super(key: key);

  final String title, imageUrl, id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 // Function function;

  MealItem(
      {required this.affordability,
      required this.complexity,
      required this.id,
      required this.duration,
     // required this.function,
      required this.imageUrl,
      required this.title});
//
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.MealDetailsRoute, arguments: id)
        .then((value) {
     // if (value != null) function(value);
    });
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Cheap';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('$duration mins')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(getComplexity)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.money),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(getAffordability)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
