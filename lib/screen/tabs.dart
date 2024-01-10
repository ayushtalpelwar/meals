import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screen/filters.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/main_drawer.dart';

import '../models/meal.dart';
import 'categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void showmeassege(message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _togglefavlist(Meal meal) {
    if (_favouriteMeals.contains(meal)) {
      setState(() {
        _favouriteMeals.remove(meal);
        showmeassege('Removed From Favourite');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        showmeassege('Added to Favourite');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setScreen(String id) {
    if (id == 'filter') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
        FiltersScreen()
      ),);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavourite: _togglefavlist,
    );
    var activePageTitle = 'Categories';
    if (selectedIndex == 1) {
      activePage = Meals(
        meals: _favouriteMeals,
        onToggleFavourite: _togglefavlist,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectDrawer: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
