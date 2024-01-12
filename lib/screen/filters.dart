import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screen/tabs.dart';
import 'package:meals/widget/main_drawer.dart';

enum Filter { GlutenFree, LactoseFree, Vegeterian, Vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter,bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfreefilterset = false;
  var _lactosefreefilterset = false;
  var _vegeterianfilterset = false;
  var _veganfilterset = false;

  @override
  void initState() {
    super.initState();
    _glutenfreefilterset = widget.currentFilters[Filter.GlutenFree]!;
    _lactosefreefilterset = widget.currentFilters[Filter.LactoseFree]!;
    _vegeterianfilterset = widget.currentFilters[Filter.Vegeterian]!;
    _veganfilterset = widget.currentFilters[Filter.Vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      // drawer: MainDrawer(onSelectDrawer: (id) {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => TabsScreen()));
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.GlutenFree:_glutenfreefilterset,
            Filter.LactoseFree:_lactosefreefilterset,
            Filter.Vegan:_veganfilterset,
            Filter.Vegeterian:_vegeterianfilterset
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreefilterset,
              onChanged: (onChanged) {
                setState(() {
                  _glutenfreefilterset = onChanged;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Gluten-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosefreefilterset,
              onChanged: (onChanged) {
                setState(() {
                  _lactosefreefilterset = onChanged;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianfilterset,
              onChanged: (onChanged) {
                setState(() {
                  _vegeterianfilterset = onChanged;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegeterian Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganfilterset,
              onChanged: (onChanged) {
                setState(() {
                  _veganfilterset = onChanged;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
