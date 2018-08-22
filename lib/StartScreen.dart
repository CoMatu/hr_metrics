
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logo = new AssetImage('assets/logo.png');
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(),
        body: Container(
      color: Colors.white,
      child: Center(
          child: new Stack(children: <Widget>[
        SizedBox(
          height: 150.0,
          width: 150.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation(Colors.yellow[100]),
            strokeWidth: 20.0,
          ),
        ),
        SizedBox(
          height: 150.0,
          width: 150.0,
          child: Image(image: logo),
        )
      ])),
    ));
  }
//  Future.delayed(Duration(seconds: 2));

}
