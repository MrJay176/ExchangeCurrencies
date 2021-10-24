import 'package:flutter/material.dart';
import 'package:ogbonge/Models/AccountDetails.dart';
import 'package:ogbonge/Utils/SharedPreference.dart';
import 'package:ogbonge/Widgets/animatedButton.dart';
import 'package:ogbonge/components/rounded_input_field.dart';
import 'package:ogbonge/config/palette.dart';
import 'package:ogbonge/widgetT/country_dropdown.dart';
import 'package:ogbonge/widgetT/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class CompleteDetails extends StatefulWidget {

  @override
  _CompleteDetailsState createState() => _CompleteDetailsState();

}

class _CompleteDetailsState extends State<CompleteDetails> {

  TextEditingController editingControllerAccountNum;
  TextEditingController editingControllerPhoneNum;
  AccountDetails accountDetailModel;

  var InitialBank = "Choose Bank";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingControllerAccountNum = TextEditingController();
    editingControllerPhoneNum = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar:CustomAppBar(),
        body:CustomScrollView(
          physics:ClampingScrollPhysics(),
          slivers:<Widget>[
              _buildForm(screenHeight),
              _buildButton(screenHeight,MediaQuery.of(context).size ,context)

          ],
        )
    );
  }



  SliverToBoxAdapter _buildButton(double screenHeight , Size size , BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
                onTap:()async{
                  SharedPreferenceFile shared = SharedPreferenceFile();
                  SharedPreferences prefs =await SharedPreferences.getInstance();

                  accountDetailModel = AccountDetails(account_bank:InitialBank,
                      account_number:editingControllerAccountNum.text.trim().toString(),
                      phone_number:editingControllerPhoneNum.text.trim().toString());

                  shared.saveDetails(accountDetailModel,prefs);
                  Navigator.pop(context);

                },
                child:animatedButton(size:size , context: context , txt:"Save Details")
            ),

          ],
        ),
      ),
    );
  }


  SliverToBoxAdapter _buildForm(double screenHeight) {

    return SliverToBoxAdapter(
       child: Container(
         padding: const EdgeInsets.all(20.0),
         decoration: BoxDecoration(
           color:Palette.primaryColor,
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(40.0),
             bottomRight: Radius.circular(40.0),
           ),
         ),
         child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[

              Text(
                  "Fill In All Details",
                  style:const TextStyle(
                      color:Colors.white,
                      fontSize:15.0,
                      fontWeight:FontWeight.bold
                  )
              ),

              CountryDropdown(
                countries:currenciesBank,
                country:InitialBank,
                onChanged: (val) => setState(()=>InitialBank=val),
              ),

              //We Need an InputTextField For amount we wish to deposit
              RoundedInputField(
                textEditingController:editingControllerAccountNum,
                hintText: "Account number",
                type:TextInputType.number,
                onChanged: (value) {

                },
              ),

              //We Need an InputTextField For amount we wish to deposit
              RoundedInputField(
                textEditingController:editingControllerPhoneNum,
                hintText: "Phone number",
                type:TextInputType.number,
                onChanged: (value) {

                },
              ),

            ],
         ),
       ),
    );

  }


  SliverToBoxAdapter _buttonBelow(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Click To Proceed And Save',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "Click Here To Save Your Details",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
