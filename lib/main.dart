import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/category_screen.dart';
import './screens/meal_detail_screen.dart';
import './dummy_data.dart';
import 'meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> FavMeals = [];

  void _setfilter(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] as bool && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleScreen(String mealId) {
    final existingId = FavMeals.indexWhere((element) => element.id == mealId);
    if (existingId >= 0) {
      setState(() {
        FavMeals.removeAt(existingId);
      });
      
    } else {
      setState(() {
        FavMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });

    }
  }

bool isFavourite(String mealId){
    return FavMeals.any((element) => element.id == mealId);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(244, 220, 415, 0.8),
        fontFamily: 'Raleway',
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
            headline3: TextStyle(
              color: Color.fromRGBO(20, 251, 231, 1),
            ),
            headline6: TextStyle(color: Color.fromRGBO(234, 133, 276, 1)),
            headline1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      // home: categoryScreen(),
      routes: {
        '/': (ctx) => tabSreen(FavMeals),
        categoryMealsscreen.routenamae: (ctx) =>
            categoryMealsscreen(_availableMeals),
        mealDetailScreem.routename: (ctx) => mealDetailScreem(_toggleScreen , isFavourite),
        FilterScreen.routename: (ctx) => FilterScreen(filters, _setfilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => categoryScreen());
      },);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
