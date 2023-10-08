// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:http_test_2/constants.dart';
import 'package:http_test_2/models/weather_data.dart';

import 'api/weather_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _cityName = 'Novosibirsk';
  late Future<WeatherData> weatherList;
  @override
  void initState() {
    weatherList = fetchWeatherForecastWithCity(cityName: _cityName);
    weatherList.then((weather) {
      print(weather.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'WEATHER APP',
            style: TextStyle(fontSize: 26),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            onPressed: () {},
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: Center(
          child: Container(
            decoration: bacgroundDecoration,
            height: height,
            width: width,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 7,
                      ),
                      Expanded(
                        flex: 3,
                        child: temperatureWidget(
                          weatherList: weatherList,
                          textStyle: textStyleTemperature,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: cityNameWidget(
                          weatherList: weatherList,
                          textStyle: textStyleCity,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: rowWithWeatherData(
                            weatherList: weatherList,
                            width: width,
                            height: height),
                      ),
                      const Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class rowWithWeatherData extends StatelessWidget {
  const rowWithWeatherData({
    super.key,
    required this.weatherList,
    required this.width,
    required this.height,
  });

  final Future<WeatherData> weatherList;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FutureBuilder(
            future: weatherList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                        width: width / 5,
                        height: height / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/wind.png')))),
                    Text(
                      '${snapshot.data?.wind?.speed}м/с',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        FutureBuilder(
            future: weatherList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width / 5,
                      height: height / 5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${snapshot.data?.weather?[0].icon}.png'))),
                    ),
                    Text(
                      '${snapshot.data?.weather?[0].description}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        FutureBuilder(
            future: weatherList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                        width: width / 5,
                        height: height / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/clouds.png')))),
                    Text(
                      '${snapshot.data?.clouds?.all}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}

class cityNameWidget extends StatelessWidget {
  const cityNameWidget({
    super.key,
    required this.weatherList,
    this.textStyle,
  });

  final Future<WeatherData> weatherList;
  final dynamic textStyle;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weatherList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              '${snapshot.data?.name}',
              style: textStyle,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class temperatureWidget extends StatelessWidget {
  const temperatureWidget({
    Key? key,
    required this.weatherList,
    required this.textStyle,
  }) : super(key: key);

  final Future<WeatherData> weatherList;
  final dynamic textStyle;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weatherList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('${snapshot.data?.main?.temp?.toInt()}°C',
                style: textStyle);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
