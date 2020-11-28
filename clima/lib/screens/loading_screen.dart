import 'package:flutter/material.dart';
import '../services/location.dart';
import 'dart:convert';
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
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }

  void getLocation() async {
    Location location = Location();
    try {
      await location.getCurrentPosition();
    } catch (e) {
      print(e);
    }
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double temp = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String city = decodedData['name'];
    } else {
      print(response.statusCode);
    }
  }
}
