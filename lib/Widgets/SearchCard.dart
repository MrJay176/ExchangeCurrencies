import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ogbonge/Models/Display.dart';
import 'package:ogbonge/Models/TitleString.dart';
import 'package:ogbonge/Utils/MyColors.dart';

Widget cardDescription ({@required String description , Size size}){

  return Container(
    margin:EdgeInsets.symmetric(horizontal:10),
     child: ClipRRect(
      borderRadius:BorderRadius.circular(15),
      child:Container(
          decoration:BoxDecoration(
              shape:BoxShape.rectangle,
          ),
        height: size.height*0.3,
        width:  size.width,
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.start,
          children:[
          Container(
            padding:EdgeInsets.only(left:6 ,top:6),
            child:Text(
             description,
             style:TextStyle(
               color:Colors.black,
               fontWeight:FontWeight.bold,
               fontSize:13.0
              ),
             ),
           ),
            Expanded(
              child: Container(
                height:size.height*0.29,
                width:size.width,
                decoration:BoxDecoration(
                    color:Colors.black87,
                    shape:BoxShape.rectangle,
                    image:DecorationImage(
                        image:new ExactAssetImage("assets/images/search.jpeg",),
                        fit:BoxFit.fill
                    )
                ),
                padding:EdgeInsets.only(left:6 ,top:6),
              ),
            ),
         ]
        ),
      ),
    ),
  );
}

Widget TitleTile({String text}){
  return Container(
    margin:EdgeInsets.symmetric(vertical:5,horizontal:5),
    decoration:BoxDecoration(
        gradient:TravelColor().appGradient(),
        borderRadius:BorderRadius.circular(15),
    ),
    padding:EdgeInsets.symmetric(horizontal:10),
    height:50,
    width:double.infinity,
    child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Expanded(
          flex:5,
          child:Container(
            margin:EdgeInsets.only(left:10),
            width:Get.width,
            child:Center(
               child:Text(
                text,
                style:TextStyle(
                     color:Colors.white,
                     fontWeight:FontWeight.normal,
                     fontSize:19.0
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex:1,
          child:Container(
            child:Align(
              alignment:Alignment.centerRight,
              child:FaIcon(
                FontAwesomeIcons.plus,
                size:16,
                color:Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget Locations({String text}){
  return Container(
    margin:EdgeInsets.symmetric(vertical:5,horizontal:5),
    decoration:BoxDecoration(
      borderRadius:BorderRadius.circular(15),
      color:Colors.grey[350]
    ),
    padding:EdgeInsets.symmetric(horizontal:10),
    height:50,
    width:double.infinity,
    child:Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[
        Text(
          text,
          style:TextStyle(
              color:Colors.black,
              fontWeight:FontWeight.bold,
              fontSize:16.0
          ),
        ),
        FaIcon(
          FontAwesomeIcons.searchLocation,
          size:16,
          color:Colors.deepOrangeAccent,
        ),
      ],
    ),
  );
}

Display displayOne = Display( "assets/images/search.jpeg" ,"Search For Products , Or Apartment By Typing Location");
TitleString titleState = TitleString("Choose State", "title");
TitleString titleLocalDes = TitleString("Choose Below The State You Need an Apartment ", "title");
List<dynamic> LocationList = [
  displayOne,
  titleState,
  titleLocalDes,
  "lagos",
  "Abia",
  "Umuayai",
  "Adamawa",
  "yola",
  "calabar",
  "yola",
  "kanu",
  "kastina",
  "kaduna",
  "Enugu",
  "sokoto",
  "Eket",
  "portharcort",
  "Abuja"
];

Display displayLocal = Display( "assets/images/search.jpeg" ,"Search For Products , Or Apartment By Typing Location");
TitleString titleLocalGov = TitleString("Choose Local Gov", "title");
TitleString titleLocalGovTwo = TitleString("Choose Local Government Area You Need an Apartment ", "title");
List<dynamic> locationLocalGov = [
    displayLocal,
    titleLocalGov,
    titleLocalGovTwo,
    "Ibesikpo",
    "Etinan",
    "Oron",
    "Eket",
    "Aka Road",
    "Abak Road",
    "Ekom Iman",
    "Atiku",
    "Ikot Ekpene",
    "Nwaniba",
    "Ifa Road",
];

 Widget checkTypeItem({var obj , Size size , String description ,  String title}){
   Type type = obj.runtimeType;
   switch(type){
     case String:
       return Locations(text:obj);
       break;
     case Display:
       return cardDescription(description:(description == null)?
       "Search For Products , Or Apartment By Typing Location":description,size:size);
       break;
     case TitleString:
       return TitleTile(text:obj.myDes);
       break;
   }
}