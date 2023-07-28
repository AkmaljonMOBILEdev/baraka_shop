import 'package:baraka_shop/ui/tab_box/category/category.dart';
import 'package:baraka_shop/ui/tab_box/favorite_/favorite_screen.dart';
import 'package:baraka_shop/ui/tab_box/products/product_screen.dart';
import 'package:baraka_shop/ui/tab_box/profile/profile_screen.dart';
import 'package:flutter/material.dart';

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
      FavoriteScreen(),
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
        fixedColor: Color(0xff2398C3),
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