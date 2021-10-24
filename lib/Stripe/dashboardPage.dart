import 'dart:ffi';

import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget{

  @override
  _DashBoardPageState createState() => _DashBoardPageState();

}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: ElevatedButton(
           child: Text("Make Payment"),
            onPressed: (){

            },
         ),
       ),
    );
  }

  Future<void> makePayment() async{
//     final url = Uri.parse(uri)
  }
}
