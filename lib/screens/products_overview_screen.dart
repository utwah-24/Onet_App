// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/search_bar.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          width: 80,
          height: 80,
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Only Favorites'),
              ),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show All'),
              ),
            ],
          ),
          // Consumer<Cart>(
          //   builder: (_, cart, ch) => TheBadge(
          //     color: Colors.red,
          //     value: cart.itemCount.toString(),
          //     child: ch,
          //   ),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(CartScreen.routeName);
          //     },
          //   ),
          // ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 252, 252, 252),
                  Color.fromARGB(255, 130, 128, 128),
                ],
              ),
            ),
            child: Image.asset(
              'assets/Picture 1.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          MySearchBar(),
          Expanded(
            child: ProductsGrid(_showOnlyFavorites),
          ),
        ],
      ),
      // bottomNavigationBar: TheNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }
}
