import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/pendingmodels.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var lessonName = [
  //myPending(name: "MAT212", description: "Integral Calc", due:"2024-06-30", image: "assets/8ballblue.jpg"),
  //myPending(name: "CSC214", description: "Data Structures", due:"2024-07-15", image: "assets/8ballblue.jpg"),
  //myPending(name: "PHY211", description: "Electricity and Magnetism", due:"2024-08-01", image: "assets/8ballblue.jpg"),
];
bool isLoading = false;

class PendingScreen2 extends StatefulWidget {
  const PendingScreen2({super.key});
  @override
  State<PendingScreen2> createState() => _PendingScreen2State();
}

class _PendingScreen2State extends State<PendingScreen2> {
  @override
  void initState() {
    super.initState();
    getpending();
  }

  getpending() async {
    var response = await http.get(
      Uri.parse("http://localhost/pendings/readpend.php"),
    );
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var pendingsData = serverData['data'];
      for (var lesson in pendingsData) {
        lessonName.add(
          myPending(
            name: lesson['name'],
            description: lesson['description'],
            due: lesson['due'],
            image: lesson['image'],
          ),
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Server Error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ListView.builder(
            itemCount: lessonName.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.network(
                    "http://localhost/rootfolder/pendings/lessonimages" +
                        lessonName[index].image!,
                    width: 50,
                    height: 50,
                  ),
                  Column(
                    children: [
                      Text(lessonName[index].name!),
                      Text(lessonName[index].description!),
                      Text(lessonName[index].due!),
                      Text("Pending"),
                    ],
                  ),
                ],
              );
            },
          )
        : Center(child: CircularProgressIndicator());
    // Widget circularProgressIndicator = CircularProgressIndicator();
    // return circularProgressIndicator;
  }
}
