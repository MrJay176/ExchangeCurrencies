import 'package:flutter/material.dart';
import 'package:ogbonge/Models/MenuModel.dart';

const kDefaultPadding = 20.0;

List<MenuModel> menuItems = [
  MenuModel(
      menu_name:"Home",
      menu_index:0
  ),
  MenuModel(
      menu_name:"About",
      menu_index:1
  ),
  MenuModel(
      menu_name:"Services",
      menu_index:2
  ),
  MenuModel(
      menu_name:"Share App",
      menu_index:3
  ),
  MenuModel(
      menu_name:"Help & Support",
      menu_index:4
  ),
  MenuModel(
      menu_name:"Notifications",
      menu_index:5
  )
];


const style = TextStyle(
    fontSize:15,
    color:Colors.black,
    fontWeight:FontWeight.bold
);

//String google_key = AIzaSyDmKu9CChC-aTuEJ3upyGz3Gn-pO-ZNHGk;

dynamic MyTextSpan ({String userName , TextStyle textStyle =style}){
  return TextSpan(
    text:userName,
    style:textStyle,
  );
}

const wallet_size = 10.0;