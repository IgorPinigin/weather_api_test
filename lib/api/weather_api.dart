import 'package:http/http.dart';
import 'package:http_test_2/models/weather_data.dart';

Future<WeatherData> fetchWeatherForecastWithCity(
    {required String cityName}) async {
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=fb78fc94aabe01afc6a5b830bf2141e5&units=metric';
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    return WeatherData.fromJson(response.body);
  } else {
    throw Exception('Error:${response.reasonPhrase}');
  }
}
