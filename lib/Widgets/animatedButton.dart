

//Animates The Button
import 'package:flutter/material.dart';
import 'package:ogbonge/Utils/MyColors.dart';

Widget animatedButton({Size size , context , String txt}){

  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x80000000),
            blurRadius: 12.0,
            offset: Offset(0.0, 5.0),
          ),
         ],
        ),
    child: Center(
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    ),
  );
}