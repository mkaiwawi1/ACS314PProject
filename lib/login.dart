import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/logincontroller.dart';
import 'package:get/get.dart';

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

              // MaterialButton(
              // onPressed: () {},
              //child: Text(
              //"Login",
              //style: TextStyle(
              //color: Colors.white,
              //fontWeight: FontWeight.w900,
              //fontSize: 30,
              // ),
              //),
              //color: Colors.blue,
              // ),
              GestureDetector(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: profileColor4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () => () {
                  // Handle login logic here
                  bool success = logincontroller.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (success) {
                    Get.offAndToNamed('/homescreen');
                  } else {
                    Get.snackbar(
                      "Login Failed",
                      "Invalid username or password",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: profileColor2,
                      colorText: profileColor,
                    );
                  }
                },
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    Text("Create", style: TextStyle(color: profileColor1)),
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
