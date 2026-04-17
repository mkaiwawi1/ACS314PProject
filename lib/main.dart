import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/login.dart';
//import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: routes.toList(),
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
    ),
  );
}
