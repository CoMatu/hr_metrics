import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/models/userdata.dart';
import 'package:hr_metrics/services/validations.dart';
import 'package:hr_metrics/services/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool autovalidate = false;
  UserAuth userAuth = new UserAuth();
  Validations validations = new Validations();
  UserData user = new UserData();
  var logo = new AssetImage('assets/logo.png');

  void initState() {
    super.initState();
/*
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
*/
  }

  @override
  Widget build(BuildContext context) {
    //фиксируем портретный режим

    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        body: Center(
          child: new SingleChildScrollView(
            controller: scrollController,
            child: new Container(
                height: screenSize.height,
                color: Colors.white,
                child: new Form(
                  key: formKey,
                  autovalidate: autovalidate,
                  child: new Center(
                      child: new Column(
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
                        child: new TextFormField(
                          validator: validations.validateEmail,
                          onSaved: (String email) {
                            user.email = email;
                          },
                          decoration: new InputDecoration(
                            hintText: 'E-mail',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      new SizedBox(
                        width: 250.0,
                        height: 50.0,
                        child: new TextFormField(
                          obscureText: true,
                          onSaved: (String password) {
                            user.password = password;
                          },
                          decoration: new InputDecoration(hintText: 'Пароль'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      new SizedBox(
                        width: 250.0,
                        height: 90.0,
                        child: new FlatButton(
                            onPressed: () {
                              // проверка логина и пароля
                              _handleSubmitted();
                            },
                            child: new Text(
                              'ВОЙТИ',
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.red[500],
                              ),
                              textAlign: TextAlign.right,
                            )),
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new SizedBox(
                        child: new FlatButton(
                            onPressed: null,
                            child: new Text('ИСПОЛЬЗОВАТЬ ДЕМО')),
                      )
                    ],
                  )),
                )),
          ),
        ));
  }

 Future<void> _handleSubmitted() async{
    final FormState form = formKey.currentState;
    SharedPreferences prefs;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == "Login Successfull")
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new DashboardScreen()),
          );
        else
          showInSnackBar(onValue);
      }).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString("password", user.password);
      prefs.setString("email", user.email);
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
