import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ogbonge/Models/UserModel.dart';
import 'package:ogbonge/Screens/home_screen.dart';
import 'package:ogbonge/Utils/MyColors.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:ogbonge/Utils/constant.dart';
import 'package:ogbonge/Widgets/CardWidget.dart';
import 'package:ogbonge/Widgets/DisplayColumn.dart';
import 'package:ogbonge/config/palette.dart';


class NavigatorStack extends StatefulWidget{

  NavigatorStack({
    @required this.index_value,
    this.onPressed,
  });

  final int index_value;
  final Function onPressed;

  @override
  State<StatefulWidget> createState() {
    return NavigatorStackState();
  }

}

class NavigatorStackState extends State<NavigatorStack> with TickerProviderStateMixin{

  @override
  void initState(){

  }

  @override
  void dispose() {
    //  widget.channel.sink.close();
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context){

    return Stack(
      children:[
        Visibility(
          visible: widget.index_value == 0 ? true:false,
          child:HomeScreen(),
        ),
        Visibility(
          visible: widget.index_value == 2 ? true:false,
          child:Expanded(
            child: Container(
              width:Get.width,
              color:Colors.white,
              child:HomeProfile(),
            ),
          ),
        ),
        Visibility(
            visible: widget.index_value == 1? true:false,
            child:Container(
                 decoration:BoxDecoration(
                    color:Colors.white
                 ),
                child:HomeDash(
                  onPressed:widget.onPressed,
                )
            )
        ),
      ],
    );
  }

  Padding TopImage({String imageUrl}) {
    return Padding(
      padding:EdgeInsets.all(20),
      child: Container(
          margin:EdgeInsets.symmetric(horizontal:20.0, vertical: 20.0),
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(20.0),
          ),
          child:ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child:Image.network(imageUrl,
                fit:BoxFit.fill,
                width:double.infinity,
              )
          )

      ),
    );
  }

}

class HomeProfile extends StatefulWidget {
  const HomeProfile({
    Key key,
  }) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {

    UserModel userModel = UserModel.two("Joseph","Joseph@gmail.com",true,true,true,true,12345678910.0);
    List<Widget> listWidget = [];
    listWidget=DisplayColumn(apartment:userModel.apartment,services:userModel.services,houseItems:userModel.houseItems,cvs:userModel.cVs ,context: context);
    bool children = true;

    return Column(
      children:[
        Container(
          height:10,
          decoration:BoxDecoration(
              color:Colors.transparent
          ),
          width:MediaQuery.of(context).size.width,
          child:Center(
              child:Text(
                '',
                 style:TextStyle(
                   fontSize:20.0,
                   fontWeight:FontWeight.w800,
                   color:Colors.black87
                 ),
              ),
          )
        ),
        Expanded(
          child: Container(
             color:Colors.white70,
             height:MediaQuery.of(context).size.height,
             margin:EdgeInsets.only(top:10.0),
             child:Column(
               mainAxisAlignment:MainAxisAlignment.start,
                children:[
                   //This Is Profile And Name
                   ProfileContainer(),
                   //Services and Items
                   ServicesItems(),

                   Expanded(
                     child: Container(
                       padding:EdgeInsets.all(10),
                       height:MediaQuery.of(context).size.height*0.7,
                       width:MediaQuery.of(context).size.width,
                       child:Container(
                         height:MediaQuery.of(context).size.height + (MediaQuery.of(context).size.height*0.8),
                         child:Builder(
                           builder:(BuildContext context){

                             Timer timer;
                             var _duration = Duration(seconds:5);

                             timer = Timer(_duration, ()
                             {
                               setState(() {
                                  children = true;
                               });
                             });

                             return SingleChildScrollView(
                               child:Column(
                                 children:listWidget.map((e)=>e).toList()
                               ),
                             );
                           },
                         ),
                       ),
                     ),
                   )
                  //ShowCase Options
                ],
             ),
          ),
        )
      ],
    );
  }
}

class ServicesItems extends StatelessWidget {

