// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:udemy_clone/screens/homescreens/account.dart';
import 'package:udemy_clone/screens/homescreens/featured.dart';
import 'package:udemy_clone/screens/homescreens/my_courses.dart';
import 'package:udemy_clone/screens/homescreens/search.dart';
import 'package:udemy_clone/screens/homescreens/wish_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Featured(),
          Search(),
          MyCourses(),
          WishList(),
          Accounts(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade900,
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 26,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
