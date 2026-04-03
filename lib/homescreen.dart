import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/completed.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/pending.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

var myScreen = [
  HomeScreen(),
  CompletedScreen(),
  PendingScreen(),
  ProfileScreen(),
];
// HomeScreen homescreen = HomeScreen();
// CompletedScreen completedscreen = CompletedScreen();
// PendingScreen pendingscreen = PendingScreen();
// ProfileScreen profilescreen = ProfileScreen();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: profileColor1,
      ),

      body: myScreen[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: profileColor1,
        color: profileColor1,
        buttonBackgroundColor: profileColor2,
        items: <Widget>[
          Icon(Icons.home_filled, size: 40, color: profileColor),
          Icon(Icons.check_circle_outline, size: 40, color: profileColor),
          Icon(Icons.hourglass_bottom, size: 40, color: profileColor),
          Icon(Icons.account_circle, size: 40, color: profileColor),
        ],
        onTap: (index) {
          //Handle button tap
          // setState(() {
          //   currentIndex = index;
          // });
          onTap:
          (index) {
            if (index == 0) {
              Get.offNamed('/home');
            } else if (index == 1) {
              Get.offNamed('/pending');
            } else if (index == 2) {
              Get.offNamed('/completed');
            } else if (index == 3) {
              Get.offNamed('/profile');
            }
          };
        },
      ),
    );
  }
}
