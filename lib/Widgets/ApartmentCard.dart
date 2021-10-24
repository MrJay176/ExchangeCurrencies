import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogbonge/Models/Apartment.dart';
import 'package:ogbonge/MyScreens/Apartments.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ogbonge/Widgets/LowArea.dart';

List<Apartment> apartments = [

   Apartment(
     "assets/images/HouseItems/houseone.jpeg",
     "N250,000",
     FontAwesomeIcons.building,
     "Self Con",
   ),

   Apartment(
     "assets/images/HouseItems/housetwo.jpeg",
     "N150,000",
     FontAwesomeIcons.building,
     "2 Bed Flat",
   ),

  Apartment.fromApartment(
   Apartment(
     "assets/images/HouseItems/housethree.jpeg",
     "N300,000",
     FontAwesomeIcons.building,
     "6 bed room flat",
   ),
  ),
   Apartment(
     "assets/images/HouseItems/housefour.jpeg",
     "N250,000",
     FontAwesomeIcons.building,
     "4 bed room flat",
   ),

   Apartment(
     "assets/images/Apartments/housefive.jpeg",
     "N230,000",
     FontAwesomeIcons.building,
     "2 bed room flat",
   ),

   Apartment(
      "assets/images/Apartments/housefour.jpeg",
      "N100,000",
      FontAwesomeIcons.building,
      "1 bed room flat",
   ),

   Apartment(
      "assets/images/Apartments/housethree.jpeg",
      "N50,000",
      FontAwesomeIcons.building,
      "student self con",
   ),

   Apartment(
      "assets/images/Apartments/housetwo.jpeg",
      "N70,000",
      FontAwesomeIcons.building,
      "Story Building",
   ),

   Apartment(
      "assets/images/Apartments/houseone.jpeg",
      "N500,000",
      FontAwesomeIcons.building,
      "Full House , Self Con",
   ),

   Apartment(
      "assets/images/HouseItems/housefour.jpeg",
      "N500,000",
      FontAwesomeIcons.building,
     "Full House , Self Con",
   ),

];


Widget apartmentC({String apartmentImage,String apartmentPrice,IconData data,Size size,String type,BuildContext context}) {

  return Container(
    width:size.width*0.5,
    height:400,
    margin:EdgeInsets.only(bottom:1),
    decoration:BoxDecoration(
      color:Colors.grey[200],
      borderRadius:BorderRadius.circular(8),
      boxShadow:[
        BoxShadow(
          color: Color(0x80000000),
          blurRadius:7.0,
          offset:Offset(0.0, 4.0),
        ),
      ],
    ),
    child:Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        //Image Of Apartment
        Expanded(
            flex:4,
            child:Container(
              width:size.width,
              padding:EdgeInsets.symmetric(horizontal:4),
              child:ClipRRect(
                borderRadius:BorderRadius.circular(20),
                child:Image.asset(
                  apartmentImage,
                  fit:BoxFit.fill,
                  height:size.height,
                  width:size.width,
                ),
              ),
            )
        ),
        Expanded(
          flex: 2,
            child:lowArea(context)
        ),

      ],
    ),
  );
}

onCardClick({String type}){
  Get.to(()=>Apartments());
}