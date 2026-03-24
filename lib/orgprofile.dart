import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(color: profileColor)),
          centerTitle: true,
          backgroundColor: profileColor1,
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/august24(6)cropped.jpg',
                      ),
                    ),
                    SizedBox(width: 40),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: profileColor, width: 2),
                      ),
                      child: Text(
                        "Welcome Back, Mel!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: profileColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //color: secondaryColor1,
                      border: Border.all(color: profileColor, width: 2),
                    ),

                    child: Text(
                      "Account Settings",
                      style: TextStyle(
                        color: profileColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //color: secondaryColor1,
                      border: Border.all(color: profileColor, width: 2),
                    ),

                    child: Text(
                      "  ",
                      style: TextStyle(
                        color: profileColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //color: secondaryColor1,
                      border: Border.all(color: profileColor, width: 2),
                    ),

                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: profileColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //color: secondaryColor1,
                      border: Border.all(color: profileColor, width: 2),
                    ),

                    child: Text(
                      "Help & Support",
                      style: TextStyle(
                        color: profileColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: profileColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed("/signup");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: profileColor1,
          color: profileColor1,
          buttonBackgroundColor: profileColor2,
          items: <Widget>[
            GestureDetector(
              onTap: () => Get.toNamed("/homescreen"),
              child: Icon(Icons.home_filled, size: 40, color: profileColor),
            ),

            GestureDetector(
              onTap: () => Get.toNamed("/completed"),
              child: Icon(
                Icons.check_circle_outline,
                size: 40,
                color: profileColor,
              ),
            ),

            GestureDetector(
              onTap: () => Get.toNamed("/pending"),
              child: Icon(
                Icons.hourglass_bottom,
                size: 40,
                color: profileColor,
              ),
            ),

            GestureDetector(
              onTap: () => Get.toNamed("/profile"),
              child: Icon(Icons.account_circle, size: 40, color: profileColor),
            ),
          ],
        ),
      ),
    ),
  );
}
