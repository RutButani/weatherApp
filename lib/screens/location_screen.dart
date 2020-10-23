import 'package:flutter/material.dart';
import 'package:wheathy/utilities/constants.dart';
import 'package:wheathy/services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final locationWeather;
  int a;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  double  temperature;
  String  description;
  int  humidity;
  double  windSpeed;
  String  cityName;







  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);

  }

  void updateUI(dynamic weatherData)
  {
    setState(() {
      temperature= weatherData['main']['temp'];
      description=weatherData['weather'][0]['description'];
      humidity=weatherData['main']['humidity'];
      windSpeed=weatherData['wind']['speed'];
      cityName= weatherData['name'];

      print(temperature);
      print(description);
      print(humidity);
      print(windSpeed);
      print(cityName);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add here
    );
  }
}
