import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:ogbonge/MyScreens/Getstarted.dart';
import 'package:ogbonge/MyScreens/Splash.dart';
import 'package:ogbonge/Utils/loader.dart';
import 'MyScreens/SignUpScreen.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Wait to initialize before moving to line 9
  await Firebase.initializeApp();
  //Line  returns FirebaseApp Instance


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title:'OGBONGE CONNECT',
      home:Scaffold(
          resizeToAvoidBottomInset: true,
          body:SafeArea(
              child:SplashBody()
          )
      ),
    );
  }
}
