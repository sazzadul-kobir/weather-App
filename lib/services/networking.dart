import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Components/location.dart';

class Networking{
  String apiKey="e60c98af58f3563d8e9f5642845d6a51";

  Location _location=Location();



  Future getPositionWeather() async{
    await _location.getLocation();
    http.Response response =await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.logtitude}&appid=$apiKey&units=metric'));
    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      print("error");
    }
  }



}