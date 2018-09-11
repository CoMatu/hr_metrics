import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_metrics/models/userdata.dart';
import 'package:hr_metrics/demo/DashboardScreenDemo.dart';
import 'package:hr_metrics/services/validations.dart';
import 'package:hr_metrics/services/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool autovalidate = false;
  UserAuth userAuth = UserAuth();
  Validations validations = Validations();
  UserData user = UserData();
  var logo = AssetImage('assets/logo.png');

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //фиксируем портретный режим

    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: ListView(
          shrinkWrap: false,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Image(image: logo),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: formKey,
                  autovalidate: autovalidate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 250.0,
                        height: 50.0,
                        child: TextFormField(
                          validator: validations.validateEmail,
                          onSaved: (String email) {
                            user.email = email;
                          },
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 250.0,
                        height: 50.0,
                        child: TextFormField(
                          obscureText: true,
                          onSaved: (String password) {
                            user.password = password;
                          },
                          decoration: InputDecoration(hintText: 'Пароль'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 250.0,
                        height: 90.0,
                        child: FlatButton(
                            onPressed: () {
                              // проверка логина и пароля
                              _handleSubmitted();
                            },
                            child: Text(
                              'ВОЙТИ',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.red[500],
                              ),
                              textAlign: TextAlign.right,
                            )),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),

                      SizedBox(
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DashboardScreenDemo()),
                              );                            }
                            , child: Text('ИСПОЛЬЗОВАТЬ ДЕМО',
                        style: TextStyle(
                          color: Colors.black54
                        ),)),
                      )

                    ],
                  ),
                )
              ],
            )
    );
  }

  Future<void> _handleSubmitted() async {
    final FormState form = formKey.currentState;
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();

    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar('Это не адрес эл.почты!');
    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == "Login Successfull") {

          prefs.setString("password", user.password);
          prefs.setString("email", user.email);
        } else
          showInSnackBar('Неправильный логин или пароль');
      }).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value),
    backgroundColor: Colors.yellow,));
  }
}
