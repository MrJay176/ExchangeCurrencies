import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:ogbonge/MyScreens/SignUpScreen.dart';
import 'package:ogbonge/config/palette.dart';
import 'package:ogbonge/mainTwo.dart';

class Getstarted extends StatefulWidget {

  @override
  _GetstartedState createState() => _GetstartedState();

}

class _GetstartedState extends State<Getstarted> {

  static const images = [
    {'description':"Make Payment Easily Across The Globe"   ,'image':'assets/images/tenenacy.jpg'},
    {'description':"Get Connected To WhatEver You Want Through Us"   , 'image':'assets/images/tenency_three.jpg'},
    {'description':"Save Your Time And Get Transfers Quickly Through Us" , 'image':'assets/images/tenancy_four.jpg'},
    {'description':"Affordable And Comfortable Payment For Our Clients" , 'image':'assets/images/tenancy_two.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body:SafeArea(
        child:Container(
          color:Colors.grey[300],
           height:MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           child:Column(
              children:[
                Expanded(
                  flex:1,
                  child: Container(
                    height:MediaQuery.of(context).size.height,
                    child: Center(
                      child:Text(
                        'Exchange Currencies',
                        style:TextStyle(
                            fontSize:30.0,
                            color:Palette.primaryColor,
                            fontWeight:FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex:2,
                    child:Container(
                      margin:EdgeInsets.all(10.0),
                      decoration:BoxDecoration(
                        color:Colors.grey[300],
                        borderRadius:BorderRadius.circular(30)
                      ),
                      child:Swiper(
                        itemCount:images.length,
                        pagination:new SwiperPagination(),
                        control:new SwiperControl(),
                         itemBuilder:(context,index){
                              return Container(
                                margin:EdgeInsets.only(bottom:10),
                                decoration:BoxDecoration(
                                    color:Colors.grey[300],
                                    borderRadius:BorderRadius.circular(30)
                                ),
                                  height:MediaQuery.of(context).size.height,
                                  child:Column(
                                    children: [
                                      Expanded(
                                        flex:4,
                                        child: Container(
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
                                          child: Center(
                                            child:ClipRRect(
                                              borderRadius: BorderRadius.circular(30.0),
                                              child: Image.asset(
                                                  '${images[index]["image"]}',
                                                   width:MediaQuery.of(context).size.width,
                                                   height:MediaQuery.of(context).size.height,
                                                   fit:BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          height:MediaQuery.of(context).size.height,
                                          child: Center(
                                            child: Text(
                                              '${images[index]['description']}',
                                              style:TextStyle(
                                                  fontSize:13.0,
                                                  color:Colors.grey[900],
                                                  fontWeight:FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                         },

                      ),
                    ),
                  ),
                Expanded(
                  flex:1,
                  child:Container(
                      child:Column(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap:(){
                               Get.to(()=>LoginGateWay());
                            },
                            child: Container(
                              height:70.0,
                              padding:EdgeInsets.only(bottom:20.0),
                              color:Colors.grey[300],
                              width:MediaQuery.of(context).size.width,
                              child:Row(
                                children:[
                                   Expanded(
                                     child: Container(
                                       height:50.0,
                                       margin:EdgeInsets.symmetric(horizontal:10.0,),
                                       decoration:BoxDecoration(
                                         color:Palette.primaryColor
                                       ),
                                       child:Row(
                                         mainAxisAlignment:MainAxisAlignment.center,
                                         children:[
                                           Text(
                                             'Get Started',
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
                        ],
                      ),
                  ),
                )
              ],
           ),
        ),
      ),
    );
  }

}
