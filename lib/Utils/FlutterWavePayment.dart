import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:http/http.dart';

Future beginPayment({BuildContext context,
               String currency,
               String amount,
               String email,
               String fullname,
               String txref,
               String phoneNumber , String encryptionKey ="FLWSECK_TEST050fd3766265",
               String publicKey ="FLWPUBK_TEST-25049d341b7a4cb76eba9582f4fce71b-X",
               String SEC_KEY ="FLWSECK_TEST-f8bb1b2f1f9630cb7caea6b912daa31e-X"
})async{


  var payload_ = {
    "tx_ref":"MC-1585230950508",
  "amount":amount,
  "email":email,
  "phone_number":phoneNumber,
  "currency":currency,
  "client_ip":"154.123.220.1",
  "device_fingerprint":"62wd23423rq324323qew1",
  "subaccounts":[
  {
  "id":"RS_D87A9EE339AE28BFA2AE86041C6DE70E"
  }
  ],
  "narration":"All star college salary for May",
  "is_permanent":false
  };


  String url_transfer = "https://api.flutterwave.com/v3/charges?type=bank_transfer";

  var response = await post(
      Uri.parse(url_transfer),
      headers: {
        "Accept":"application/json",
        "Content-Type": "application/json",
        "Authorization" : "Bearer $SEC_KEY"
      },
      body:json.encode(payload_),
      encoding:Encoding.getByName("utf-8")
  );

  print(" "+response.body);


}

bool checkPaymentIsSuccessful(final ChargeResponse response , String currency , String amount ,  String txref) {
  return response.data.status ==    FlutterwaveConstants.SUCCESSFUL &&
      response.data.currency  ==    currency &&
      response.data.amount    ==    amount &&
      response.data.txRef     ==    txref;
}


//{
//"account_bank": "044",
//"account_number": "0690000040",
//"amount": 5500,
//"narration": "Akhlm Pstmn Trnsfr xx007",
//"currency": "NGN",
//"reference": "akhlm-pstmnpyt-rfxx007_PMCKDU_1",
//"callback_url": "https://webhook.site/b3e505b0-fe02-430e-a538-22bbbce8ce0d",
//"debit_currency": "NGN"
//}
// Method: POST
// Headers: Content-Type: application/json, Authorization: Bearer {{ SEC_KEY }}
// Parameters:

sendPaymentFlutterWave({
               String account_bank,
               String account_number,
               double amount,String narration,
               String currency,String reference,String callback_url,
               String debit_currency,
               String SEC_KEY ="FLWSECK_TEST-f8bb1b2f1f9630cb7caea6b912daa31e-X"}) async {

  String url_transfer = "https://api.flutterwave.com/v3/transfers";

 var payload = {
         "account_bank":account_bank,
         "account_number":account_number,
         "amount":amount,
         "narration":narration,
         "currency":currency,
         "reference":reference,
         "callback_url":callback_url,
         "debit_currency":currency
 };

  var response = await post(
      Uri.parse(url_transfer),
      headers: {
        "Accept":"application/json",
        "Content-Type": "application/json",
        "Authorization" : "Bearer $SEC_KEY"
      },
      body:json.encode(payload),
      encoding:Encoding.getByName("utf-8")
  );

  print(" "+response.body);

}
