import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Class_Provider extends ChangeNotifier{

   double?lon,lat;

   List l1=[];

   void getPositon()async{
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     lon =position.longitude;
     lat = position.latitude;

     List placemark = await placemarkFromCoordinates(lat!, lon!);
     l1 = placemark;
     notifyListeners();
   }
}