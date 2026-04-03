import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/controllers/signupcontroller.dart';

TextEditingController emailController = TextEditingController();
TextEditingController fullnameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
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
                Image.asset('assets/8ballblue.jpg', width: 150, height: 100),
                //Text("Login screen"),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Enter email address:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: profileColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "example@email.com",
                    hintStyle: TextStyle(color: profileColor4),
                    //prefixIcon: Icon(Icons.person, color: profileColor4),
                  ),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        "Enter full name:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter full name",
                    hintStyle: TextStyle(color: profileColor4),
                  ),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        "Enter password:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter valid password",
                    hintStyle: TextStyle(color: profileColor4),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: profileColor4,
                    ),
                  ),
                ),

                //SizedBox(height: 30),
                Text(
                  "*Password must be at least 8 characters long and contain a mix of uppercase letters, lowercase letters, numbers, and special characters.",
                  style: TextStyle(fontSize: 14, color: profileColor2),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        "Confirm Password:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Repeat password",
                    hintStyle: TextStyle(color: profileColor4),
                    //prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: profileColor4,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                MaterialButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        fullnameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please fill in all fields",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    final response = await http.get(
                      Uri.parse(
                        "https://10.0.2.2/myapi/rootfolder/create.php?emailadd=${emailController.text.trim()}&fullname=${fullnameController.text.trim()}&pass1=${passwordController.text}&pass2=${confirmPasswordController.text}",
                      ),
                    );
                    if (response.statusCode == 200) {
                      final serverData = jsonDecode(response.body);
                      if (serverData['success'] == true) {
                        Get.snackbar(
                          "Success",
                          "Account created successfully",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        Get.toNamed('/login');
                      } else {
                        Get.snackbar(
                          "Error",
                          "Failed to create account",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }
                    //print(response.body);
                  },
                  color: profileColor4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/login');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: profileColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
