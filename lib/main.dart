import 'package:flutter/material.dart';

import 'package:randomuser_flutter_app/pages/home_page.dart';

void main() => runApp(RandomUserApp());

class RandomUserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random user Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}