  static const ServiceArray = [
    {"number":"1","name":"Apartment"},
    {"number":"3", "name":"HouseHold"},
    {"number":"2" , "name":"Services"},
    {"number":"5" , "name":"CVs"},
  ];

  const ServicesItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height:110,
     padding:EdgeInsets.symmetric(horizontal:6 , vertical:  6),
     width:MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
        color:Palette.primaryColor,
      ),
     child:Container(
         padding:EdgeInsets.only(bottom:5),
         child:ListView.builder(
             itemCount:ServiceArray.length,
             scrollDirection:Axis.horizontal,
             itemBuilder:(context,index){
               return Container(
                  width:100.0,
                  height:100.0,
                  margin:EdgeInsets.symmetric(horizontal:5 ,vertical:10),
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color:Colors.white,
                    boxShadow:[
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 1.5),
                      )
                    ]
                  ),
                  child:Center(
                    child:Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children:[
                             Text.rich(
                                TextSpan(
                                  children:[
                                     MyTextSpan(userName:ServiceArray[index]["name"])
                                  ]
                                )
                             ),

                            Text.rich(
                                TextSpan(
                                    children:[
                                      MyTextSpan(userName:ServiceArray[index]["number"])
                                    ]
                                )
                            )
                          ],
                    ),
                  )
               );
             }
         ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom:10),
      padding:EdgeInsets.symmetric(horizontal:10),
      child:Row(
         children:[
           CircleProfileWid(),
           SizedBox(width:10),
           Column(
             children:[
               Text.rich(
                 TextSpan(
                     children:[
                       MyTextSpan(userName:"Your Profile",textStyle:TextStyle(
                           fontSize:15,
                           color:Colors.black,
                           fontWeight:FontWeight.bold
                       )),
                     ]
                 ),
               ),
               FittedBox(
                 child:Text.rich(
                   TextSpan(
                       children:[
                         MyTextSpan(userName:"Emmanuel Silas John",textStyle:TextStyle(
                             color:Colors.grey[900],
                             fontWeight:FontWeight.bold
                         )),
                       ]
                   ),
                 ),
               ),
               Text.rich(
                   TextSpan(
                       children:[
                         MyTextSpan(userName:"Role:",textStyle:TextStyle(
                             fontSize:13,
                             color:Colors.grey[900],
                             fontWeight:FontWeight.bold
                         )),
                         MyTextSpan(userName:"Corper",textStyle:TextStyle(
                             fontSize:13,
                             color:Colors.grey[900],
                             fontWeight:FontWeight.bold
                         )),
                       ]
                   )
               ),
               SizedBox(height:20,),
               Container(
                 margin:EdgeInsets.only(left:10),
                 child:Row(
                   children:[
                     FaIcon(
                       FontAwesomeIcons.penFancy,
                       size:17,
                       color:Colors.blue,
                     ),
                     SizedBox(width:10,),
                     Text(
                       "Change Profile",
                       style:TextStyle(
                           color:Colors.blue,
                           fontSize:18,
                           fontWeight:FontWeight.w900
                       ),
                     )
                   ],
                 ),
               )

               // OrderButton(text:"Update Profile"),
             ],
           ),
         ],
      ),
    );
  }
}

class CircleProfileWid extends StatelessWidget {
  const CircleProfileWid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child:Container(
          height:150,
          width:150,
          margin:EdgeInsets.only(left:10),
          decoration:BoxDecoration(
              color:Colors.blue,
              shape:BoxShape.circle,
              image:DecorationImage(
                  image:new ExactAssetImage("assets/images/me.jpg",),
                  fit:BoxFit.cover
              )
          ),
        ),
      ),
    );
  }
}

