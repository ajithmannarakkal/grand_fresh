import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/images/bottom-nav-icon-home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/images/bottom-nav-icon-search.png")),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text('1'),
              child: ImageIcon(
                  AssetImage("assets/images/bottom-nav-icon-cart.png")),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/images/bottom-nav-icon-account.png")),
            label: 'Account',
          ),
        ],
      ),
    ));
  }
}
