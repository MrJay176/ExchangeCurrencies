import 'package:flutter/material.dart';
import 'package:ogbonge/Widgets/LowArea.dart';
import 'package:ogbonge/Widgets/NavigatorStack.dart';

class ApartmentContainer extends StatelessWidget {

  const ApartmentContainer({
    Key key,
    this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
         width:370,
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
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Expanded(
                flex:3,
                child:Container(
                  height:MediaQuery.of(context).size.height,
                  width:MediaQuery.of(context).size.width,
                  child:ClipRRect(
                    borderRadius:BorderRadius.circular(20),
                    child: Image.asset(
                      url,
                      fit:BoxFit.fill,
                      height:MediaQuery.of(context).size.height,
                      width:MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),

              Expanded(
                 flex:2,
                  child:Container(
                    child:lowArea(context)
                  )
              )
            ],
          ),
        )
    );
  }
}