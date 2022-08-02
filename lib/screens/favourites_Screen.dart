import 'package:flutter/material.dart';

import '../meal.dart';
import '../widget/meal_item.dart';

class favouritesScreen extends StatelessWidget {
  final List<Meal> favs;

  favouritesScreen(this.favs);

  @override
  Widget build(BuildContext context) {
    if (favs.isEmpty) {
      return Center(
        child: Text('You Have no favourites Start Adding Some  '),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favs[index].title,
            imageUrl: favs[index].imageUrl,
            duration: favs[index].duration,
            complexity: favs[index].complexity,
            affordability: favs[index].affordability,
            id: favs[index].id,
          );
        },
        itemCount: favs.length,
      );
    }
  }
}
