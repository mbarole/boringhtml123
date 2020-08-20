import 'package:flutter/material.dart';

import 'package:boringhtml/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Annie'),
      home: SplashScreen(),
    );
  }
}
