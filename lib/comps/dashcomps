import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MyDash extends StatelessWidget {
  final String artname;
  final String image;
  final String link;

  const MyDash({
    super.key,
    required this.artname,
    required this.image,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(artname, style: TextStyle(fontSize: 16)),
          Image.asset(image, height: 80),
             GestureDetector(
              onTap: () {
                Get.toNamed(link);
              },
              child: Text("Visit"),
            ),
          
          //const SizedBox(height: 10),
        ],
      ),
    );
  }
}
