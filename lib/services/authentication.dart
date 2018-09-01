import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_metrics/models/userdata.dart';

class UserAuth {

  //To verify new User
  Future<String> verifyUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return "Login Successfull";
  }
}