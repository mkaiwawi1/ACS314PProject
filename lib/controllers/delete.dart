import 'dart:convert';
import 'package:flutter_application_1/controllers/pendingcontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import '../models/pendingmodels.dart';

final controller = Get.put(PendingController());

class DeleteController extends GetxController {
  Future<void> deleteLesson(String id) async {
    final response = await http.post(
      Uri.parse("http://localhost/myapi/rootfolder/pendings/deletepend.php"),
      body: {"id": id},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["success"] == 1) {
        Get.snackbar("Success", "Deleted successfully");
        await Get.find<PendingController>()
            .fetchLessons(); // Refresh the list after deletion
      } else {
        Get.snackbar("Error", "Delete failed");
      }
    }
  }
}
