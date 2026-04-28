import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: appbarColor,
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
                    backgroundImage: AssetImage('assets/download(7).jpg'),
                  ),
                  SizedBox(width: 40),

                  Container(
                    padding: EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      border: Border.all(color: profileColor, width: 2),
                      //color: appbarColor,
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
                onTap: () {
                  Get.toNamed("/settings");
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //color: secondaryColor1,
                    border: Border.all(color: profileColor),
                    borderRadius: BorderRadius.circular(10),
                    color: appbarColor,
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
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //color: secondaryColor1,
                    border: Border.all(color: profileColor),
                    borderRadius: BorderRadius.circular(10),
                    color: appbarColor,
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
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => Get.toNamed("/gensett"),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //color: secondaryColor1,
                    border: Border.all(color: profileColor),
                    borderRadius: BorderRadius.circular(10),
                    color: appbarColor,
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
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => Get.toNamed("/help"),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    //color: secondaryColor1,
                    border: Border.all(color: profileColor),
                    borderRadius: BorderRadius.circular(10),
                    color: appbarColor,
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
            SizedBox(height: 10),

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
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Get.offAndToNamed("/");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: profileColor1,
      //   color: profileColor1,
      //   buttonBackgroundColor: profileColor2,
      //   items: <Widget>[
      //     Icon(Icons.home_filled, size: 40, color: profileColor),
      //     Icon(Icons.check_circle_outline, size: 40, color: profileColor),
      //     Icon(Icons.hourglass_bottom, size: 40, color: profileColor),
      //     Icon(Icons.account_circle, size: 40, color: profileColor),
      //   ],
      //   onTap: (index) {
      //     //Handle button tap
      //   },
      // ),
    );
  }
}
