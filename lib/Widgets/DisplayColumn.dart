import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogbonge/Container/ApartmentContainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ogbonge/Utils/MyColors.dart';
import 'package:ogbonge/Utils/constant.dart';
import 'package:ogbonge/Widgets/CvWidget.dart';
import 'package:ogbonge/Widgets/ServicesCard.dart';
import 'NavigatorStack.dart';

List<Widget> DisplayColumn({bool apartment = false, bool houseItems = false , bool services = false , bool cvs = false,BuildContext context }){

  List<Widget> myWidget = [];

  const ServiceArray = [
    {"number":"1",  "url":"assets/images/Apartments/houseone.jpeg"},
    {"number":"2",  "url":"assets/images/Apartments/housetwo.jpeg"},
    {"number":"3",  "url":"assets/images/Apartments/housethree.jpeg"},
    {"number":"4",  "url":"assets/images/Apartments/housefour.jpeg"},
    {"number":"5",  "url":"assets/images/Apartments/housefive.jpeg"},
  ];

  const HouseItems = [
    {"number":"1",  "url":"assets/images/HouseItems/houseone.jpeg"},
    {"number":"2",  "url":"assets/images/HouseItems/housetwo.jpeg"},
    {"number":"3",  "url":"assets/images/HouseItems/housethree.jpeg"},
    {"number":"4",  "url":"assets/images/HouseItems/housefour.jpeg"},
  ];

  Widget walletWidget(Size size){
    return Container(
      width:MediaQuery.of(context).size.width,
      height:100,
      child:Column(
        children:[
          Expanded(
            flex:1,
            child: Container(
               width:size.width,
               child:Row(
                 children:[],
               ),
            ),
          ),

          Expanded(
            flex:2,
            child: Row(
              children:[
                 //Current Balance
                  Expanded(
                    flex:2,
                    child:Container(
                      child:Column(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children:[
                          Text.rich(
                            TextSpan(
                              children:[
                                MyTextSpan(
                                  userName:"Current Balance",
                                  textStyle:TextStyle(
                                    fontSize:wallet_size,
                                    color:TravelColor().color_wallet,
                                  )
                                )
                              ]
                            )
                          ),
                          Align(
                            alignment:Alignment.centerLeft,
                            child: Text.rich(
                                TextSpan(
                                    children:[
                                      MyTextSpan(
                                        userName:"N91280.00", textStyle:TextStyle(
                                            fontSize:wallet_size,
                                            fontWeight:FontWeight.bold,
                                            color:TravelColor().color_wallet,
                                          )
                                      )
                                    ]
                                )
                            ),
                          ),
                          Align(
                            alignment:Alignment.centerLeft,
                            child: Text.rich(
                                TextSpan(
                                    children:[
                                      MyTextSpan(
                                        userName:"Credit Wallet",
                                        textStyle:TextStyle(
                                        fontSize:wallet_size,
                                        fontWeight:FontWeight.bold,
                                        color:Colors.blueAccent,
                                       )
                                      )
                                    ]
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                //Withdrawn
                Expanded(
                  flex:2,
                  child:Container(
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:[
                        Align(
                          alignment:Alignment.topLeft,
                          child: Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                       userName:"WithDrawn",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          color:TravelColor().color_wallet,
                                        )
                                    )
                                  ]
                              )
                          ),
                        ),

                        Align(
                          alignment:Alignment.centerLeft,
                          child: Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                      userName:"N2100.00",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          fontWeight:FontWeight.bold,
                                          color:TravelColor().color_wallet,
                                        )
                                    )
                                  ]
                              )
                          ),
                        )

                      ],
                    ),
                  ),
                ),

                //Used For Purchases
                Expanded(
                  flex:2,
                  child:Container(
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:[
                        Text.rich(
                            TextSpan(
                                children:[
                                  MyTextSpan(
                                    userName:"Used For Purchases",
                                      textStyle:TextStyle(
                                        fontSize:wallet_size,
                                        color:TravelColor().color_wallet,
                                      )
                                  ),
                                ]
                            )
                        ),
                        Align(
                          alignment:Alignment.centerLeft,
                          child:Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                      userName:"N40140.00",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          color:TravelColor().color_wallet,
                                          fontWeight:FontWeight.bold
                                        )
                                    ),
                                  ]
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Pending Clearance
                Expanded(
                  flex:2,
                  child:Container(
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:[
                        Text.rich(
                            TextSpan(
                                children:[
                                  MyTextSpan(
                                    userName:"Pending Clearance",
                                      textStyle:TextStyle(
                                        fontSize:wallet_size,
                                        color:TravelColor().color_wallet,
                                      )
                                  ),
                                ]
                            )
                        ),

                        Align(
                          alignment:Alignment.centerLeft,
                          child: Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                      userName:"N0.00",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          fontWeight:FontWeight.bold,
                                          color:TravelColor().color_wallet,
                                        )
                                    ),
                                  ]
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Available for withdrawal
                Expanded(
                  flex:2,
                  child:Container(
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:[
                        Text.rich(
                            TextSpan(
                                children:[
                                  MyTextSpan(
                                    userName:"Available For Withdrawal",
                                      textStyle:TextStyle(
                                        fontSize:wallet_size,
                                        color:TravelColor().color_wallet,
                                      )
                                  ),
                                ]
                            )
                        ),

                        Align(
                          alignment:Alignment.centerLeft,
                          child: Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                      userName:"N420",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          fontWeight:FontWeight.bold,
                                          color:TravelColor().color_wallet,
                                        )
                                    ),
                                  ]
                              )
                          ),
                        ),

                        Align(
                          alignment:Alignment.centerLeft,
                          child: Text.rich(
                              TextSpan(
                                  children:[
                                    MyTextSpan(
                                      userName:"Withdraw",
                                        textStyle:TextStyle(
                                          fontSize:wallet_size,
                                          fontWeight:FontWeight.bold,
                                          color:Colors.blueAccent,
                                        )
                                    ),
                                  ]
                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget ApartmentWidget () {
         return Container(
           height:400,
           width:MediaQuery.of(context).size.width,
           padding:EdgeInsets.only(bottom:1),
           child:Column(
             children: [
               TitleDescription(title:"My Apartments",icon:FontAwesomeIcons.building,),
               Expanded(
                 flex:3,
                 child:ListView.builder(
                     itemCount:ServiceArray.length,
                     scrollDirection:Axis.horizontal,
                     itemBuilder:(context,index){
                       return ApartmentContainer(url:ServiceArray[index]["url"],);
                     }
                 ),
               ),
             ],
           ),
         );
  }

  Widget HouseItemsWWidget(){
     return Container(
       height:400,
       width:MediaQuery.of(context).size.width,
       padding:EdgeInsets.only(bottom:5),
       child:Column(
         children: [
           TitleDescription(title:"HouseItems",icon:FontAwesomeIcons.toolbox,),
           Expanded(
             flex:3,
             child: ListView.builder(
                 itemCount:HouseItems.length,
                 scrollDirection:Axis.horizontal,
                 itemBuilder:(context,index){
                   return ApartmentContainer(url:HouseItems[index]["url"],);
                 }
             ),
           ),
         ],
       ),
     );
  }

  Widget ServicesWidget(){
    return Container(
      height:400,
      width:MediaQuery.of(context).size.width,
      padding:EdgeInsets.only(bottom:5),
      child:Column(
        children: [
          TitleDescription(title:"My Services",icon:FontAwesomeIcons.tools,),
          Expanded(
            flex:4,
            child: ListView.builder(
                itemCount:5,
                scrollDirection:Axis.horizontal,
                itemBuilder:(context,index){
                  return servicesCard(context:context,image_url:ServiceArray[index]["url"]);
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget CvsWidget(){
    return Container(
      height:280,
      width:MediaQuery.of(context).size.width,
      padding:EdgeInsets.only(bottom:5),
      child:Column(
        children: [
          TitleDescription(title:"Cvs",icon:FontAwesomeIcons.book,),
          Expanded(
            flex:3,
            child:ListView.builder(
                itemCount:5,
                scrollDirection:Axis.horizontal,
                itemBuilder:(context,index){
                  return CvWidget(context);
                }
            ),
          ),
        ],
      ),
    );
  }

  myWidget.add(walletWidget(MediaQuery.of(context).size));

  if(apartment) {
    myWidget.add(ApartmentWidget());
   }

  if(houseItems){
    myWidget.add(HouseItemsWWidget());
  }

  if(services){
    myWidget.add(ServicesWidget());
  }

  if(cvs){
    myWidget.add(CvsWidget());
  }

  return myWidget;

}

class TitleDescription extends StatelessWidget {
  const TitleDescription({
    Key key,
    this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
       flex:1,
       child:Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            Row(
              children:[
                FaIcon(
                  icon,
                  size:25,
                ),
                SizedBox(width:5,),
                Text.rich(
                    TextSpan(
                        children:[
                          TextSpan(
                              text:title,
                              style:TextStyle(
                                  color:Colors.black,
                                  fontSize:18.0,
                                  fontWeight:FontWeight.normal
                              )
                          ),
                        ]
                    )
                ),
              ],
            ),
            InkWell(
              onTap:onPressed,
              child: Container(
                width:MediaQuery.of(context).size.width*.5,
                child: Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:[
                    Text.rich(
                        TextSpan(
                            children:[
                              TextSpan(
                                  text:"view more",
                                  style:TextStyle(
                                      color:Colors.blueAccent,
                                      fontSize:11.0,
                                      fontWeight:FontWeight.bold
                                  )
                              ),
                            ]
                        )
                    ),
                    SizedBox(width:5,),
                    FaIcon(
                      FontAwesomeIcons.arrowCircleRight,
                      size:16,
                    ),

                  ],
                ),
              ),
            )
          ],
       ),
    );
  }
}
