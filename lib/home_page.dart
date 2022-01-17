import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_api/ui/current_weather.dart';
import 'package:weather_app_api/ui/today_weather.dart';
import 'dart:async';

import 'model/weatherapi_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentWeather(),
          TodayWeather(),
        ],
        //  CurrentWeather(),
      ),
    );
  }
}
