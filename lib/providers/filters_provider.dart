import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_providers.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegeterian,
  Vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.GlutenFree: false,
          Filter.LactoseFree: false,
          Filter.Vegeterian: false,
          Filter.Vegan: false,
        });

  void setFilters(Map<Filter,bool> chosenFilters){
    state=chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filterMealsProvider=Provider((ref) {
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.GlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.Vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.Vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});