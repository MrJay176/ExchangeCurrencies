import 'package:flutter/material.dart';

class Apartment{

  String _apartmentImage;
  String _apartmentPrice;
  IconData _iconData;
  String _apartmentdescription;
  String _numberToilet = "2 toilets in the house";
  String _waterSystem  = "water system , drainage available";
  String _electricity  = "pre paid meter electricity , 24hrs light";
  double _latitude = 0.0;
  double _longitude = 0.0;

  String get numberToilet =>_numberToilet;

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  Apartment.location(this._latitude,this._longitude);
  Apartment(this._apartmentImage,this._apartmentPrice,this._iconData,this._apartmentdescription);
  Apartment.fromApartment(Apartment apartment){
     this._apartmentImage = apartment.apartmentImage;
     this._apartmentPrice = apartment.apartmentPrice;
     this._iconData       = apartment._iconData;
     this._apartmentdescription = apartment.apartmentdescription;
     this._numberToilet = apartment._numberToilet;
     this._waterSystem  = apartment._waterSystem;
     this._electricity  = apartment._electricity;
     this._longitude    = apartment._longitude;
     this._latitude     = apartment.latitude;
  }

  String get apartmentdescription => _apartmentdescription;

  set apartmentdescription(String value) {
    _apartmentdescription = value;
  }

  IconData get iconData => _iconData;

  set iconData(IconData value) {
    _iconData = value;
  }

  String get apartmentPrice => _apartmentPrice;

  set apartmentPrice(String value) {
    _apartmentPrice = value;
  }

  String get apartmentImage => _apartmentImage;

  set apartmentImage(String value) {
    _apartmentImage = value;
  }

  String get waterSystem => _waterSystem;

  String get electricity => _electricity;

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }
}