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

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});
  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  void initState() {
    super.initState();
    getcompleted();
  }

  getcompleted() async {
    var response = await http.get(
      Uri.parse("http://localhost/myapi/rootfolder/pendings/readpend.php"),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var pendingsData = serverData['data'];
      for (var lesson in pendingsData) {
        lessonName.add(
          MyPending(
            lesson_name: lesson['lesson_name'],
            lesson_desc: lesson['lesson_desc'],
            due_date: lesson['due_date'],
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
                    "http://10.0.2.2/myapi/rootfolder/pendings/lessonimages" +
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
        : Center(child: Text("No data available"));
  }
}
