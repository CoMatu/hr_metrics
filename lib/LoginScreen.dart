import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var logo = new AssetImage('assets/logo.png');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: new Container(
          color: Colors.white,
          child: new Center(
              child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: new Image(image: logo),
                ),
              ),
              new SizedBox(
                width: 250.0,
                height: 50.0,
                child: TextField(),
              ),
              new SizedBox(
                width: 250.0,
                height: 50.0,
                child: TextField(),
              ),
              new SizedBox(
                width: 100.0,
                height: 70.0,
                child:
                new FlatButton(
                    onPressed: null,
                    child: new Text('ВОЙТИ',
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.red[500]
                    ),
                    )
                ),
              ),
              new SizedBox(
                height: 70.0,
              ),
              new SizedBox(
                child: new FlatButton(
                    onPressed: null,
                    child: new Text(
                      'ИСПОЛЬЗОВАТЬ ДЕМО'
                    )),
              )
            ],
          )),
        ),
      ),
    );
  }
}
