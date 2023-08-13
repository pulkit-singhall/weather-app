import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_data.dart';
import 'package:weather_app/secrets.dart';
import 'hourly_card_item.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  // fetching data from web
  Future<Map<String,dynamic>> getWeatherData() async {
    try {
      String city = "Delhi";
      String country = "india";
      // using get command
      String url =
          "https://api.openweathermap.org/data/2.5/forecast?q=$city,$country&APPID=$WeatherApiId";
      final res = await http.get(
        Uri.parse(
          url,
        ),
      );
      final body = res.body;
      final weatherData = jsonDecode(body);

      if (weatherData["cod"] != "200") {
        throw "Exceptional Error";
      }
      return weatherData;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.red,
        toolbarHeight: 60,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          // snapshot gives all the states in flutter
          // loading data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          // error
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          // data values
          final data=snapshot.data!;
          final currentTemp = data["list"][0]["main"]["temp"];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              // main column
              children: [
                // main card
                SizedBox(
                  width: double.infinity, // full screen
                  child: Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Text(
                            "$currentTemp K",
                            style:const  TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                color: Color.fromARGB(255, 53, 52, 52)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Icon(
                            Icons.cloud,
                            size: 50,
                            color: Color.fromARGB(255, 53, 52, 52),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Rain",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Color.fromARGB(255, 53, 52, 52),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // different time slots recycler view
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Weather Forecast",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyCard(
                        temp: "150 K",
                        icon: Icons.cloud,
                        time: "9:00",
                      ),
                      HourlyCard(
                        temp: "130 K",
                        icon: Icons.cloud,
                        time: "10:00",
                      ),
                      HourlyCard(
                        temp: "145 K",
                        icon: Icons.cloud,
                        time: "11:00",
                      ),
                      HourlyCard(
                        temp: "165 K",
                        icon: Icons.sunny,
                        time: "12:00",
                      ),
                      HourlyCard(
                        temp: "175 K",
                        icon: Icons.sunny,
                        time: "1:00",
                      ),
                      HourlyCard(
                        temp: "132 K",
                        icon: Icons.cloud,
                        time: "2:00",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // other details
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Additional Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // details
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalDetail(
                      icon: Icons.water_drop,
                      measure: "Humidity",
                      value: "94",
                    ),
                    AdditionalDetail(
                      icon: Icons.air,
                      measure: "Wind Speed",
                      value: "11",
                    ),
                    AdditionalDetail(
                      icon: Icons.shutter_speed,
                      measure: "Pressure",
                      value: "1209",
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
