import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: profileColor1,
      ),

      //SizedBox(height: 10),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: profileColor4,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: mel@gmail.com",
                    style: TextStyle(fontSize: 16, color: profileColor3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: profileColor2,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: mel@gmail.com",
                    style: TextStyle(fontSize: 16, color: profileColor4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: profileColor3,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: mel@gmail.com",
                    style: TextStyle(fontSize: 16, color: profileColor2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: profileColor4,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: mel@gmail.com",
                    style: TextStyle(fontSize: 16, color: profileColor3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: profileColor1,
        color: profileColor1,
        buttonBackgroundColor: profileColor2,
        items: <Widget>[
          Icon(Icons.dashboard, size: 30, color: profileColor),
          Icon(Icons.category, size: 30, color: profileColor),
          Icon(Icons.shopping_cart, size: 30, color: profileColor),
          Icon(Icons.account_circle, size: 30, color: profileColor),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
