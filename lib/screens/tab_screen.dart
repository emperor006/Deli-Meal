import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categoriesscreen.dart';
import './category_meal_screen.dart';
import './favorite_meal_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //const TabScreen({ Key? key }) : super(key: key);
  final List<Map<String, Object>> _pages = [
    {'pages': CategoriesScreen(), 'title': 'Categories'},
    {'pages': Favorites(), 'title': 'Favorite'},
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,

        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Catgories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
