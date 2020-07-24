import 'package:flutter/material.dart';

import 'package:boringhtml/ImageCapture.dart';
import 'package:boringhtml/Uploader.dart';
import 'package:boringhtml/Results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ImageCapture(),
        '/upload': (context) => Uploader(),
        '/result': (context) => Results(),
      },
    );
  }
}
