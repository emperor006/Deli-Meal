import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './categoriesscreen.dart';
import './category_meal_screen.dart';
import './favorite_meal_screen.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoritemeals;
  TabScreen(this.favoritemeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //const TabScreen({ Key? key }) : super(key: key);
   List<Map<String, Object>> _pages=[];

  @override 
  initState() {
   _pages = [
    {'pages': CategoriesScreen(), 'title': 'Categories'},
    {'pages': Favorites(widget.favoritemeals), 'title': 'Favorite'},
  ];

    super.initState();
  }

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
