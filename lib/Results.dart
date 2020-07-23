import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Results extends StatefulWidget {
  final String sentImage, resultImage, htmlCode;
  Results({Key key, @required this.sentImage, this.resultImage, this.htmlCode})
      : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.network(
            widget.resultImage,
            height: 300,
            width: 200,
          ),
          Text((widget.htmlCode)),
        ],
      ),
    );
  }
}
