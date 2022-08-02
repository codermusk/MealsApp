import 'package:flutter/material.dart  ';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filterScreen';
  Map<String, bool> currentFilters;

  final Function Savefilters;

  FilterScreen(this.currentFilters, this.Savefilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenfree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;
@override
  initState(){
    _glutenfree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool ;
    _vegan   = widget.currentFilters['vegan'] as bool ;
    _lactoseFree = widget.currentFilters['lactose'] as bool ;


  super.initState();

  }

  Widget buildswitchtile(String title, String description, bool currentValue,
      dynamic updatevalue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updatevalue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Fiters '),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenfree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.Savefilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Adjust Your Meal selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildswitchtile(
                  'Gutenfree',
                  'This meal gives  only GlutenFree',
                  _glutenfree,
                  (value) {
                    setState(() {
                      _glutenfree = value;
                    });
                  },
                ),
                buildswitchtile(
                  'Vegan',
                  'This meal gives  only Vegan',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
                buildswitchtile(
                  'Vegetarian',
                  'This meal gives  only Vegetarian',
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                buildswitchtile(
                  'LactoseFree',
                  'This meal gives  only Lactose Free',
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
