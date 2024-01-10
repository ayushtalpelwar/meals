import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}
class _FiltersScreenState extends State<FiltersScreen>{
  var _glutenfreefilterset=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenfreefilterset,
            onChanged: (onChanged){
              setState(() {
                _glutenfreefilterset=onChanged;
              });
            },
            title: Text('Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle:Text('Only include Gluten-Free Meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
          ),
        ],
      ),
    );
  }
}