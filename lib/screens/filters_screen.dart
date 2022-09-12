import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({ Key? key }) : super(key: key);

  static const routeName = 'FilterScreen';
  Function _updateFilters;
  Map<String, bool> filterList;

  FilterScreen(this._updateFilters, this.filterList);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarianFree = false;
  bool _isVegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.filterList['glutenFree'] as bool;
      _isVegetarianFree = widget.filterList['vegetarianFree'] as bool;
    _isVegan = widget.filterList['veganFree'] as bool;
    _lactoseFree = widget.filterList['lactoseFree'] as bool;

    super.initState();
  }

  Widget buildSwitchtile(
      bool filterValue, String title, String subTitle, var function) {
    return SwitchListTile(
      value: filterValue,
      onChanged: function,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                widget._updateFilters({
                  'glutenFree': _isGlutenFree,
                  'lactoseFree': _lactoseFree,
                  'veganFree': _isVegan,
                  'vegetarianFree': _isVegetarianFree
                });
              },
              icon: const Icon(Icons.save))
        ],
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
                  'Only include gluten-free meals', (val) {
                setState(() {
                  _isGlutenFree = val;
                });
              }),
              buildSwitchtile(_isVegan, 'Vegan', 'Only include Vegan meals',
                  (val) {
                setState(() {
                  _isVegan = val;
                });
              }),
              buildSwitchtile(_lactoseFree, 'Lactose-free',
                  'Only include lactose-free meals', (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
              buildSwitchtile(_isVegetarianFree, 'Vegetarian-free',
                  'Only include vegetarian meals', (val) {
                setState(() {
                  _isVegetarianFree = val;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }
}
