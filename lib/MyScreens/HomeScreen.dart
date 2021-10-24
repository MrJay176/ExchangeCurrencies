import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ogbonge/Widgets/MainDrawer.dart';
import 'package:ogbonge/Widgets/NavigatorStack.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  var index_notifier = 0;

  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();

  openDrawer(){
    _drawerkey.currentState.openDrawer();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:Drawer(
          child:MainDrawer(),
        ),
        key:_drawerkey,
        backgroundColor:Colors.deepOrange[400],
        bottomNavigationBar:RBottomNavigationBar(),
        body:SafeArea(
           child:NavigatorStack(
             onPressed:(){
               _drawerkey.currentState.openDrawer();
             },
             index_value:index_notifier,
           ),
        )
    );
  }

  CurvedNavigationBar RBottomNavigationBar() {
    return CurvedNavigationBar(
      buttonBackgroundColor:Colors.red,
      backgroundColor:Colors.white,
      height:50,
      animationDuration:Duration(
        milliseconds:300,
      ),
      animationCurve:Curves.bounceInOut,
      index:0,
      items:[
        FaIcon(
          FontAwesomeIcons.home,
          size:25,
        ),
        FaIcon(
          FontAwesomeIcons.plus,
          size:25,
        ),
        FaIcon(
          FontAwesomeIcons.user,
          size:25,
        ),



        // Icon(Icons.home_filled , size: 25.0, color:Colors.black54),
        // Icon(Icons.search , size: 25.0, color:Colors.black54),
      ],
      //Give Us Index Value to determine screen position
      onTap:(index){
        switch(index){
          case 0:
            setState(() {
              index_notifier=0;
            });
            break;
          case 1:
            setState(() {
              index_notifier=1;
            });
            break;
          case 2:
            setState(() {
              index_notifier=2;
            });
            break;
        }
      },
    );
  }
}

