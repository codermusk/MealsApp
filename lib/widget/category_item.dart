import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import '../screens/categories_meals_screen.dart';

class categoryItem extends StatelessWidget {
  final String id;

  final String title;

  final Color color;

  categoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ct) {
    Navigator.of(ct)
        .pushNamed(categoryMealsscreen.routenamae, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(25),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(25))),
    );
  }
}
