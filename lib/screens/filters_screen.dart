import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({ Key? key }) : super(key: key);

  static const routeName = 'FilterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarianFree = false;
  bool _isVegan = false;
  bool _lactoseFree = false;

  Widget buildSwitchtile(bool filter, String title, String subTitle) {
    return SwitchListTile(
      value: filter,
      onChanged: (val) {
        setState(() {
          filter = val;
        });
      },
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection here!',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchtile(_isGlutenFree, 'Gluten-free',
                  'Only include gluten-free meals'),
              buildSwitchtile(_isVegan, 'Vegan', 'Only include Vegan meals'),
              buildSwitchtile(_lactoseFree, 'Vegetarian-free',
                  'Only include lactose-free meals'),
              buildSwitchtile(_isVegetarianFree, 'Vegetarian-free',
                  'Only include vegan-free meals'),
            ],
          )),
        ],
      ),
    );
  }
}
