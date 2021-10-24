import 'package:flutter/material.dart';

Widget lowArea(BuildContext context){

  return Container(
    height:MediaQuery.of(context).size.height,
    width:MediaQuery.of(context).size.width,
    padding:EdgeInsets.only(left:7),
    child:Column(
      mainAxisAlignment:MainAxisAlignment.start,
      children:[
        //Single Room
        Expanded(
          flex:1,
          child:Container(
            width:MediaQuery.of(context).size.width,
            child:Align(
              alignment:Alignment.centerLeft,
              child:FittedBox(
                child:Text(
                   "Single Room",
                   style:TextStyle(
                      color:Colors.black87,
                      fontWeight:FontWeight.bold
                   ),
                ),
              ),
            ),
          ),
        ),

        //Street Address
        Expanded(
          flex:1,
          child: Row(
             children:[
               Icon(
                   Icons.location_on,
                   color:Colors.black87,
                   size:10,
               ),
               FittedBox(
                 child: Text(
                   '12 Udoh Ekong Ekwere Street Uyo Akwa Ibom',
                    style:TextStyle(
                      color:Colors.black54
                    ),
                 ),
               )
             ],
          ),
        ),

        //Available In
        Expanded(
          flex:2,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
             children:[
               Expanded(
                 flex:1,
                 child:Container(
                   width:MediaQuery.of(context).size.width,
                   child:Align(
                     alignment:Alignment.centerLeft,
                     child: FittedBox(
                       child:Text(
                         "Available in",
                         style:TextStyle(
                           color:Colors.black54,
                           fontWeight:FontWeight.bold
                         ),
                       ),
                     ),
                   ),
                 ),
               ),

               Expanded(
                 flex:5,
                 child:Row(
                   children:[
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Column(
                           children:[
                             Expanded(
                               flex:2,
                               child:Container(
                                 width:MediaQuery.of(context).size.width,
                                 margin:EdgeInsets.only(bottom:1),
                                 padding:EdgeInsets.all(6),
                                 decoration:BoxDecoration(
                                   borderRadius:BorderRadius.circular(2),
                                   color:Colors.blue[900],
                                 ),
                                 child:Center(
                                   child: Text(
                                     "326",
                                     style:TextStyle(
                                       color:Colors.white,
                                       fontWeight:FontWeight.bold,
                                       fontSize:10
                                     ),
                                   ),
                                 ) ,
                               ),
                             ),
                             Expanded(
                               flex:1,
                               child: FittedBox(
                                 child: Text(
                                   "days",
                                   style:TextStyle(
                                      color:Colors.lightBlue
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child:Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Column(
                           children: [
                             Expanded(
                               flex:2,
                               child:Container(
                                 width:MediaQuery.of(context).size.width,
                                 padding:EdgeInsets.all(6),
                                 margin:EdgeInsets.only(bottom:1),
                                 decoration:BoxDecoration(
                                   borderRadius:BorderRadius.circular(2),
                                   color:Colors.blue[900],
                                 ),
                                 child:Center(
                                   child:Text(
                                     "326",
                                     style:TextStyle(
                                         color:Colors.white,
                                         fontWeight:FontWeight.bold,
                                         fontSize:10
                                     ),
                                   ),
                                 ) ,
                               ),
                             ),
                             Expanded(
                               flex:1,
                               child:FittedBox(
                                 child: Text(
                                   "days",
                                   style:TextStyle(
                                       color:Colors.lightBlue
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Column(
                           children: [
                             Expanded(
                               flex:2,
                               child:Container(
                                 width:MediaQuery.of(context).size.width,
                                 padding:EdgeInsets.all(6),
                                 margin:EdgeInsets.only(bottom:1),
                                 decoration:BoxDecoration(
                                   borderRadius:BorderRadius.circular(2),
                                   color:Colors.blue[900],
                                 ),
                                 child:Center(
                                   child:Text(
                                     "326",
                                     style:TextStyle(
                                         color:Colors.white,
                                         fontWeight:FontWeight.bold,
                                         fontSize:10
                                     ),
                                   ),
                                 ) ,
                               ),
                             ),
                             Expanded(
                               flex:1,
                               child:FittedBox(
                                 child: Text(
                                   "days",
                                   style:TextStyle(
                                       color:Colors.lightBlue,
                                       fontSize:10
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child:Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Column(
                           children:[
                             Expanded(
                               flex:2,
                               child: Container(
                                 width:MediaQuery.of(context).size.width,
                                 padding:EdgeInsets.all(6),
                                 margin:EdgeInsets.fromLTRB(0,0,0,1),
                                 decoration:BoxDecoration(
                                   borderRadius:BorderRadius.circular(2),
                                   color:Colors.blue[900],
                                 ),
                                 child:Center(
                                   child:Text(
                                     "326",
                                     style:TextStyle(
                                         color:Colors.white,
                                         fontWeight:FontWeight.bold,
                                          fontSize:10
                                     ),
                                   ),
                                 ) ,
                               ),
                             ),
                             Expanded(
                               flex:1,
                               child:FittedBox(
                                 child: Text(
                                   "days",
                                   style:TextStyle(
                                       color:Colors.lightBlue
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               )
             ],
          ),
        ),

        // Expanded(
        //   child:Container(
        //     width:MediaQuery.of(context).size.width,
        //     child:Column(
        //       mainAxisAlignment:MainAxisAlignment.start,
        //       crossAxisAlignment:CrossAxisAlignment.start,
        //       children:[
        //         Expanded(
        //           child:FittedBox(
        //             child: Text(
        //               'Update',
        //               style:TextStyle(
        //                 color:Colors.blueAccent
        //               ),
        //             ),
        //           ),
        //         ),
        //
        //         Expanded(
        //           child: FittedBox(
        //             child: Text(
        //               'Delete',
        //               style:TextStyle(
        //                   color:Colors.redAccent
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    ),
  );

}