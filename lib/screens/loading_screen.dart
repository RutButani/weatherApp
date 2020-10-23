

import 'package:wheathy/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:wheathy/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {


  void initState()
  {
    super.initState();
    getLocationData();

  }

  void getLocationData() async
  {
    Location location=Location();
    await location.getCurrentLocation();



    NetworkHelper networkHelper=NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=1fa2ba1587900f8af932f5341ca28acc');

    var weatherData= await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,
      );

    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.yellow,
          size: 100.0,

        ),
      ),
    );
  }
}
