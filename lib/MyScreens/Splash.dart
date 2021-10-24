import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ogbonge/MyScreens/Getstarted.dart';
import 'package:ogbonge/Utils/MyColors.dart';
import 'package:ogbonge/config/palette.dart';




class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        body:SplashBody(),
      ),
    );
  }
}

class SplashBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }

}

class SplashState extends State<SplashBody>{
  Logic logic;

  checkTimer()async{
    logic.waitSec(time:5);
  }

  @override
  Widget build(BuildContext context) {
    logic = Logic(context);
    checkTimer();
    return Container(
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        gradient:TravelColor().appGradient()
      ),
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            "Exchange Currencies",
            style: TextStyle(
                color:Colors.white,
                fontWeight:FontWeight.normal,
                fontSize:30.0,
                fontFamily:"Italianno"
            ),
          ),
          SizedBox(height:20,),
          Text(
            "Welcome",
            style: TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.bold,
              fontSize:20.0,
              fontFamily: "Montserrat",
            ),
          ),
          SizedBox(height:20,),
          Text(
            "Connections Everywhere",
            style: TextStyle(
                color:Colors.white,
                fontWeight:FontWeight.bold,
                fontFamily: "Montserrat",
                fontSize:15.0
            ),
          ),

        ],
      ),
    );
  }

}


class Logic {

  BuildContext context;

  Logic(BuildContext con){
    context = con;
  }

  Future<void> waitSec({int time}) async {
    Timer timer;
    var _duration = Duration(seconds: time);

    timer = Timer(_duration, ()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context )=> Getstarted()));
    });
  }

}
