import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogbonge/MyScreens/SearchScreen.dart';
import 'package:get/get.dart';

Widget MyCard ({String title , String message , IconData data , Size size , String type}){

  return Container(
    width:size.width*2,
    height:size.height*5,
    margin:EdgeInsets.only(bottom:5),
    decoration:BoxDecoration(
       color:Colors.white,
       borderRadius:BorderRadius.circular(10),
       boxShadow:[
        BoxShadow(
          color: Color(0x80000000),
          blurRadius:7.0,
          offset:Offset(0.0, 4.0),
        ),
      ],
    ),
    padding:EdgeInsets.all(1.0),
    child:Column(
       mainAxisAlignment:MainAxisAlignment.start,
       crossAxisAlignment:CrossAxisAlignment.start,
       children:[

           Expanded(
               flex:2,
               child: Container(
                   child:new Icon(data,size:30.0,color:Colors.deepOrange)
               )
           ),

           Expanded(
             flex:1,
             child: Container(
               child:Text(
                   title,
                   style:TextStyle(
                     fontWeight:FontWeight.bold
                   ),
               ),
             ),
           ),

           Expanded(
             flex:3,
             child: Container(
               child:Text(
                  message,
               ),
             ),
           )
       ],
    ),
  );
}

onCardClick({String type}){
      Get.to(()=>SearchScreen(type:type,));
}