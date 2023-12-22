import 'package:covid_tracker_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
//ANIMATINON CODE
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this)..repeat();

    //need to dispose this
    @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  //


  //splash
 void switchToWorldScreen() {
    Navigator.pushReplacement(   //push replacement means you cant go back to this screen
        context, MaterialPageRoute(builder: (context) =>const  WorldStates()));
  }
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), switchToWorldScreen);
    super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {
final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller, 
              child: SizedBox(
                height: height*0.3,
                width: width*0.3,
                child: Center(
                  child: Image.asset('assets/virus.png'),
                ),
              ),
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value*2.0*math.pi,
                  child: child,);
              }),

     SizedBox(height: MediaQuery.of(context).size.height*0.04,),
Center(child: Text('Coivd-19 Tracker App',style: Theme.of(context).textTheme.bodyLarge)),
Center(child: Text('By Muzammil',style: Theme.of(context).textTheme.bodySmall)),

          ],
        ),
      ),
    );
  }
}