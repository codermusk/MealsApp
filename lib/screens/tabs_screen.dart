import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites_Screen.dart';
import 'package:meals_app/widget/main_drawer.dart';
import '../meal.dart';
import './category_screen.dart';

class tabSreen extends StatefulWidget {
  final List<Meal> favourites;

  tabSreen(this.favourites);

  @override
  State<tabSreen> createState() => _tabSreenState();
}

class _tabSreenState extends State<tabSreen> {
  late List<Map<String, Object>> _pages;

  @override
  initState() {
    _pages = [
      {'page': categoryScreen(), 'title': 'Categories'},
      {'page': favouritesScreen(widget.favourites), 'title': 'Your Favourites'}
    ];
    super.initState();
  }

  int _selectedPage = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColorDark,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColorDark,
              icon: Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
