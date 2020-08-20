import 'package:flutter/material.dart';
import 'package:boringhtml/sizeConfig.dart';
import 'package:boringhtml/landing_sendtous.dart';

class LandingPickImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff4f4be0),
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
                'Capture A Image Of A Sketch You Want To Convert ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendToUS()),
                  );
                },
                padding: EdgeInsets.all(20),
                icon: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/pickimage.jpg",
                fit: BoxFit.fill,
                height: SizeConfig.blockSizeVertical * 35,
                width: SizeConfig.blockSizeHorizontal * 70,
              )),
        ],
      ),
    );
  }
}
