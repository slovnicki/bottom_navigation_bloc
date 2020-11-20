import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String text;

  FirstPage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My text is: $text'),
      ),
    );
  }
}
