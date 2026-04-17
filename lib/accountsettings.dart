import 'package:flutter/material.dart';

void main() {
  runApp(Settings());
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Settings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Settings(),
    );
  }
}
