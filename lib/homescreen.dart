import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: profileColor1,
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
        },
      ),
    );
  }
}
