import 'package:geolocator/geolocator.dart';

class Location{
  var latitude;
  var logtitude;


 Future<void> getLocation()async{
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      logtitude=position.longitude;
    }catch(e){
      print(e);
    }
  }




}

