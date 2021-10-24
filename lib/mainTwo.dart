import 'package:flutter/material.dart';
import 'package:ogbonge/Screens/Welcome/welcome_screen.dart';
import 'package:ogbonge/constants.dart';

class LoginGateWay extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Flutter Auth',
      theme:ThemeData(
        primaryColor:kPrimaryColor,
        scaffoldBackgroundColor:Colors.white,
      ),
      home:WelcomeScreen(),
    );
  }
}
