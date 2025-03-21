import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);
    return Column(
     
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Image.asset(category.imageUrl,
              errorBuilder: (context, error, stackTrace) {
            print('Error loading image: ${category.imageUrl}');
            print('Error details: $error');
            return const Icon(Icons.error);
          }, fit: BoxFit.fitWidth),
        ),
        Text(category.title),
      ],
    );
  }
}
