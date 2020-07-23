import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Results.dart';

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, @required this.file}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
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

  void apiCall(imageURL) async {
    String url = 'https://b21dded48a76.ngrok.io/flutter';
    Map data = {'key1': imageURL};
    String body = json.encode(data);
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    var list;
    if (response.statusCode == 200) {
      print("API HIT SUCCESSFULLY");
      list = (json.decode(response.body));
      print(list['key1']);
      print(list['key2']);
      print(list['key3']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Results(
            resultImage: list['key1'],
            sentImage: list['key2'],
            htmlCode: list['key4'],
          ),
        ),
      );
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
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
        ),
      ),
    );
  }
}
