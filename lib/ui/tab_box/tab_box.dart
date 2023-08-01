
import 'package:baraka_shop/ui/tab_box/products/product_screen.dart';
import 'package:baraka_shop/ui/tab_box/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

import 'category/category_screen.dart';

import 'favorites/favorite_screen.dart';


class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> activeScreen = [];

  int screenIndex = 0;

  @override
  void initState() {
    activeScreen = [
     ProductScreen(),
      CategoryScreen(),
      FavoritesScreen(),
      ProfileScreen(),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activeScreen[screenIndex],
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.cFC6828,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: screenIndex,
        onTap: (v){
          setState(() {
            screenIndex = v;
          });
        },
        items:const [
          BottomNavigationBarItem(
            label: 'Product',
            icon: Icon(Icons.shop_2),
          ),
          BottomNavigationBarItem(
            label: 'category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),

      // BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shop_two), label: "Products"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.category), label: "Catgeories"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      //   currentIndex: screenIndex,
      //   onTap: (v) {
      //     setState(() {
      //       screenIndex = v;
      //     });
      //   },
      // ),
    );
  }
}