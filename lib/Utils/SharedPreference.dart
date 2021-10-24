import 'dart:convert';

import 'package:ogbonge/Models/AccountDetails.dart';
import 'package:ogbonge/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:convert/convert.dart';

class SharedPreferenceFile{

  String jsonUser;
  String jsonUserDetails;

  bool checkDetails(prefs){
    print("CheckDetails Entered Yes");
    String detailsString = prefs.getString("userDetails");
    print("Check Details Passed First Line $detailsString");
    // ignore: non_constant_identifier_names
    if(detailsString!=null){
      final DetailsMap = json.decode(detailsString);
      AccountDetails account_details = AccountDetails.fromjson(DetailsMap);
      if(account_details!=null){
        //There is user details
        return true;
      }else{
        //There is no user details
        return false;
      }
    }else{
      return false;
    }

  }



  Future<bool> saveDetails(AccountDetails accountDetails, prefs) async {
    jsonUserDetails = jsonEncode(accountDetails).toString();
    print("DetailsUser This is json User Details "+jsonUserDetails);
    prefs.setString('userDetails', jsonUserDetails);
    return true;
  }


  double getUserWallet(prefs){
    String user_string = prefs.getString("user");
    final body = json.decode(user_string);
    UserModel user = UserModel.fromjson(body);
    return user.wallet;
  }

  setValueInWallet(double , prefs){
     UserModel userModel = getUserDetailes(prefs);
     var value = userModel.wallet;
     var newWalletValue = value + double;
     userModel.wallet = newWalletValue;
     saveUser(userModel, prefs);
  }

  UserModel getUserDetailes(prefs){
    String user_string = prefs.getString("user");
    final body = json.decode(user_string);
    UserModel user = UserModel.fromjson(body);
    print("This is wallet value of User "+user.toString());
    return user;
  }

  //Set User In Shared
  saveUser(userModel , prefs){
    jsonUser = jsonEncode(userModel).toString();
    print("SaveUser This is json User "+jsonUser);
    prefs.setString('user', jsonUser);
  }

}