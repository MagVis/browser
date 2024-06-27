import 'dart:async';
import 'package:browser/view/home/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const Browser());
}

class Browser extends StatelessWidget {
  const Browser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => Home(),
      },
      initialRoute: '/home',
    );
  }
}
