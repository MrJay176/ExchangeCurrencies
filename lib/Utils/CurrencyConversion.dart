// call function to convert
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';

// ignore: non_constant_identifier_names
//Currency.THB
Future<String> getAmounts(double amountToConvert ,String CurrencyWantedString ,String  CurrentWalletType) async {
  print("Generating Equivalet of What you need in $CurrencyWantedString from $CurrentWalletType");
  var usdConvert = await MoneyConverter.convert(
      Currency(CurrentWalletType,amount:amountToConvert),Currency(CurrencyWantedString));
  return usdConvert.toString();
}

//Returns Dollar Value Of Equivalent
double converNairaToDollar(nairaValue){
  return nairaValue*0.0024;
}


//User Signs Up-yes
//User Can Login -yes
//User Wallet is created -yes
//Initially Wallet Value is 0 -yes

//User Will Choose The Type of Wallet He wants To Use - no

//If Naira Then Convert Equivalent to dollars When Payment Made(PayStack)-no

//payment is made with paystack or flutterwave(If Foreign Customer) - no
//and when payment is successful , paystack or flutter wave adds to wallets - no

//Wallet type if naira is dollars
//else equivalent to customer region