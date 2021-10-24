
class AccountDetails{

      String account_bank;
      String account_number;
      String phone_number;
      // String narration;
      // String currency;
      // String reference;
      // String callback_url;
      // String debit_currency;

      AccountDetails({
      this.account_bank,
      this.account_number,
      this.phone_number
      // this.amount,
      // this.narration,
      // this.currency,
      // this.reference,
      // this.callback_url,
      // this.debit_currency
      });



  factory AccountDetails.fromjson(Map<String , dynamic> paresedJson){
            return new AccountDetails(
                account_bank:paresedJson['account_bank'],
                account_number:paresedJson['account_number'],
                phone_number:paresedJson['phone_number']
                // amount:paresedJson['amount'],
                // narration:paresedJson['narration'],
                // currency:paresedJson['currency'],
                // reference:paresedJson['reference'],
                // callback_url:paresedJson['callback_url'],
                // debit_currency:paresedJson['debit_currency']
            );
      }
      Map<String , dynamic> toJson(){
            return <String , dynamic>{
                  'account_number':account_number,
                  'account_bank':account_bank,
                  'phone_number':phone_number
            };
      }
}