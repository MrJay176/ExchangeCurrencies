import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ogbonge/Models/UserModel.dart';
import 'package:ogbonge/MyScreens/HomeScreen.dart';

import 'package:ogbonge/Screens/Login/components/background.dart';
import 'package:ogbonge/Screens/Signup/signup_screen.dart';
import 'package:ogbonge/Utils/authControls.dart';
import 'package:ogbonge/components/already_have_an_account_acheck.dart';
import 'package:ogbonge/components/rounded_button.dart';
import 'package:ogbonge/components/rounded_input_field.dart';
import 'package:ogbonge/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ProgressDialog _progressDialog = ProgressDialog();
  FireBaseAuthServiceSignUp fireBaseAuthServiceSignUp = FireBaseAuthServiceSignUp();

  TextEditingController editingControllerEmail;
  TextEditingController editingControllerPassword;
  TextEditingController editingControllerName;
  bool hide_password = false;

  @override
  void initState() {
    // TODO: implement initState
    editingControllerEmail = TextEditingController();
    editingControllerPassword = TextEditingController();
    editingControllerName = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),

            RoundedInputField(
              textEditingController:editingControllerName,
              hintText: "Your Name",
              onChanged: (value) {
                print("Value That is changing "+value);
                String text_value = editingControllerName.text.toLowerCase().trim().toString();
                print("Value That is Printed Out "+text_value);
              },
            ),


            RoundedInputField(
              textEditingController:editingControllerEmail,
              hintText: "Your Email",
              onChanged: (value) {
                 print("Value That is changing "+value);
                 String text_value = editingControllerEmail.text.toLowerCase().trim().toString();
                 print("Value That is Printed Out "+text_value);
              },
            ),
            RoundedPasswordField(
              textEditingController:editingControllerPassword,
              onChanged: (value) {
                print("Value That is changing Password "+value);
                String text_value = editingControllerPassword.text.toLowerCase().trim().toString();
                print("Value That is Printed Out Password "+text_value);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                _progressDialog.showProgressDialog(context,textToBeDisplayed: 'please wait...');
                print("Login Button is Triggered");
                String name     = editingControllerName.text.trim().toString();
                String password = editingControllerPassword.text.trim().toString();
                String email =editingControllerEmail.text.trim().toString();
                await fireBaseAuthServiceSignUp.LoginUser(
                    email:email,
                    username:name,
                    password:password,
                    context:context).then((value) => _progressDialog.dismissProgressDialog(context));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login:false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
