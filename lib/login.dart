import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:http/http.dart' as http;

LoginController logincontroller = Get.put(LoginController());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      //  title: Text(
      //  "Login Screen",
      //style: TextStyle(color: Colors.white, fontSize: 20),
      // ),
      // centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/8ballblue.jpg', height: 150, width: 150),
              //Text("Login screen"),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Enter username:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ), //TextStyle
                    ), //Text
                  ],
                ), //Row
              ), //Padding

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ), //OutlineInputBorder
                  hintText: "Use Email Address",
                  prefixIcon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ), //Text
                  ],
                ),
              ),
              SizedBox(height: 0),

              Obx(
                () => TextField(
                  obscureText: logincontroller.isPasswordVisible.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        logincontroller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onTap: () {
                        logincontroller.togglePasswordVisibility();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              MaterialButton(
                onPressed: () async {
                  if (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Get.snackbar(
                      "Login Failed",
                      "Please fill in all fields",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: profileColor2,
                      colorText: profileColor,
                    );
                  } else {
                    final response = await http.get(
                      Uri.parse(
                        'https://10.0.2.2/myapi/login.php?email=${usernameController.text}&pass1=${passwordController.text}',
                      ),
                    );
                    print(response.body);
                    if (response.statusCode == 200) {
                      final serverData = jsonDecode(response.body);
                      if (serverData['code'] == 1) {
                        String full_name =
                            serverData['userdetails'][0]['full_name'];
                        print("Welcome, $full_name!");
                        Get.offAndToNamed('/homescreen');
                      } else {
                        Get.snackbar(
                          "Login Failed",
                          serverData["message"],
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: profileColor2,
                          colorText: profileColor,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Login Failed",
                        "Invalid username or password",
                        //"Server error: ${response.statusCode}",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: profileColor2,
                        colorText: profileColor,
                      );
                    }
                  }
                },
                color: profileColor4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/signup');
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(color: profileColor1),
                      ),
                    ),
                    Spacer(),
                    Text("Forgot password?"),
                    SizedBox(width: 5),
                    Text("Reset", style: TextStyle(color: profileColor1)),
                    // TextButton(onPressed: () {}, child: Text("Sign Up")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
