import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';

import '../Components/location.dart';
import '../services/networking.dart';
import '../utilities/constant.dart';


class LocationScreen extends StatefulWidget {
  final dynamic weatherData;

  LocationScreen({required this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int? temprature;
  var Condition;
  var Cityname;
  var WeatherMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUi(widget.weatherData);
  }


  void UpdateUi(dynamic weatherData){
    setState(() {
      double temp=weatherData['main']['temp'];
      temprature=temp.toInt();
      Condition=weatherData['weather'][0]["id"];
      WeatherMessage=WeatherModel().getMessage(temprature!);
      Cityname=weatherData['name'];
    });
  }

  void Weatherupdate() async{
    dynamic weatherdata= await Networking().getPositionWeather();
    UpdateUi(weatherdata);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://cdn.dribbble.com/users/925716/screenshots/4531553/attachments/1025680/beautiful_night.jpg?resize=400x300&vertical=center',),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Weatherupdate();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      WeatherModel().getWeatherIcon(Condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$WeatherMessage in $Cityname',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}