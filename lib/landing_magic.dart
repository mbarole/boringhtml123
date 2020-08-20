import 'package:flutter/material.dart';
import 'package:boringhtml/sizeConfig.dart';
import 'package:boringhtml/landing_sendtous.dart';
import 'package:boringhtml/ImageCapture.dart';

class MagicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeVertical * 10,
                  SizeConfig.blockSizeVertical * 20,
                  SizeConfig.blockSizeVertical * 10,
                  SizeConfig.blockSizeVertical * 10),
              child: Text(
                'And... Be Prepared For Magic',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageCapture()),
                  );
                },
                padding: EdgeInsets.all(20),
                icon: Icon(
                  Icons.navigate_next,
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendToUS()),
                  );
                },
                padding: EdgeInsets.all(20),
                icon: Icon(
                  Icons.navigate_before,
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/magic3.png",
                fit: BoxFit.fill,
                height: SizeConfig.blockSizeVertical * 45,
                width: SizeConfig.blockSizeHorizontal * 90,
              )),
        ],
      ),
    );
  }
}
