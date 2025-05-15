// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:state_management/screens/products_overview_screen.dart';
import 'package:state_management/widgets/bottom_nav_item.dart';

import '../screens/Category_screen.dart';

import '../screens/orders_screen.dart';

// import 'package:onet_app/widgets/home_page.dart';
// import 'package:onet_app/widgets/Report.dart';
// import 'package:onet_app/widgets/products.dart';
// import 'package:onet_app/widgets/settings.dart';

class CustomHome extends StatefulWidget {
  const CustomHome({super.key});

  // final String userEmail;
  // const CustomHome({super.key, required this.userEmail});

  @override
  State<CustomHome> createState() => _CustomHomeState();
}

class _CustomHomeState extends State<CustomHome>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  double selected = 0;
  late List<Widget> pageViews;
  final activeColor = const Color.fromARGB(255, 244, 23, 7);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _pageController.addListener(() {
      setState(() {
        selected = _pageController.page ?? 0;
      });
    });
    pageViews = <Widget>[
      ProductsOverviewScreen(),
      CategoryScreen(),
      OrdersScreen(),
    ];
  }

  Future<void> switchPage(int page) async {
    await _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Title"),
      // ),
      body: PageView(
        controller: _pageController,
        children: pageViews,
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Backdrop blur effect
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: BackdropFilter(
                filter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.srcOver,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            // Navigation items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomNavItem(
                  label: "Home",
                  onTap: () => switchPage(0),
                  iconData: Icons.home_rounded,
                  isActive: selected == 0,
                  position: selected,
                  index: 0,
                ),
                BottomNavItem(
                  label: "categories",
                  onTap: () => switchPage(1),
                  iconData: Icons.category,
                  isActive: selected == 1,
                  position: selected,
                  index: 1,
                ),
                BottomNavItem(
                  label: "Settings",
                  onTap: () => switchPage(2),
                  iconData: Icons.settings,
                  isActive: selected == 2,
                  position: selected,
                  index: 2,
                ),
                // BottomNavItem(
                //   label: "Settings",
                //   onTap: () => switchPage(3),
                //   iconData: Icons.settings,
                //   isActive: selected == 3,
                // ),
              ],
            ),
            // Animated indicator
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              bottom: 0,
              left: MediaQuery.of(context).size.width / 3 * selected,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 2,
                child: Center(
                  child: Container(
                    width: 24,
                    height: 2,
                    decoration: BoxDecoration(
                      color: activeColor,
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                          color: activeColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
