import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ogbonge/MyScreens/DisplayApartment.dart';
import 'package:ogbonge/Utils/SilverGridDelegateWithFixedCross.dart';
import 'package:ogbonge/Widgets/ApartmentCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {



  @override
  _MapScreenState createState() => _MapScreenState();


}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          child:Column(
            children:[
              Expanded(
                flex:3,
                child:Container(
                  child:GoogleMap(
                    initialCameraPosition:CameraPosition(
                                           target:LatLng(5.0377,7.9128),
                                            zoom:15,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex:2,
                child:Container(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height,
                  margin:EdgeInsets.only(top:55),
                  child:GridView.builder(
                    physics:ScrollPhysics(),
                    shrinkWrap:true,
                    padding:EdgeInsets.all(2),
                    gridDelegate:SliverGridDelegateWithFixedCross(
                        crossAxisCount:2,
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
                )
              )

            ],
          ),
        )
    );
  }
}
