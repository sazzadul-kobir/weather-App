import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapp/screens/city_screen.dart';
import 'package:weatherapp/services/weather.dart';

import '../services/networking.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;

  LocationScreen({required this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var temprature;
  var Condition;
  var Cityname;
  var WeatherMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUi(widget.weatherData);
  }

  void UpdateUi(dynamic weatherData) {


    if(weatherData !=null){
      setState(() {

        double temp = weatherData['main']['temp'];
        temprature = temp.toInt();
        Condition = weatherData['weather'][0]["id"];
        WeatherMessage = WeatherModel().getMessage(temprature!);
        Cityname = weatherData['name'];
      });
    }
  }

  void Weatherupdate() async {
    dynamic weatherdata = await Networking().getPositionWeather();
    UpdateUi(weatherdata);
  }

  void CityWeatherupDate(String cityname, BuildContext Context) async {
    dynamic cityWeatherData = await Networking().getCityWeather(cityname);
    if(cityWeatherData !=null){
      UpdateUi(cityWeatherData);
      Navigator.pop(Context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> iconndbackground =
        WeatherModel().getWeatherIconndBackgroundimg(Condition);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Weatherupdate();
                    },
                    icon: Icon(
                      Icons.location_on,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context) => CityScreen(cityWeatherFunction: CityWeatherupDate),
                      ));
                    },
                    icon: Icon(
                      Icons.location_city,
                      size: 40,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${temprature.toString()}°",
                      style: TextStyle(fontSize: 70),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      iconndbackground['icon']!,
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
                Text(
                  "$WeatherMessage in $Cityname",
                  style: TextStyle(fontSize: 15),
                )
              ],
            )),
            SvgPicture.asset(iconndbackground['background']!,
                fit: BoxFit.fitHeight),
          ],
        ),
      ),
    ));
  }
}
