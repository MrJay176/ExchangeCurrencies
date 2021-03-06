import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {

  Loader({
    this.text = "Loading.....",
  });

  final String text;

  @override
  _LoaderState createState() => _LoaderState();

}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialradius = 30;
  double radius = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync:this,duration:Duration(seconds:2));
    animation_rotation = Tween<double>(
      begin:0.0,
      end:1.0,
    ).animate(CurvedAnimation(parent: controller,curve:Interval(
      0.0, 1.0 , curve:Curves.linear
    )));

    animation_radius_in = Tween<double>(
      begin:1.0,
      end:0.0,
    ).animate(CurvedAnimation(parent:controller,curve:Interval(
        0.75,
        1.0,
        curve:Curves.elasticIn
    )));

    animation_radius_out = Tween<double>(
      begin:0.0,
      end:1.0
    ).animate(CurvedAnimation(parent:controller,curve:Interval(
      0.0,
      0.25,
      curve:Curves.elasticOut
    )));

    controller.addListener(() {
      setState((){
        if(controller.value >= 0.75 && controller.value <= 1.0){
          radius = animation_radius_in.value * initialradius;
        }else if (controller.value >= 0.0 && controller.value <= 0.25){
          radius = animation_radius_out.value * initialradius;
        }
      });
    });
    controller.repeat();

  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child:Container(
        width:100.0,
        height:200.0,
        child:Center(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                height:100.0,
                width:100.0,
                child: Center(
                  child: RotationTransition(
                    turns:animation_rotation,
                    child: Stack(
                      children:[
                        Dot(
                          radius:30.0,
                          color:Colors.black12,
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(pi/4), radius*sin(pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.greenAccent,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(2*pi/4), radius*sin(2*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.redAccent,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(3*pi/4), radius*sin(3*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.yellowAccent,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(4*pi/4), radius*sin(4*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.purpleAccent,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(5*pi/4), radius*sin(5*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.pink,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(6*pi/4), radius*sin(6*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.pink,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(7*pi/4), radius*sin(7*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.pink,
                          ),
                        ),

                        Transform.translate(
                          offset:Offset( radius*cos(8*pi/4), radius*sin(8*pi/4) ),
                          child: Dot(
                            radius:6.0,
                            color:Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                widget.text,
                style:TextStyle(
                    color:Colors.black,
                    fontSize:18
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {

  final double radius;
  final Color color;

  Dot({this.radius , this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        width: radius!=null?this.radius:null,
        height:radius!=null?this.radius:null,
        decoration:BoxDecoration(
          color:color,
          shape:BoxShape.circle
        ),
      ),
    );
  }

}
