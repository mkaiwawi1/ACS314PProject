import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pendingmodels.dart';

class PendingController extends GetxController {
  var isLoading = true.obs;
  var lessons = <MyPending>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPending();
  }

  Future<void> getPending() async {
    isLoading(true);

    var response = await http.get(
      Uri.parse("http://localhost/myapi/rootfolder/pendings/readpend.php"),
    );
    print(response.body);
    var decoded = jsonDecode(response.body);
    //print(decoded['data']);
    //print(decoded['data'].length);

    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var pendingsData = serverData['data'];

      //var lessons = <MyPending>[];
      lessons.clear();
      for (var item in pendingsData) {
        lessons.add(
          // MyPending(
          //       lessonName: item['lesson_name'],
          //       lessonDesc: item['lesson_desc'],
          //       dueDate: item['due_date'],
          //       image: item['image'],
          //     ),
          MyPending.fromJson(item),
        );
      }
    } else {
      Get.snackbar("Error", "Server Error", snackPosition: SnackPosition.TOP);
    }
    // Get.snackbar(
    //   "Error",
    //   "An error occurred: ${response.statusCode}",
    //   snackPosition: SnackPosition.BOTTOM,
    // );
    isLoading(false);
  }

  Future<void> fetchLessons() async {
    final response = await http.get(
      Uri.parse("http://localhost/myapi/rootfolder/pendings/readpend.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //lessons.value = data;
      if (data is Map && data["data"] != null) {
        //  API returns {data: [...]}
        lessons.value = (data["data"] as List)
            .map((e) => MyPending.fromJson(e))
            .toList();
      }
    }
  }
}
