import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogbonge/Controller/SignUpController.dart';
import 'package:ogbonge/MyScreens/HomeScreen.dart';
import 'package:ogbonge/Utils/MyColors.dart';
import 'package:ogbonge/Widgets/AuthStack.dart';
import 'package:ogbonge/Widgets/RTextField.dart';
import 'package:ogbonge/Widgets/animatedButton.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState()=>_SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  SignUpController signUpController = Get.put(SignUpController());

  TextEditingController editingControllerEmail;

  TextEditingController editingControllerPassword,editingControllerConfirmPass,editingControllerUserName;

  String email;
  String type = "name_email";
  String password;
  int proceed = 0;
  String btn_txt = "Sign Up";

  @override
  Widget build(BuildContext context) {

    editingControllerUserName = TextEditingController();
    editingControllerEmail = TextEditingController();
    editingControllerPassword = TextEditingController();
    editingControllerConfirmPass = TextEditingController();

    return MaterialApp(
         debugShowCheckedModeBanner:false,
         home:Scaffold(
           backgroundColor:Colors.deepOrange,
           body:SafeArea(
             child:Container(
                height:MediaQuery.of(context).size.height,
                decoration:BoxDecoration(
                   //color:Colors.deepOrange,
                    gradient:LinearGradient(
                      begin:Alignment.topLeft,
                      end:Alignment.bottomRight,
                      colors:[
                        TravelColor().color_top,
                        TravelColor().color_end,
                      ],
                    )
                ),
               child:Container(
                 child:Center(
                   child:SingleChildScrollView(
                     child:Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children:[

                         Text(
                           'OGBONGE CONNECT',
                           style: TextStyle(
                               color:Colors.white,
                               fontWeight:FontWeight.bold,
                               fontSize:25.0,
                               fontFamily:"Italianno"
                           ),
                         ),

                         SizedBox(height:50.0,),

                         Obx(
                             (){
                               print("This is  a Cross ${signUpController.type_string}");
                               return Container(
                                    height:MediaQuery.of(context).size.height/2,
                                    decoration:BoxDecoration(
                                        gradient:LinearGradient(
                                          begin:Alignment.topLeft,
                                          end:Alignment.bottomRight,
                                          colors: [
                                            TravelColor().color_top,
                                            TravelColor().color_end,
                                          ],
                                        )
                                    ),
                                    child:AuthStack(signUpControlle:signUpController,type:signUpController.type_string,)
                               );
                             },
                         ),

                         GestureDetector(
                           onTap:(){
                           String result_controller = signUpController.type_string;
                           print("This nis result ${result_controller}");
                           if(result_controller=="name_email"){
                              checkProgress("password_confirm");
                           }else{
                             if(proceed==1){
                               Get.to(()=>HomeScreen());
                             }else {
                               print("$proceed");
                             }
                           }
                             // setState((){
                             // });
                             email = editingControllerEmail.text;
                             password = editingControllerPassword.text;
                           },
                           child:Container(
                               height:50.0,
                               margin:EdgeInsets.fromLTRB(10,10,10,20),
                               child:animatedButton(context:context,txt:btn_txt)
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ),
    );
  }

  int checkProgress(String enter){
    print("Enteren ${enter} yes i did");
    proceed++;
    switch(enter){
      case "name_email":
        signUpController.setType("name_email");
        return 1;
        break;
      case "password_confirm":
        setState((){
          btn_txt="Proceed";
        });
        signUpController.setType("password_confirm");
        return 2;
        break;
      default:
        signUpController.setType("name_email");
        return 0;
    }
  }

}




