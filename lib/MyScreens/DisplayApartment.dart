import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ogbonge/MyScreens/MapScreen.dart';
import 'package:get/get.dart';

class DisplayApartment extends StatefulWidget {

  DisplayApartment({
    this.apartmentUrl,
    Key key,
    this.apartmentName,
    this.apartmentDescription,
    this.string1,
    this.string2,
    this.string3
  }):super(key:key);

  String apartmentUrl;
  String apartmentName;
  String apartmentDescription;
  String string1;
  String string2;
  String string3;

  @override
  _DisplayApartmentState createState() => _DisplayApartmentState();

}

class _DisplayApartmentState extends State<DisplayApartment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child: Column(
                children:[
                  //Image Container
                  Container(
                      margin:EdgeInsets.all(20),
                      height:MediaQuery.of(context).size.height*0.35,
                      width:MediaQuery.of(context).size.width,
                      decoration:BoxDecoration(
                      color:Colors.grey[300],
                      borderRadius:BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 12.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                      child:Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              widget.apartmentUrl,
                              width:MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.height,
                              fit:BoxFit.cover,
                          ),
                        ),
                      ),
                  ),

                  // //View On Map Button
                  InkWell(
                      onTap:(){
                        Get.to(()=>MapScreen());
                      },
                      child:ViewOnMap()
                  ),


                  // //Description and price
                  Container(
                      width:MediaQuery.of(context).size.width,
                      decoration:BoxDecoration(
                         color:Colors.white
                      ),
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                       children:[
                         Container(
                           width:MediaQuery.of(context).size.width,
                           padding:EdgeInsets.only(left:10),
                           child:Align(
                             alignment:Alignment.centerLeft,
                             child:Column(
                               mainAxisAlignment:MainAxisAlignment.start,
                               crossAxisAlignment:CrossAxisAlignment.start,
                               children: [
                                 Text.rich(
                                     TextSpan(
                                       children:[
                                          TextSpan(
                                            text:"Price: ",
                                            style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:20.0,
                                              fontWeight:FontWeight.bold
                                            )
                                          ),
                                          TextSpan(
                                            text: widget.apartmentName,
                                            style:TextStyle(
                                              color:Colors.black87,
                                              fontWeight:FontWeight.normal,
                                              fontSize:16.0
                                            )
                                          ),
                                       ]
                                     ),
                                 ),
                                 Container(
                                   margin:EdgeInsets.only(top:10),
                                   child: Text(
                                     'Description',
                                      style:TextStyle(
                                        color:Colors.black,
                                        fontSize:13.0,
                                        fontWeight:FontWeight.bold
                                      ),
                                   ),
                                 ),
                                 Container(
                                   margin:EdgeInsets.only(top:10),
                                   width:MediaQuery.of(context).size.width,
                                   child: Align(
                                     alignment:Alignment.centerLeft,
                                     child: Text.rich(
                                       TextSpan(
                                         children:[

                                           TextSpan(
                                               text: widget.apartmentDescription,
                                               style:TextStyle(
                                                   color:Colors.black87,
                                                   fontWeight:FontWeight.normal,
                                                   fontSize:16.0
                                               )
                                           )

                                         ]
                                       )
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin:EdgeInsets.only(top:10),
                                   width:MediaQuery.of(context).size.width,
                                   child: Align(
                                     alignment:Alignment.centerLeft,
                                     child: Text.rich(
                                         TextSpan(
                                             children:[

                                               TextSpan(
                                                   text: widget.string1,
                                                   style:TextStyle(
                                                       color:Colors.black87,
                                                       fontWeight:FontWeight.normal,
                                                       fontSize:16.0
                                                   )
                                               )

                                             ]
                                         )
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin:EdgeInsets.only(top:10),
                                   width:MediaQuery.of(context).size.width,
                                   child: Align(
                                     alignment:Alignment.centerLeft,
                                     child: Expanded(
                                       child: FittedBox(
                                         child: Text.rich(
                                             TextSpan(
                                                 children:[

                                                   TextSpan(
                                                       text: widget.string2,
                                                       style:TextStyle(
                                                           color:Colors.black87,
                                                           fontWeight:FontWeight.normal,
                                                           fontSize:16.0
                                                       )
                                                   )

                                                 ]
                                             )
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin:EdgeInsets.only(top:10),
                                   width:MediaQuery.of(context).size.width,
                                   child: Align(
                                     alignment:Alignment.centerLeft,
                                     child: Text.rich(
                                         TextSpan(
                                             children:[

                                               TextSpan(
                                                   text: widget.string3,
                                                   style:TextStyle(
                                                       color:Colors.black87,
                                                       fontWeight:FontWeight.normal,
                                                       fontSize:16.0
                                                   )
                                               )

                                             ]
                                         )
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         )
                       ],
                    ),
                  ),

                  InkWell(
                    onTap:(){

                    },
                    child: Container(
                      height:70.0,
                      margin:EdgeInsets.only(top:30),
                      color:Colors.grey[300],
                      width:MediaQuery.of(context).size.width,
                      child:Row(
                        children:[
                          Expanded(
                            child: Container(
                              height:50.0,
                              margin:EdgeInsets.symmetric(horizontal:10.0,),
                              decoration:BoxDecoration(
                                  color:Colors.deepOrange[600]
                              ),
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children:[
                                  Text(
                                    'Book Now',
                                    style:TextStyle(
                                        fontSize:20.0,
                                        color:Colors.white,
                                        fontWeight:FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // //Add To Cart
                  // Container(
                  //
                  //)

                ],
              ),
            ),
          ),
        )
    );
  }


}

class ViewOnMap extends StatelessWidget {
  const ViewOnMap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding:EdgeInsets.symmetric(horizontal:10),
       height:60.0,
       width:MediaQuery.of(context).size.width,
       decoration:BoxDecoration(
          color:Colors.white
       ),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children:[
             Text.rich(
               TextSpan(
                 children:[
                   TextSpan(
                     text:"View On ",
                     style:TextStyle(
                       color:Colors.black,
                       fontSize:18.0
                     )
                   ),
                   TextSpan(
                     text:"Map",
                     style:TextStyle(
                       color:Colors.deepOrange,
                       fontSize:18.0,
                       fontWeight:FontWeight.bold
                     )
                   )
                 ]
               )
             ),

            FaIcon(
              FontAwesomeIcons.map,
              size:20,
              color:Colors.deepOrange,
            )
        ],
      ),
    );
  }
}
