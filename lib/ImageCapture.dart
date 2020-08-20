import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:boringhtml/Uploader.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imageFile = null;
  }

  File _imageFile;

  Future _pickImage(source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
    _pickImage(ImageSource.camera);
  }

  @override
  void initState() {
    super.initState();
    _pickImage(ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.refresh),
                    onPressed: _clear,
                  ),
                  FlatButton.icon(
                    label: Text('Upload'),
                    icon: Icon(Icons.cloud_upload),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Uploader(file: _imageFile)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
