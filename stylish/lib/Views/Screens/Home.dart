import 'package:flutter/material.dart';
// TODO: add flutter_svg to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stylish/Controller/HomeController.dart';
import '../../Constant/Colors.dart';
import '../Widget/Home/Categories.dart';
import '../Widget/Home/DiscountBanner.dart';
import '../Widget/Home/HomeHeader.dart';
import '../Widget/Home/SearchField.dart';
import '../Widget/Home/SpecialOffers.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBgColor,
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              SearchField(),
              Categories(),
              SpecialOffers(),
              DiscountBanner(),
            ],
          ),
        ),
      ),
      //bottom navbar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.white,

      ),

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 60,
        shape: const CircularNotchedRectangle(),
        // notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: homeController.selectedIndex.value,
            selectedItemColor: Colors.pink,
            // landscapeLayout:BottomNavigationBarLandscapeLayout.centered ,
            unselectedItemColor: Colors.black,
            enableFeedback: true,
            items: homeController.bottomNavBarItems,
          ),
        ),
      ),
    );
  }
}