class HomeDash extends StatelessWidget {
  const HomeDash({
    Key key,
    this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          padding:EdgeInsets.symmetric(horizontal:20),
          height:50,
          decoration:BoxDecoration(
            color:Colors.transparent
          ),
          width:MediaQuery.of(context).size.width,
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              InkWell(
                onTap:onPressed,
                child: FaIcon(
                  FontAwesomeIcons.bars,
                  size:25,
                  color:Colors.deepOrangeAccent,
                ),
              ),

              FaIcon(
                FontAwesomeIcons.ellipsisV,
                size:25,
                color:Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin:EdgeInsets.only(top:100),
            padding:EdgeInsets.only(top:20,right:10, left:10),
            decoration:BoxDecoration(
              color:Palette.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x80000000),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                borderRadius:BorderRadius.only(
                  topLeft:Radius.circular(30),
                  topRight: Radius.circular(20),
                ),
              // gradient:TravelColor().appGradient()
            ),
            child:Container(
                child:SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      GridView(
                        physics:NeverScrollableScrollPhysics(),
                        shrinkWrap:true,
                        padding:EdgeInsets.all(2),
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:2,
                            crossAxisSpacing:8.0,
                            mainAxisSpacing:8.0,
                            childAspectRatio:1
                        ),
                        children: [
                          InkWell(
                            onTap:(){
                              onCardClick(type:"Apartment");
                            }, child: MyCard(title: "Apartment finder",message: "Get Apartments within your area with ease , no need to wonder around" , data :FontAwesomeIcons.home, size: MediaQuery.of(context).size)
                          ),
                          InkWell(
                              onTap: (){
                                onCardClick(type:"property");
                              },
                              child:MyCard(title: "Property Trade",    message: "Are you in need of household items? , Get them now with us at cheap prices" , data :FontAwesomeIcons.tools,size: MediaQuery.of(context).size )
                          ),
                          InkWell(
                            onTap: (){
                               onCardClick(type:"services");
                            },
                              child: MyCard(title: "Services", message: "We help You Search For services , Use Our Platform To Get Services around you with ease" , data :FontAwesomeIcons.city,size: MediaQuery.of(context).size )
                          ),
                          InkWell(
                            onTap: (){
                              onCardClick(type:"ppa");
                            },
                              child: MyCard(title: "PPA",message: "We Are Your PPA Search Helper" , data :FontAwesomeIcons.briefcase, size: MediaQuery.of(context).size)
                          ),

                        ],
                      ),
                      Container(
                        margin:EdgeInsets.only(left:9),
                        child: Text.rich(
                          TextSpan(
                            children:[
                               TextSpan(
                                 text:"Hello! Joseph",
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontWeight:FontWeight.normal,
                                    fontSize:17
                                  )
                               )
                            ]
                          )
                        ),
                      ),
                      SizedBox(height:4,),
                      Container(
                        margin:EdgeInsets.only(left:9),
                        child: Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(
                                      text:"Welcome",
                                      style:TextStyle(
                                          color:Colors.blueAccent,
                                          fontWeight:FontWeight.bold,
                                          fontSize:19
                                      )
                                  )
                                ]
                            )
                        ),
                      ),
                      GridView(
                        physics:NeverScrollableScrollPhysics(),
                        shrinkWrap:true,
                        padding:EdgeInsets.all(5),
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:2,
                            crossAxisSpacing:5.0,
                            mainAxisSpacing:5.0
                        ),
                        children: [
                          InkWell(
                            onTap: (){
                              onCardClick(type:"job");
                            },
                              child: MyCard(title: "Job Search",message: "Get Apartments within your area with ease , no need to wonder around" , data :FontAwesomeIcons.businessTime, size: MediaQuery.of(context).size)
                          ),
                          InkWell(
                             onTap: (){
                               onCardClick(type:"cv");
                             },
                              child: MyCard(title: "Cv  Search",message: "Are you in need of Particular Skills? , Get them now with us at cheap prices" , data :FontAwesomeIcons.book,size: MediaQuery.of(context).size )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
          ),
        )
      ],
    );
  }
}


Expanded OrderButton({String text}) {
  return Expanded(
    child: Column(
      mainAxisAlignment:MainAxisAlignment.end,
      children:[
        GestureDetector(
          onTap:(){
            Get.to(null);
          } ,
          child: Container(
            margin:EdgeInsets.symmetric(horizontal:20.0) ,
            height: 30,
            width:double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x80000000),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    TravelColor().color_top,
                    TravelColor().color_end,
                  ],
                )),
            child: Center(
              child: Text(
                'Update Profile',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
