import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RTextField extends StatefulWidget {

  RTextField(
      {this.controller,
        this.hint_text,
        this.borderColor,
        this.isPassword,
        this.distance_right = 25.0,
        this.label_text});

  TextEditingController controller;
  String hint_text;
  String label_text;
  double distance_right;
  bool isPassword;
  bool readOnly;
  Color borderColor;

  @override
  State<StatefulWidget> createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 45.0,
      margin: EdgeInsets.fromLTRB(25.0, 10,
          null == widget.distance_right ? 25 : widget.distance_right, 8),
      child: TextFormField(
        controller:widget.controller,
        cursorColor: Colors.black,
        obscureText:widget.isPassword,
        keyboardType:widget.isPassword?TextInputType.text:TextInputType.emailAddress,
        decoration:InputDecoration(
            hintText: widget.hint_text,
            hintStyle: TextStyle(
                fontFamily: "Montserrat",
                fontWeight:FontWeight.normal
            ),
            labelText: widget.label_text,
            labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color:widget.borderColor,
                  width: 1.2
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:widget.borderColor,
                  width:1.2
                ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:BorderSide.none
            )),
      ),
    );
  }
}
