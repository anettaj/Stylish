import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  var selectedIndex = 0.obs;

  // Observable variables
  var userName = ''.obs;
  var userId = ''.obs;


  // Define the items for the bottom navigation bar
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Setting',
    ),
  ];

}