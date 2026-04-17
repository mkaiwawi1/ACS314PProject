import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/comps/dashcomps.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
//import 'package: url_launcher/url_launcher.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  List<MyDash> dashes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: profileColor)),
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
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: profileColor1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Welcome to the Dashboard!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: profileColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dashes[index].artname,
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(dashes[index].image, height: 80),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(dashes[index].link);
                          },
                          child: Text("Visit"),
                        ),

                        //const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
