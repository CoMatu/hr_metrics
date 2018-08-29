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
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  bool autovalidate = false;
  UserAuth userAuth = UserAuth();
  Validations validations = Validations();
  UserData user = UserData();
  var logo = AssetImage('assets/logo.png');

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

    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
                height: screenSize.height,
                color: Colors.white,
                child: Form(
                  key: formKey,
                  autovalidate: autovalidate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Image(image: logo),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
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
                        onPressed: null,
                        child: Text('ИСПОЛЬЗОВАТЬ ДЕМО')),
                  )
                    ],
                  ),
                )
            ),
          ),
        )
    );
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
            MaterialPageRoute(builder: (context) => DashboardScreen()),
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
        .showSnackBar(SnackBar(content: Text(value)));
  }
}
