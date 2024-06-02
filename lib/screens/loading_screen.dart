import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/Components/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  Location location=Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getposition();

  }
  void getposition() async{
    await location.getLocation();
    print(location.logtitude);
    print(location.latitude);
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