import 'package:flutter/material.dart';
import 'package:boringhtml/sizeConfig.dart';
import 'package:boringhtml/landing_pickimage.dart';
import 'package:boringhtml/landing_magic.dart';

class SendToUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xfff4f6f8),
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
                'Send It To Us',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MagicPage()));
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
                    MaterialPageRoute(builder: (context) => LandingPickImage()),
                  );
                },
                padding: EdgeInsets.all(20),
                icon: Icon(
                  Icons.navigate_before,
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/sendtous.png",
                  fit: BoxFit.fill,
                  height: SizeConfig.blockSizeVertical * 35,
                  width: SizeConfig.blockSizeHorizontal * 80,
                ),
              )),
        ],
      ),
    );
  }
}
