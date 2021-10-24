
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  String userName;
  String email;
  bool   _apartment;
  bool   _services;
  bool   _houseItems;
  bool   _cVs;
  double wallet;
  String walletType;


  bool get apartment => _apartment;


  UserModel.two(this.userName, this.email, this._apartment, this._services,
      this._houseItems, this._cVs, this.wallet);

  UserModel({this.userName, this.email,
       this.wallet ,  this.walletType});


  bool get services => _services;

  set services(bool value) {
    _services = value;
  }

  @override
  String toString() {
    return 'UserModel{_userName: $userName, _email: $email, _wallet: $wallet}';
  }

  factory UserModel.fromjson(Map<String , dynamic> paresedJson){
    return new UserModel(
       userName:paresedJson['userName'],
       email:paresedJson['email'],
       wallet:paresedJson['wallet'],
       walletType:paresedJson['walletType']
    );
  }

  Map<String , dynamic> toJson(){
    return <String , dynamic>{
      'wallet':wallet,
      'email':email,
      'userName':userName,
      'walletType':walletType
    };
  }

  bool get houseItems => _houseItems;

  set houseItems(bool value) {
    _houseItems = value;
  }

  bool get cVs => _cVs;

  set cVs(bool value) {
    _cVs = value;
  }
}