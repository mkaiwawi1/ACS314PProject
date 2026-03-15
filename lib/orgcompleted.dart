import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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

        //Sizebox(height: 10),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
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
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 150,
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
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 150,
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
              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 150,
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
              SizedBox(height: 20),
            ],
          ),
        ),

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: primaryColor,
          buttonBackgroundColor: secondaryColor1,
          items: <Widget>[
            Icon(Icons.dashboard, size: 30, color: secondaryColor1),
            Icon(Icons.category, size: 30, color: secondaryColor1),
            Icon(Icons.shopping_cart, size: 30, color: secondaryColor1),
            Icon(Icons.account_circle, size: 30, color: secondaryColor1),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    ),
  );
}