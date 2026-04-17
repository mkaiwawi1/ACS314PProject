import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/pendingmodels.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//List<MyPending> lessonName = [];

class PendingScreen2 extends StatefulWidget {
  const PendingScreen2({super.key});
  @override
  State<PendingScreen2> createState() => _PendingScreen2State();
}

class _PendingScreen2State extends State<PendingScreen2> {
  bool isLoading = true;
  List<MyPending> lessonName = [];

  @override
  void initState() {
    super.initState();
    getpending();
  }

  dynamic getpending() async {
    // setState(() {
    //   isLoading = true;
    // });
    var response = await http.get(
      Uri.parse("http://10.0.2.2/myapi/rootfolder/pendings/readpend.php"),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var pendingsData = serverData['data'];

      //lessonName.clear();
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
      // setState(() {
      //   isLoading = false;
      // });
      Get.snackbar(
        "Error",
        "Server Error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessonName.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Image.network(
              "http://localhost/myapi/rootfolder/pendings/lessonimages/" +
                  lessonName[index].image!,
              width: 50,
              height: 50,
            ),
            Column(
              children: [
                Text(lessonName[index].lesson_name!),
                Text(lessonName[index].lesson_desc!),
                Text(lessonName[index].due_date!),
                Text("Pending"),
              ],
            ),
          ],
        );
      },
    );
    //: Center(child: Text("No data available"));
    // : Center(child: CircularProgressIndicator());
  }
}
