import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ogbonge/Screens/Login/components/background.dart';
import 'package:ogbonge/Screens/Login/login_screen.dart';
import 'package:ogbonge/Screens/Signup/components/social_icon.dart';
import 'package:ogbonge/Utils/authControls.dart';
import 'package:ogbonge/components/already_have_an_account_acheck.dart';
import 'package:ogbonge/components/rounded_button.dart';
import 'package:ogbonge/components/rounded_input_field.dart';
import 'package:ogbonge/components/rounded_password_field.dart';

import 'or_divider.dart';

class Body extends StatefulWidget {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),

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
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "CREATE ACCOUNT",
              press: () async {
                _progressDialog.showProgressDialog(context,textToBeDisplayed: 'please wait...');
                print("This is SignIn Triggered");
                String email = editingControllerEmail.text.trim().toString();
                String password = editingControllerPassword.text.trim().toString();
                await fireBaseAuthServiceSignUp.SignUpUser
                  (email:email,password:password,context: context, name: editingControllerName.text.trim().toString());
                _progressDialog.dismissProgressDialog(context);

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
