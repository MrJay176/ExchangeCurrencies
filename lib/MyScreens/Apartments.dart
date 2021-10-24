import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogbonge/MyScreens/DisplayApartment.dart';
import 'package:ogbonge/Utils/SilverGridDelegateWithFixedCross.dart';
import 'package:ogbonge/Utils/loader.dart';
import 'package:ogbonge/Widgets/ApartmentCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Apartments extends StatefulWidget{

  @override
  _ApartmentsState createState() => _ApartmentsState();

}

class _ApartmentsState extends State<Apartments> with SingleTickerProviderStateMixin {

  bool apartment_loading = true;
  AnimationController controller;
  Animation<Color> animation_color;
  Color initialColor = Colors.deepOrange[900];

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync:this,duration:Duration(seconds:2));
    animation_color=ColorTween(
      begin:Colors.deepOrange[900],
      end:Colors.orange[700],
    ).animate(CurvedAnimation(parent:controller,curve:Curves.bounceOut));
    waitSec(time:6);

    controller.addListener((){
      setState(() {

      });
    });
    controller.repeat();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:FloatingSearchBar(
          body: SafeArea(
            child:apartment_loading?Container(
                decoration: BoxDecoration(
                  color:animation_color.value,
                ),
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child:Center(
                    child:Loader()
                )
            ):
            Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              margin:EdgeInsets.only(top:55),
              child:GridView.builder(
                   physics:ScrollPhysics(),
                   shrinkWrap:true,
                   padding:EdgeInsets.all(2),
                   gridDelegate:SliverGridDelegateWithFixedCross(
                     crossAxisCount:1,
                     mainAxisSpacing:5,
                     crossAxisSpacing:5,
                     height:400
                  ),
                  itemCount:apartments.length,
                  itemBuilder:(context,index){
                  return InkWell(
                    onTap:(){
                      Get.to(()=>DisplayApartment(
                        apartmentName:apartments[index].apartmentPrice,
                        apartmentUrl:apartments[index].apartmentImage,
                        apartmentDescription:apartments[index].apartmentdescription,
                        string1:apartments[index].waterSystem,
                        string2:apartments[index].electricity,
                        string3:apartments[index].numberToilet,
                        )
                      );
                    },
                    child:apartmentC(
                        apartmentImage:apartments[index].apartmentImage,
                        apartmentPrice:apartments[index].apartmentPrice,
                        data:FontAwesomeIcons.building,
                        size:MediaQuery.of(context).size,
                        context:context
                    ),
                  );
                },
              ),
            ),
          ),builder:(BuildContext context, Animation<double> transition) {
              return ClipRRect(
              borderRadius:BorderRadius.circular(8),
              child:Material(
                color:Colors.white,
                elevation:4,
                child:Builder(
                  builder:(context){
                    return Container(
                      height:500,
                      width:MediaQuery.of(context).size.width,

                    );
                  },
                )
            ),
          );
        },
          transition:CircularFloatingSearchBarTransition(),
          physics:BouncingScrollPhysics(),
          title:Text(
            'Search for Apartment',
            style:TextStyle(
                color:Colors.black87,
                fontWeight:FontWeight.normal,
                fontSize:16.0
            ),
          ),
          hint:"Search And Find Out",
          actions:[
            FloatingSearchBarAction.searchToClear(),
          ],
        )
    );
  }

  Future<void> waitSec({int time}) async {
    Timer timer;
    var _duration = Duration(seconds: time);

    timer = Timer(_duration, ()
    {
      setState(() {
        apartment_loading = false;
      });
    });
  }

}
