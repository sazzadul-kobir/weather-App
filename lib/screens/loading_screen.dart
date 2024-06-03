import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  }

  void getWeatherData()async{
   weatherData=await networking.getPositionWeather();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: weatherData,),));
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}