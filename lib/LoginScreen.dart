import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();

  var logo = new AssetImage('assets/logo.png');

  @override
  Widget build(BuildContext context) {
    //фиксируем портретный режим
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      body: Center(
        child: new SingleChildScrollView(
          controller: scrollController,
          child:
          new Container(
            height: screenSize.height,
            color: Colors.white,
            child: new Center(
                child:
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      height: 30.0,
                    ),
                    new SizedBox(
                      width: 250.0,
                      height: 50.0,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Имя пользователя'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new SizedBox(
                      width: 250.0,
                      height: 50.0,
                      child: TextField(
                        decoration: new InputDecoration(
                            hintText: 'Пароль'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    new SizedBox(
                      width: 250.0,
                      height: 90.0,
                      child: new FlatButton(
                          onPressed: null,
                          child: new Text('ВОЙТИ',
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.red[500],
                            ),
                            textAlign: TextAlign.right,
                          )
                      ),
                    ),
                    new SizedBox(
                      height: 50.0,
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
      )
    );
  }
}
