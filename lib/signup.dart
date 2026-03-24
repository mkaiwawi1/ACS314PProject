import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              Image.asset('assets/jumialogo.png', width: 150, height: 100),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter valid password",
                  hintStyle: TextStyle(color: profileColor4),
                  suffixIcon: Icon(Icons.visibility_off, color: profileColor4),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Repeat password",
                  hintStyle: TextStyle(color: profileColor4),
                  //prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off, color: profileColor4),
                ),
              ),
              SizedBox(height: 30),

              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: profileColor4,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
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
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: profileColor1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed("/login");
                      },
                    ),
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
