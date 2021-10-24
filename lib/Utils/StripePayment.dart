import 'package:stripe_payment/stripe_payment.dart';

setStripeOptions(){
  StripePayment.setOptions(
      StripeOptions(
          publishableKey:"YOUR_PUBLISHABLE_KEY",
          merchantId: "YOUR_MERCHANT_ID",
          androidPayMode: 'test'
      ));
}

final CreditCard testCard = CreditCard(
  number: '4111111111111111',
  expMonth: 08,
  expYear: 22,
);


// createTokenWithCard(){
//   StripePayment.createTokenWithCard(
//     testCard,
//   ).then((token) {
//     _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
//     setState(() {
//       _paymentToken = token;
//     });
//   }).catchError(setError);
// }