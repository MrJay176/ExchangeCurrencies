import 'dart:convert';

import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ogbonge/Models/AccountDetails.dart';
import 'package:ogbonge/Models/UserModel.dart';
import 'package:ogbonge/Screens/CompleteDetails.dart';
import 'package:ogbonge/Utils/CurrencyConversion.dart';
import 'package:ogbonge/Utils/FlutterWavePayment.dart';
import 'package:ogbonge/Utils/SharedPreference.dart';
import 'package:ogbonge/Widgets/CustomDialog.dart';
import 'package:ogbonge/Widgets/animatedButton.dart';
import 'package:ogbonge/components/rounded_input_field.dart';
import 'package:ogbonge/config/palette.dart';
import 'package:ogbonge/config/styles.dart';
import 'package:ogbonge/data/data.dart';
import 'package:ogbonge/widgetT/country_dropdown.dart';
import 'package:ogbonge/widgetT/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProgressDialog _progressDialog = ProgressDialog();

  String countryInit  = "USD";
  String countryFinal = "USD";
  String equivalent = "0.0";
  bool payment_made  = false;
  var loading = false;

  TextEditingController editingControllerAmount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingControllerAmount = TextEditingController();
    _checkDetails();
  }

 Future<bool>  _checkDetails() async {
    SharedPreferenceFile sharedPreferenceFile = SharedPreferenceFile();
    SharedPreferences prefs =await SharedPreferences.getInstance();
    bool value = sharedPreferenceFile.checkDetails(prefs);
    print("This is check details value $value");
    if(!value){

      //User Details Does Not Exist
      Get.to(()=>CompleteDetails());
      return false;
    }else{
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body:CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Some Api Calls are free , Some are Paid",
                style:const TextStyle(
                    color:Colors.white,
                    fontSize:13.0,
                    fontWeight:FontWeight.normal
                )
            ),
            Text(
                "Some Currency Conversion,requires paid version of Api",
                style:const TextStyle(
                    color:Colors.white,
                    fontSize:13.0,
                    fontWeight:FontWeight.normal
                )
            ),

            Text(
               "Exchange Any Currency with us now",
                style:const TextStyle(
                  color:Colors.white,
                  fontSize:15.0,
                  fontWeight:FontWeight.normal
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex:2,
                  child: Text(
                    'Choose Deposit Currency',
                     style:const TextStyle(
                      color: Colors.white,
                      fontSize:16.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  flex:3,
                  child: CountryDropdown(
                    countries:currencies,
                    country: countryInit,
                    onChanged: (val) => setState(() => countryInit = val),
                  ),
                ),
              ],
            ),

            //We Need an InputTextField For amount we wish to deposit
            RoundedInputField(
              textEditingController:editingControllerAmount,
              hintText: "Enter amount",
              type:TextInputType.number,
              onChanged: (value) {

              },
            ),

            InkWell(
              onTap:() async {
               bool value_result =  await _checkDetails();

               if(value_result) {
                 String deposit_amount = editingControllerAmount.text;
                 // sendPaymentFlutterWave();
                 //Get User Details From SharedPreference
                 SharedPreferenceFile shared = SharedPreferenceFile();
                 SharedPreferences prefs = await SharedPreferences
                     .getInstance();
                 UserModel user = shared.getUserDetailes(prefs);

                 String detailsString = prefs.getString("userDetails");
                 // ignore: non_constant_identifier_names
                 final DetailsMap = json.decode(detailsString);
                 AccountDetails account_details = AccountDetails.fromjson(
                     DetailsMap);

                 beginPayment(context: context,
                     currency: countryInit,
                     amount: deposit_amount,
                     email: user.email,
                     fullname: user.userName,
                     phoneNumber: account_details.phone_number)
                     .then((value) {
                   MyDialog.progress(context, MediaQuery
                       .of(context)
                       .size, execute: () {
                     MyDialog.success(context, MediaQuery
                         .of(context)
                         .size, execute: () {
                       setState(() {
                         payment_made = true;
                       });
                     });
                   });
                 });
               }
              },
              child: Container(
                  height:50.0,
                  margin:EdgeInsets.fromLTRB(10,10,10,20),
                  child:animatedButton(context:context,txt:"Proceed With Deposit")
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Proceed To WithDraw ${editingControllerAmount.text+countryInit}, Choose Withdrawal Currency below',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        CountryDropdown(
                          countries:currencies,
                          country: countryFinal,
                          onChanged: (val)async{
                            double result = double.parse('${editingControllerAmount.text.toUpperCase()}.0');
                            _progressDialog.showProgressDialog(context,textToBeDisplayed: 'please wait...');
                            setState(() {
                                loading=true;
                            });
                            var resultOut = await getAmounts(result,countryFinal,countryInit );
                            setState(() {
                               countryFinal = val;
                               equivalent = resultOut;
                               print("I am printing out the equivalent "+equivalent);
                             });
                            _progressDialog.dismissProgressDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                Text(
                  loading?equivalent:"...",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap:() async {
                    // String deposit_amount = editingControllerAmount.text.trim().toString() ;
                    SharedPreferenceFile shared = SharedPreferenceFile();
                    SharedPreferences prefs =await SharedPreferences.getInstance();
                    UserModel user = shared.getUserDetailes(prefs);

                    String detailsString = prefs.getString("userDetails");
                    // ignore: non_constant_identifier_names
                    final DetailsMap = json.decode(detailsString);
                    AccountDetails account_details = AccountDetails.fromjson(DetailsMap);

                    if(payment_made){
                      sendPaymentFlutterWave(
                          account_bank: account_details.account_bank,
                          account_number: account_details.account_number,
                          amount: double.parse(equivalent),
                          narration: "Send to my bank account",
                          currency: countryFinal,
                          reference: "Reference For My Transaction",
                          callback_url: null,
                          debit_currency: countryFinal
                      );
                      MyDialog.progress(context, MediaQuery
                          .of(context)
                          .size, execute: () {
                        MyDialog.success(context, MediaQuery
                            .of(context)
                            .size, execute: () {
                          setState(() {
                            payment_made = true;
                          });
                        });
                      });
                    }else{
                      MyDialog.failure(context , MediaQuery.of(context).size , execute:(){
                      });
                    }

                  },
                  child: Container(
                      height:50.0,
                      margin:EdgeInsets.fromLTRB(10,10,10,20),
                      child:animatedButton(context:context,txt:"Withdraw in $countryFinal")
                  ),
                ),

                SizedBox(height: screenHeight * 0.01),
                Text(
                  'For more enquires , please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    Expanded(
                      child: FlatButton.icon(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        onPressed: () {},
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        icon: const Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                        ),
                        label: Text(
                          'SMS',
                          style: Styles.buttonTextStyle,
                        ),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Prevention Tips',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                        children: <Widget>[
                          Image.asset(
                            e.keys.first,
                            height: screenHeight * 0.12,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Text(
                            e.values.first,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
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
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
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

//Libraries Used
//-FlChart
//-Bubble Tab Indicator