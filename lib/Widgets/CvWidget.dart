import 'package:flutter/material.dart';
import 'package:ogbonge/Utils/constant.dart';

Widget CvWidget(BuildContext context){

  return Container(
       height:265,
       width:MediaQuery.of(context).size.width,
       child:Stack(
         children:[
           Positioned(
             top:75,
             bottom:75,
             left:75,
             child:Container(
               padding:EdgeInsets.only(right:7.0),
               width:245,
               height:70,
               decoration:BoxDecoration(
                 color:Colors.blue,
                 borderRadius:BorderRadius.only(topRight:Radius.circular(50),bottomRight:Radius.circular(50)),
                   boxShadow: [
                     BoxShadow(
                       color: Color(0x80000000),
                       blurRadius:12.0,
                       offset: Offset(0.0, 5.0),
                     ),
                   ],
               ),
               child:Align(
                 alignment:Alignment.centerRight,
                 child:Text.rich(
                    TextSpan(
                      children:[
                        MyTextSpan(userName:"SoftwarePortfolio.pdf")
                      ]
                    )
                 ),
               ),
             ),
           ),
           Container(
             height:150.0,
             width:150.0,
            child:Center(
               child:Container(
                 height:150,
                 width:150,
                 margin:EdgeInsets.only(left:10),
                 decoration:BoxDecoration(
                     color:Colors.grey,
                     shape:BoxShape.circle,
                     image:DecorationImage(
                         image:new ExactAssetImage("assets/images/me.jpg",),
                         fit:BoxFit.cover
                     )
                 ),
               ),
             ),
           ),
         ],
       ),
  );

}