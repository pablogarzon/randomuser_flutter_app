import 'package:flutter/material.dart';

void main() => runApp(RandomUserApp());

class RandomUserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random user Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Container(
        child: Center(
          child: Text("Hi!"),
        ),
      ),
    );
  }
}
