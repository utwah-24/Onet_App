import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/products.dart';
import 'package:state_management/screens/splash_screen.dart';

import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import 'providers/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
        ChangeNotifierProvider(create: (ctx) => Categories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Onet',
        theme: ThemeData(
          primarySwatch: Colors.red,
          hintColor: Colors.red,
          fontFamily: 'IBMPlexSans',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: Color.fromARGB(255, 244, 23, 7),
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        },
      ),
    );
  }
}
