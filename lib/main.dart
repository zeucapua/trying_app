import 'package:flutter/material.dart';
import 'package:trying_app/pages/MainPage.dart';

void main() => runApp(TryingApp());

class TryingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trying",
      home: MainPage(),
    );
  }

}