import 'package:flutter/material.dart';
import 'package:state_management/providers/category.dart';

class Categories with ChangeNotifier {
  final List<Category> _items = [
    Category(
      id: 'c1',
      title: 'Computers & Accessories',
      imageUrl: 'assets/categories/comp & accesories.jpg',
    ),
    Category(
      id: 'c2',
      title: 'Network',
      imageUrl: 'assets/categories/network.jpg',
    ),
    Category(
      id: 'c3',
      title: 'Printers ',
      imageUrl: 'assets/categories/printer.jpg',
    ),
    Category(
      id: 'c4',
      title: 'security',
      imageUrl: 'assets/categories/security.jpg',
    ),
    Category(
      id: 'c5',
      title: 'Tel & PBX',
      imageUrl: 'assets/categories/tel & PBX.jpeg',
    ),
    Category(
      id: 'c6',
      title: 'tools',
      imageUrl: 'assets/categories/tools.png',
    ),
  ];

  List<Category> get items {
    return [..._items];
  }
}
