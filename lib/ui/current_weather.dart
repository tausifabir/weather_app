import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app_api/detail_page.dart';
import 'package:weather_app_api/extra_weather.dart';
import 'package:weather_app_api/model/dataset.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_api/model/weatherapi_model.dart';

Future<WeatherApi> fetchWeatherData() async {
  //WeatherApi weatherApi;
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=paris&appid=a955710c7e69bc1fffdc0a966fa372d4'));

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

class CurrentWeather extends StatelessWidget {
  late Future<WeatherApi> weatherApi;

  @override
  void initState() {
    print('initState');
    weatherApi = fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 230,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff00A1FF).withOpacity(0.5),
      color: Color(0xff00A1FF),
      spreadRadius: 5,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),

      child: FutureBuilder<WeatherApi>(
        future: fetchWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.square_grid_2x2,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.map_fill, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!.name.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Updating",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 430,
                  child: Stack(
                    children: [
                      // Image.asset('assets/rainy_2d.png'),

                      Image(
                        image: AssetImage('assets/rainy.png'),
                        fit: BoxFit.fill,
                      ),

                      /*Image(
                      image: AssetImage(currentTemp.image),
                      fit: BoxFit.fill,
                    ),*/
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Column(
                            children: [
                              GlowText(
                                snapshot.data!.main.temp.toString(),
                                style: TextStyle(
                                    height: 0.1,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.weather[0].main.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Monday',
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ExtraWeather(
                                snapshot.data!.wind.speed.toString(),
                                snapshot.data!.main.humidity.toString(),
                                snapshot.data!.main.pressure.toString(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),

      //padding: EdgeInsets.only(top: 50, left: 30, right: 30),
    );
  }
}
