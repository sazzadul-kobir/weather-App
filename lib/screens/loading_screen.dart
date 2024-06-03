import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/Components/location.dart';

import '../services/networking.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  Networking networking=Networking();
  dynamic weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getWeatherData();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: weatherData),));

    });


  }

  void getWeatherData()async{
   weatherData=await networking.getPositionWeather();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/anim.json'),
              SizedBox(height: 50,),
              Lottie.asset('assets/lottie/loading.json',height: 100)
            ],
          ),
        ),
      ),
    );
  }
}