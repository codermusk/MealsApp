import 'package:flutter/material.dart';
import '../meal.dart';
import '../widget/meal_item.dart';
import '../dummy_data.dart';

class categoryMealsscreen extends StatefulWidget {
  static const routenamae = '/category-meals';

  final List<Meal> availableMeals ;
  categoryMealsscreen(this.availableMeals);

  @override
  State<categoryMealsscreen> createState() => _categoryMealsscreenState();
}

class _categoryMealsscreenState extends State<categoryMealsscreen> {
  var _loadedInitdata = false;

  late String categoryTitle;

  late List<Meal> DisplayedMeals;

  @override
  void didChangeDependencies() {
    if (!_loadedInitdata) {
      final routrargs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routrargs['title'] as String;
      final id = routrargs['id'];
      DisplayedMeals = widget.availableMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
    }
    _loadedInitdata = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void _removemeal(String mealid) {
    DisplayedMeals.removeWhere((element) => element.id == mealid);
  }

  // final String id ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: DisplayedMeals[index].title,
              imageUrl: DisplayedMeals[index].imageUrl,
              duration: DisplayedMeals[index].duration,
              complexity: DisplayedMeals[index].complexity,
              affordability: DisplayedMeals[index].affordability,
              id: DisplayedMeals[index].id,

            );
          },
          itemCount: DisplayedMeals.length,
        ));
  }
}
