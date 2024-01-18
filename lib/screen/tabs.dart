import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/screen/filters.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:meals/providers/meals_providers.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../providers/filters_provider.dart';
import 'categories.dart';

const kInitialFilters = {
  Filter.GlutenFree: false,
  Filter.LactoseFree: false,
  Filter.Vegan: false,
  Filter.Vegeterian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;


  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setScreen(String id) async {
    Navigator.of(context).pop();
    if (id == 'filter') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (context) => FiltersScreen(
                )),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals =ref.watch(filterMealsProvider);
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (selectedIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = Meals(
        meals: favouriteMeals,
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
