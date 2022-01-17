import 'package:flutter/material.dart';
import 'dart:convert';
import 'home_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_api/model/weatherapi_model.dart';

void main() {
  runApp(MyApp());
}

Future<WeatherApi> fetchWeatherData() async {
  //WeatherApi weatherApi;
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=dhaka&units=imperial&appid=a955710c7e69bc1fffdc0a966fa372d4'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return WeatherApi.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }

  //print(weatherApi.toString());

  //return weatherApi;
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List res;
//  late WeatherApi weatherApi;
  //var rest;
  //late WeatherApi weatherApi;

  @override
  void initState() {
    print('initState');
    //WeatherApi weatherApi;
    // rest = fetchWeatherData().toString();
    /*fetchWeatherData().then((value) {
      weatherApi = value;
      print(weatherApi.main.temp.toString());
    });*/
    //print("weatherApi.main.temp.toString()");
    //print(rest);
    //weatherApi = fetchWeatherData() as WeatherApi;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
