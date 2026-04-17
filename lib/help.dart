import 'package:flutter/material.dart';

void main() {
  runApp(Help());
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help")),
      body: Center(
        child: Text(
          "For assistance, please contact our support team at support@example.com",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
