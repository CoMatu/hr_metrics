
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logo = AssetImage('assets/logo.png');
    return Scaffold(
      appBar: AppBar(),
        body: Container(
      color: Colors.white,
      child: Center(
          child: Stack(children: <Widget>[
        SizedBox(
          height: 150.0,
          width: 150.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.yellow[100]),
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
