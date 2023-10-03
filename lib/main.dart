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
  final String _cityName = 'Irkutsk';
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
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: weatherList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data?.name}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
