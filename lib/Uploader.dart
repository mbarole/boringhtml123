import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Results.dart';
import 'package:lottie/lottie.dart';

class Uploader extends StatefulWidget {
  final File file;
  Image imagesource;
  Uploader({Key key, this.file, this.imagesource = null}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  @override
  void beginUpload() async {
    FirebaseStorage _storage =
        FirebaseStorage(storageBucket: 'gs://boringhtml-d8c11.appspot.com');

    StorageUploadTask _upload;

    String filepath = 'images/';
    _upload = _storage.ref().child(filepath).putFile(widget.file);

    StorageTaskSnapshot taskSnapshot = await _upload.onComplete;
    String imageURL = await taskSnapshot.ref.getDownloadURL();
    print("Upload to fire base done");
    print(imageURL);

    apiCall(imageURL);
  }

  var list;
  void apiCall(imageURL) async {
    String url = 'https://4261d9a37c7d.ngrok.io/flutter';
    Map data = {'key1': imageURL};
    String body = json.encode(data);
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      print("API HIT SUCCESSFULLY");
      list = (json.decode(response.body));
      print(list['key1']);
      print(list['key2']);
      print(list['key3']);
      widget.imagesource = await Image.network(list['key1']);
      setState(() {
        widget.imagesource;
      });

//      Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => Results(
//            resultImage: list['key1'],
//            sentImage: list['key2'],
//            htmlCode: list['key4'],
//          ),
//        ),
//      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    beginUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.imagesource == null
          ? Stack(
              children: <Widget>[
                Center(
                  child: Image.file(
                    widget.file,
                    width: double.infinity - 30,
                    height: double.infinity - 30,
                    fit: BoxFit.fill,
                  ),
                ),
                Lottie.asset(
                  'lottie/scaner2.json',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ],
            )
          : Center(
              child: ListView(
                children: <Widget>[
                  Text('Code Generated'),
                  Container(
                    color: Colors.grey,
                    child: Text(list['key4']),
                  ),
                  widget.imagesource,
                ],
              ),
            ),
    );
  }
}
