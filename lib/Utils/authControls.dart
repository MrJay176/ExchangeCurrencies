import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ogbonge/Models/UserModel.dart';
import 'package:ogbonge/Screens/Login/login_screen.dart';
import 'package:ogbonge/Screens/screens.dart';
import 'package:ogbonge/Utils/SharedPreference.dart';
import 'package:ogbonge/Widgets/NavigatorStack.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';



class FireBaseAuthServiceSignUp {

  FireBaseAuthServiceSignUp();

  //Check if User Already Registered
  Future<Stream<User>> AleadyRegistered() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    Stream<User> stream = await auth.authStateChanges();
    return stream;
  }


   SignUpUser({
    @required String email,
    @required String password,
     @required String name,
    @required BuildContext context
  }) async {

    try {

      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("User SignUp Complete");
      UserModel userModel = UserModel();
      userModel.userName = name;
      userModel.wallet = 0.00;
      userModel.email = email;
      userModel.walletType = "null";
      SharedPreferenceFile sharedPreferenceFile = SharedPreferenceFile();
      SharedPreferences prefs =await SharedPreferences.getInstance();
      sharedPreferenceFile.saveUser(userModel,prefs);
      Navigator.of(context).push(new MaterialPageRoute(builder:(context){
        return HomeScreen();
      }));
      //if User Created Save Details
    } on FirebaseException catch (e) {
      print("Error ${e.message}");
      return "e";
    }
  }

  Future<String> LoginUser({
    @required String email,
    @required String password,
    @required String username,
    BuildContext context
  }) async {
    print("Sign In User Function Triggered");
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        print("Sign In Succesful "+value.user.uid+" Email:"+value.user.email);
        UserModel userModel = UserModel();
        userModel.userName = username;
        userModel.wallet = 0.00;
        userModel.email = email;
        userModel.walletType = "null";
        SharedPreferenceFile sharedPreferenceFile = SharedPreferenceFile();
        SharedPreferences prefs =await SharedPreferences.getInstance();
        sharedPreferenceFile.saveUser(userModel,prefs);
        Navigator.of(context).push(new MaterialPageRoute(builder:(context){
          return HomeScreen();
        }));

        return value.user.uid;
      });

    } on FirebaseException catch (e){
      print("Error ${e.message}");
      return "e";
    }
  }

}
