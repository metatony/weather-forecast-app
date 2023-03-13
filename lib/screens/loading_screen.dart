import 'package:flutter/material.dart';
import 'package:weather_forecast_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    // the initstate method activates the moment the stateful widget is created instead than triggering a button
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=a04e6a760b830de512a8f80d9ac41892'));
    print(response.body);
    // the weather information are contained in the body property
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
