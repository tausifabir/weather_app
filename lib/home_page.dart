import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app_api/detail_page.dart';
import 'package:weather_app_api/extra_weather.dart';
import 'package:weather_app_api/model/dataset.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CurrentWeather(),
          TodayWeather(),

        ],
        //  CurrentWeather(),
      ),
    );
  }
}
class CurrentWeather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 230,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff00A1FF).withOpacity(0.5),
      color: Color(0xff00A1FF),
      spreadRadius: 5,
      borderRadius:  const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),

      child: Column(
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
                    'Dhaka',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                         '22',
                          style: TextStyle(
                              height: 0.1,
                              fontSize: 150,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Rainy',
                            style: TextStyle(
                              fontSize: 25,
                            ),),
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
                        ExtraWeather(currentTemp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),


      //padding: EdgeInsets.only(top: 50, left: 30, right: 30),
    );
  }
}


class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return DetailPage();
                      }));
                },
                child: Row(
                  children: [
                    Text(
                      "7 days ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherWidget(todayWeather[0]),
                  WeatherWidget(todayWeather[1]),
                  WeatherWidget(todayWeather[2]),
                  WeatherWidget(todayWeather[3])
                ]),
          )
        ],
      ),
    );
  }
}


class WeatherWidget extends StatelessWidget {
  final Weather weather;
  WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Text(
            weather.current.toString() + "\u00B0",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(weather.image),
            width: 50,
            height: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            weather.time.toString(),
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}


