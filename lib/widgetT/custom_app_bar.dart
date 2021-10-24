import 'package:flutter/material.dart';
import 'package:ogbonge/config/palette.dart';


//Notice The Custom AppBar is with preferred sized widget
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      title:Text(
        "Exchange Currencies",
        style:TextStyle(
          fontSize:20,
          fontWeight:FontWeight.bold,
          color:Colors.white
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  //This means That You Want The Height Of This Class To Take AppBar Height
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
