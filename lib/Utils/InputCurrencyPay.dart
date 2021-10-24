import 'package:flutter/material.dart';
import 'package:ogbonge/Utils/SharedPreference.dart';
// import 'package:paystack_manager/paystack_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'CurrencyConversion.dart';

class InputCurrencyPay{

  //Notify The User Of Default Pin
  receiveCardInputAndTransform(cardnum , cardEX , cvc){

  }

  convertToNeeded(neededCurrency){

  }

  //context:Context
  //Three List Of Countries "NGN","USD","GHS","ZAR"
  // makePayment(context,email,currency,amount,firstName ,lastName , metadata ){
  //   try{
  //      PaystackPayManager(context:context)
  //      ..setSecretKey(TEST_SECRET)
  //      //First Ally Logo
  //      //..setCompanyAssetImage(Image(image:NetworkImage()));
  //     ..setAmount(amount+"00")
  //     ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
  //     ..setCurrency(currency)
  //     ..setEmail(email)
  //     ..setFirstName(firstName)
  //     ..setLastName(lastName)
  //     ..setMetadata({
  //       metadata
  //     },)
  //     ..onSuccesful(_onPaymentSuccessful(amount))
  //     ..onPending(_onPaymentPending)
  //     ..onFailed(_onPaymentFailed)
  //     ..onCancel(_onPaymentCancel)
  //     ..initialize();
  //   }catch(error){
  //      print('payment error');
  //   }
  // }
  //
  // _onPaymentSuccessful(amount) async {
  //   print("Transaction SuccessFul");
  //   SharedPreferenceFile sharedPreferenceFile = SharedPreferenceFile();
  //   SharedPreferences prefs =await SharedPreferences.getInstance();
  //   double dollarEquivalent  = converNairaToDollar(amount);
  //   sharedPreferenceFile.setValueInWallet(dollarEquivalent, prefs);
  //   double value = sharedPreferenceFile.getUserWallet(prefs);
  //   print("Wallet value "+value.toString());
  //   //Update State
  //   try {
  //     print("ready to be added to wallet");
  //   }catch(e){
  //     print("This is Transaction Error "+e);
  //   }
  // }
  //
  // _onPaymentPending(Transaction transaction){
  //   print("Transaction pending");
  //   try {
  //     print("this is transaction messages " + transaction.message);
  //     print("Checking my result value " + transaction.refrenceNumber);
  //     print("Again We Check  " + transaction.state.toString());
  //   }catch(e){
  //     print("This is Transaction Error "+e);
  //   }
  // }
  //
  // _onPaymentFailed(Transaction transaction){
  //   print("Transaction Failed");
  //   try {
  //     print("this is transaction messages " + transaction.message);
  //     print("Checking my result value " + transaction.refrenceNumber);
  //     print("Again We Check  " + transaction.state.toString());
  //   }catch(e){
  //     print("This is Transaction Error "+e);
  //   }
  // }
  //
  // _onPaymentCancel(Transaction transaction){
  //   print("Transaction Cancelled");
  //   try {
  //     print("this is transaction messages " + transaction.message);
  //     print("Checking my result value " + transaction.refrenceNumber);
  //     print("Again We Check  " + transaction.state.toString());
  //   }catch(e){
  //     print("This is Transaction Error "+e);
  //   }
  // }
  //
}