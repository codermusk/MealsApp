import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/category_item.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
      shrinkWrap: true,
          padding: EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map((ct) => categoryItem(
                    ct.id,
                    ct.title,
                    ct.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200 ,
            mainAxisSpacing:30,
            crossAxisSpacing: 20,
            childAspectRatio: 3/2,
          ));

  }
}
