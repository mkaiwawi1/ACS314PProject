// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/completed.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pending.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:get/get.dart';

var routes = {
  //GetPage(name: name, page: page),
  GetPage(name: '/', page: () => LoginScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/homescreen', page: () => HomeScreen()),
  GetPage(name: '/profile', page: () => ProfileScreen()),
  GetPage(name: '/completed', page: () => CompletedScreen()),
  GetPage(name: '/pending', page: () => PendingScreen()),
};
