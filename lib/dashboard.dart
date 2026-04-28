import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
//import 'package:flutter_application_1/comps/dashcomps.dart';
import 'package:flutter_application_1/models/dashmodels.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  //List<MyDash> dashes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: appbarColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // SizedBox(height: 30),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Container(
                //     height: 150,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: profileColor1,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Welcome to the Dashboard!",
                //         style: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: profileColor,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                //const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(15.0),
                  itemCount: dashes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),

                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: profileColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dashes[index].artname,
                            style: TextStyle(
                              fontSize: 25,
                              color: profileColor4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              dashes[index].image,
                              height: 130,
                              width: 130,
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(dashes[index].link);

                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              "Visit",
                              style: TextStyle(
                                color: profileColor4,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
