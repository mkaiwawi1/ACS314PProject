import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';
import '../controllers/pendingcontroller.dart';
//import '../models/pendingmodels.dart';
import 'package:http/http.dart' as http;

class AddLessonScreen extends StatelessWidget {
  AddLessonScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final controller = Get.put(PendingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text("Add Lesson", style: TextStyle(color: profileColor)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Lesson Name",
              ),
              controller: nameController,
              //const InputDecoration(labelText: "Lesson Name"),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Description",
              ),
              controller: descController,
              //decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Due Date",
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () async {
                // add locally first
                if (nameController.text.isEmpty ||
                    descController.text.isEmpty ||
                    dateController.text.isEmpty) {
                  Get.snackbar("Error", "Please fill all fields");
                }
                final response = await http.post(
                  Uri.parse(
                    "http://localhost/myapi/rootfolder/pendings/createpend.php?",
                  ),
                  body: {
                    "image": "placeholder.jpg",
                    "lesson_name": nameController.text,
                    "lesson_desc": descController.text,
                    "due_date": dateController.text,
                  },
                );

                if (response.statusCode == 200) {
                  final serverData = jsonDecode(response.body);
                  if (serverData['success'] == true) {
                    Get.snackbar(
                      "Success",
                      "Lesson added successfully",
                      snackPosition: SnackPosition.TOP,
                    );
                    await Get.find<PendingController>().fetchLessons();
                    Get.toNamed('/pending2');
                  }
                  ;
                } else {
                  Get.snackbar(
                    "Error",
                    "Failed to add lesson. Please try again.",
                    snackPosition: SnackPosition.TOP,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: profileColor1,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: profileColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
