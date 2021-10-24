import 'package:get/get.dart';

class SignUpController extends GetxController{
  var type = "name_email".obs;
  String get type_string => type.value;
  setType(String type_input){
     type.value = type_input;
     print("Checking Cal ${type.value}");
  }
}