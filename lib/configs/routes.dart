// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:get/get.dart';

var routes = {
  //GetPage(name: name, page: page),
  GetPage(name: '/', page: () => LoginScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/homescreen', page: () => HomeScreen()),
  //GetPage(icon: Icons.home_filled, page: () => HomeScreen()),
  //GetPage(icon: Icons.login, page: () => LoginScreen()),
  //GetPage(icon: Icons.app_registration, page: () => SignupScreen()),
};
