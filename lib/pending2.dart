import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/delete.dart';
//import "package: http/http.dart" as http;
import 'package:get/get.dart';
import '../controllers/pendingcontroller.dart';
import 'add.dart';
import '../models/pendingmodels.dart';
import '/controllers/delete.dart';

class PendingScreen2 extends StatefulWidget {
  const PendingScreen2({super.key});

  @override
  State<PendingScreen2> createState() => _PendingScreen2State();
}

class _PendingScreen2State extends State<PendingScreen2> {
  final PendingController controller = Get.put(PendingController());
  final DeleteController deleteController = Get.put(DeleteController());

   void deleteLesson(String id) async {
    await deleteController.deleteLesson(id);
    controller.getPending(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Pending Lessons", style: TextStyle(color: profileColor)),
        centerTitle: true,
        backgroundColor: appbarColor,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: Text("Loading..."));
        }

        if (controller.lessons.isEmpty) {
          return const Center(child: Text("No pending lessons"));
        }

        return ListView.builder(
          itemCount: controller.lessons.length,
          itemBuilder: (context, index) {
            var lesson = controller.lessons[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: profileColor2,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        "http://localhost/myapi/rootfolder/pendings/lessonimages/chem.jpg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image_not_supported,
                            size: 50,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson.lessonName,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            lesson.lessonDesc,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(lesson.dueDate, overflow: TextOverflow.ellipsis),
                          const Text("Pending"),
                        ],
                      ),
                    ),
                   
                       IconButton(
                       onPressed: () {
                        // delete lesson
                        deleteController.deleteLesson(lesson.id.toString());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 83, 17, 12),
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}