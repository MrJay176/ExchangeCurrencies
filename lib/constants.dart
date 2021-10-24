import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const TEST_SECRET = "sk_test_a67b546e9269cb07043928043230fcd867e0de49";
//Customize our incoming email that we have been paid
const metaData = {
  "custom_fields":[
    {
      "value": "snapTask",
      "display_name": "Payment to",
      "variable_name": "payment_to"
    }
  ]
};


//Wallet Types Will be choosen from here
List<String> currenciesBank = [
   "Choose Bank",
   "FIRST BANK OF NIGERIA",
   "UNITED BANK OF AFRICA",
   "ZENITH BANK",
   "ECO BANK",
   "UNION BANK",

];


//Wallet Types Will be choosen from here
List<String> currencies = [
"USD", "EGP",
  "LKR",
  "EUR",
  "JPY",
"GBP",
"AUD",
"CAD",
"CHF",
"CNY",
"HKD",
 "NZD",
"SEK",
"KRW",
"SGD",
"NOK",
"MXN",
"INR",
 "RUB",
"ZAR",
"TRY",
"BRL",
"TWD",
 "DKK",
"PLN",
"THB",
"IDR",
"HUF",
"CZK",
"ILS",
"CLP",
"PHP",
"AED",
 "COP",
"SAR",
"MYR",
"RON"
];