import 'dart:async';

import 'package:bazaar/screens/check_user.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashUI(),
    );
  }
}

class SplashUI extends StatefulWidget {
  
  @override
  _SplashUIState createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration = Duration(seconds: 5);
    return Timer(duration, route);

  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=>CheckUser()
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo.png'),
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    "Bazaar",
                    style: TextStyle(color: Color(0xFF739b21), fontSize: 35),
                  ),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: WaveWidget(
                duration: 1,
                config: CustomConfig(
                  gradients: [
                    [Color(0xFFc4d5a1), Color(0xFF739b21)],
                    [Color(0xFF739b21), Color(0xFF85b02b)],
                    [Color(0xFF85b02b), Color(0xFFc4d5a1)],
                    [Color(0xFFc4d5a1), Color(0xFF739b21)]
                  ],
                  durations: [35000, 19440, 10800, 6000],
                  heightPercentages: [0.22, 0.23, 0.25, 0.30],
                  blur: MaskFilter.blur(BlurStyle.inner, 5),
                  gradientBegin: Alignment.centerLeft,
                  gradientEnd: Alignment.centerRight,
                ),
                waveAmplitude: 1.0,
                backgroundColor: Colors.white,
                size: Size(double.infinity, 100.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
