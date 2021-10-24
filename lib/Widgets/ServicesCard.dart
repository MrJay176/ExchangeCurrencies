import 'package:flutter/material.dart';
import 'package:ogbonge/Widgets/LowArea.dart';

Widget servicesCard({BuildContext context , String image_url}){

     return Container(
       width:MediaQuery.of(context).size.width,
       height:MediaQuery.of(context).size.height,
       margin:EdgeInsets.symmetric(horizontal:5 ,vertical:10),
       decoration:BoxDecoration(
           color:Colors.white,
           borderRadius:BorderRadius.circular(25),
           boxShadow:[
             BoxShadow(
               color:Color(0x80000000),
               blurRadius:10.0,
               offset:Offset(0.0, 1.0),
             ),
           ]
       ),
       child:Center(
         child:Column(
           children:[
               Expanded(
                  flex:3,
                 child:Container(
                   height:MediaQuery.of(context).size.height,
                   width:MediaQuery.of(context).size.width,
                   child:Image.asset(
                     image_url,
                     fit:BoxFit.fill,
                     height:MediaQuery.of(context).size.height,
                     width:MediaQuery.of(context).size.width,
                   ),
                 ),
               ),

               Expanded(
                 flex:1,
                 child:Container(
                    child:Text(
                      "Graphic Design Printing",
                       style:TextStyle(
                         color:Colors.black,
                         fontSize:20,
                         fontWeight:FontWeight.bold
                       ),
                    ),
                 ),
               ),

               Expanded(
                  flex:3,
                  child:lowArea(context),
               )
           ],
         ),
       ),
     );

}