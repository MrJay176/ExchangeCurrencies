import 'package:flutter/material.dart';
import 'package:ogbonge/components/text_field_container.dart';

import '../constants.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final IconData icon;
  final obsecure;
  final ValueChanged<String> onChanged;
  final TextInputType type;
  const RoundedInputField({
    Key key,
    this.type,
    this.obsecure = false,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller:textEditingController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        obscureText: obsecure,
        keyboardType:(type == null )?TextInputType.text:TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
