import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 80),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          child: Consumer<Categories>(
            builder: (context, categories, child) => GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: categories.items.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: categories.items[i],
                child: CategoryItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
