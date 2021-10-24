import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogbonge/Controller/SignUpController.dart';
import 'package:ogbonge/Utils/MyColors.dart';
import 'package:ogbonge/Widgets/RTextField.dart';

class AuthStack extends StatefulWidget {

  AuthStack({
    this.type,
    this.onPressed,
    this.signUpControlle
  });

  String type;
  SignUpController signUpControlle;
  Function onPressed;

  @override
  _AuthStackState createState() => _AuthStackState();

}

class _AuthStackState extends State<AuthStack> with TickerProviderStateMixin {

  TextEditingController editingControllerEmail;


  TextEditingController editingControllerPassword , editingControllerConfirmPass , editingControllerUserName;

  AnimationController _controller;
  AnimationController _secondController;
  Animation<Offset> _offsetAnimation;
  Animation<Offset> _secondAnimation;
  SignUpController signUpController = Get.find();

  @override
  void initState() {
    super.initState();

    editingControllerUserName = TextEditingController();
    editingControllerEmail = TextEditingController();
    editingControllerPassword = TextEditingController();
    editingControllerConfirmPass = TextEditingController();

    _controller = AnimationController(
        vsync:this,
        duration:const Duration(seconds:2)
    );

    _secondController =AnimationController(vsync:this , duration:const Duration(seconds:2));

    _secondAnimation = Tween<Offset>(
        begin:const Offset(1.5,0.0),
        end:Offset.zero,
    ).animate(CurvedAnimation(parent:_secondController, curve:Curves.easeIn));

    _offsetAnimation = Tween<Offset>(
      begin :const Offset(1.5,0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

  //_controller.forward();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    checkProgress(widget.type);

    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      child:Stack(
        children:[
          Container(
            height:MediaQuery.of(context).size.height/2,
            width:MediaQuery.of(context).size.width,
            color:Colors.black,
            padding:EdgeInsets.all(8),
            child:Center(
              child:Text(
                "Please Wait....",
                style:TextStyle(
                  color:Colors.white,
                  fontSize:20.0,
                  fontWeight:FontWeight.bold
                ) ,
              ) ,
            ) ,
          ),

          //UserName And Email
          Container(
            child:(signUpController.type_string==("name_email"))?
            SlideTransition(
              position:_offsetAnimation,
              child: Container(
                height:MediaQuery.of(context).size.height/2,
                width:MediaQuery.of(context).size.width,
                 decoration:BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: [
                         TravelColor().color_top,
                         TravelColor().color_end,
                       ],
                     )
                 ),
                 child:Column(
                   mainAxisAlignment:MainAxisAlignment.center,
                   crossAxisAlignment:CrossAxisAlignment.center,
                   children:[
                     Container(
                       margin: EdgeInsets.fromLTRB(10,10,10,10),
                       width:MediaQuery.of(context).size.width,
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(30.0),
                       ),
                       child:Center(
                         child:Text(
                           "Welcome ",
                           style:TextStyle(
                             color:Colors.white,
                             fontWeight:FontWeight.bold,
                             fontSize:18.0
                           ),
                         )
                       )
                     ),

                     Container(
                       margin: EdgeInsets.fromLTRB(10,10,10,10),
                       decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(10.0),
                           color:Colors.white
                       ),
                       child: RTextField(
                           controller:editingControllerUserName,
                           isPassword: false,
                           hint_text: "UserName",
                           label_text: "UserName",
                           borderColor: TravelColor().color_top
                       ),
                     ),
                     SizedBox(height:10.0,),
                     Container(
                       margin: EdgeInsets.fromLTRB(10,10,10,10),
                       decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           color:Colors.white
                       ),
                       child:RTextField(
                           controller:editingControllerEmail,
                           isPassword:false,
                           hint_text: "Email",
                           label_text: "Email",
                           borderColor: TravelColor().color_top
                       ),
                     ),
                   ],
                 ),
              ),
            ):SlideTransition(
              position:_secondAnimation,
               child:Container(
                   height:MediaQuery.of(context).size.height/2,
                   width:MediaQuery.of(context).size.width,
                   color:Colors.white,
                 child:Column(
                   mainAxisAlignment:MainAxisAlignment.center,
                   crossAxisAlignment:CrossAxisAlignment.center,
                   children:[
                     Container(
                         margin: EdgeInsets.fromLTRB(10,10,10,10),
                         width:MediaQuery.of(context).size.width,
                         decoration:BoxDecoration(
                           borderRadius:BorderRadius.circular(10.0),
                         ),
                         child:Center(
                             child:Text(
                               "Create Your Password",
                               style:TextStyle(
                                   color:Colors.black,
                                   fontWeight:FontWeight.bold,
                                   fontSize:18.0
                               ),
                             )
                         )
                     ),
                     SizedBox(height:10.0,),
                     Container(
                       margin: EdgeInsets.fromLTRB(10,10,10,10),
                       decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           color:Colors.white
                       ),
                       child:RTextField(
                           controller:editingControllerPassword,
                           isPassword:true,
                           hint_text: "Password",
                           label_text: "Password",
                           borderColor: TravelColor().color_top
                       ),
                     ),
                     SizedBox(height:10.0,),
                     Container(
                       margin: EdgeInsets.fromLTRB(10,10,10,20),
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color:Colors.white,
                       ),
                       child:RTextField(
                           controller:editingControllerConfirmPass,
                           isPassword:true,
                           hint_text: "Confirm Password",
                           label_text: "Confirm Password",
                           borderColor: TravelColor().color_top
                       ),
                     ),

                   ],
                 )
               ),
            ),
          ),

          //Password And Confirm Password
          // Container(
          //   height:MediaQuery.of(context).size.height/2,
          //   width:MediaQuery.of(context).size.width,
          //   color:Colors.yellowAccent,
          //   child:Column(
          //     mainAxisAlignment:MainAxisAlignment.center,
          //     crossAxisAlignment:CrossAxisAlignment.center,
          //     children:[
          //       Container(
          //         height:50.0,
          //         width:MediaQuery.of(context).size.width,
          //         color:Colors.lightGreen,
          //       ),
          //
          //       Container(
          //         height:50.0,
          //         width:MediaQuery.of(context).size.width,
          //         color:Colors.lightGreen,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );

  }

  int checkProgress(String enter){
    print("This is Type ${enter}");
    switch(enter){
      case "name_email":
        _controller.forward();
        setState(() {
          // type = "name_email";
        });
        return 1;
        break;
      case "password_confirm":
        _controller.reverse();
        _secondController.forward();
        setState(() {
          // type="password_confirm";
        });
        return 2;
        break;
      default:
       // type="name_email";
        _controller.forward();
        return 0;
    }
  }
}
