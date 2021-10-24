import 'package:flutter/material.dart';

class TravelColor{

  //Btn Color
  Color red = Colors.deepOrange[400];
  Color color_top = Colors.deepPurple;
  Color color_end = Colors.deepPurpleAccent;

 Color color_wallet = Colors.black;

  LinearGradient appGradient(){
    return LinearGradient(
          begin:Alignment.topLeft,
          end:Alignment.bottomRight,
          stops:[0.1,0.9] ,
          colors:[
            TravelColor().color_top,
            TravelColor().color_end,
          ],
        );
  }

}