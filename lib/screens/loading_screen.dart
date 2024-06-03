import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/Components/location.dart';

import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  Networking networking=Networking();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    networking.getPositionWeather();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}