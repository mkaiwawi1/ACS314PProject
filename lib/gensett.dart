import 'package:flutter/material.dart';

void main() {
  runApp(GenSett());
}

class GenSett extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: Text(
            'This is the generated settings page.',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
