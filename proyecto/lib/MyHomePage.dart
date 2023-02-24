import 'package:flutter/material.dart';
import 'View01.dart';
import 'main.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return const View01(title: 'App');
        });
  }
}