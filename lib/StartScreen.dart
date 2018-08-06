import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var logo = new AssetImage('assets/logo.png');
    var image = new Image(image: logo);
    // TODO: implement build
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 250.0,
                  width: 250.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation(Colors.yellow[100]),
                    strokeWidth: 20.0,
                  ),
                ),
                SizedBox(
                  height: 250.0,
                  width: 250.0,
                  child: Image(image: logo),
                )
              ],
            ),

        ),
      )
    );
  }

}