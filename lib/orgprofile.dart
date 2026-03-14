import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: profileColor,
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profilepic.png'),
                    ),
                    SizedBox(width: 40),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: profileColor1, width: 2),
                      ),
                      child: Text(
                        "Welcome Back, Mel!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: profileColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: profileColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email: mel@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
