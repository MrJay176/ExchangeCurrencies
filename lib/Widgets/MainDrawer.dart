import 'package:flutter/material.dart';
import 'package:ogbonge/Utils/constant.dart';

class MainDrawer extends StatefulWidget {

  @override
  _DrawerState createState() => _DrawerState();

}

class _DrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context){

    return SafeArea(
      child:Container(
          child:Column(
            children: [
              Expanded(
                flex:3,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children:menuItems.map((e) {
                    return Container(
                      color:Colors.white,
                      margin:EdgeInsets.only(top :20.0),
                      child:InkWell(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Container(
                          color:Colors.white,
                          height:50,
                          child:Row(
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                              children:<Widget>[
                                Text(
                                    e.menu_name,
                                    style:TextStyle(
                                        fontSize: 17.0,
                                        fontFamily: "Montserrat",
                                        fontWeight:FontWeight.bold
                                    )
                                )
                              ]
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              InkWell(
                onTap:(){

                },
                child: Expanded(
                  flex:2,
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children:[
                      Container(
                        width:MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text.rich(
                             TextSpan(
                               children:[
                                 MyTextSpan(userName:"Your Wallet",
                                  textStyle:TextStyle(
                                    color:Colors.red,
                                    fontWeight:FontWeight.bold,
                                    fontSize:20
                                  )
                                 )
                               ]
                             )
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(bottom:6),
                        child: Text.rich(
                          TextSpan(
                            children:[
                              MyTextSpan(userName:"0.00NGN")
                            ]
                          )
                        ),
                      )
                    ],
                  )
                ),
              )
            ],
          )
      ),
    );
  }
}
