// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherData {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherData(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'rain': rain?.toMap(),
      'clouds': clouds?.toMap(),
      'dt': dt,
      'sys': sys?.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      coord: map['coord'] != null
          ? Coord.fromMap(map['coord'] as Map<String, dynamic>)
          : null,
      weather: map['weather'] != null
          ? List<Weather>.from((map['weather'] as List<dynamic>)
              .map<Weather?>((x) => Weather.fromMap(x as Map<String, dynamic>)))
          : null,
      base: map['base'] != null ? map['base'] as String : null,
      main: map['main'] != null
          ? Main.fromMap(map['main'] as Map<String, dynamic>)
          : null,
      visibility: map['visibility'] != null ? map['visibility'] as int : null,
      wind: map['wind'] != null
          ? Wind.fromMap(map['wind'] as Map<String, dynamic>)
          : null,
      rain: map['rain'] != null
          ? Rain.fromMap(map['rain'] as Map<String, dynamic>)
          : null,
      clouds: map['clouds'] != null
          ? Clouds.fromMap(map['clouds'] as Map<String, dynamic>)
          : null,
      dt: map['dt'] != null ? map['dt'] as int : null,
      sys: map['sys'] != null
          ? Sys.fromMap(map['sys'] as Map<String, dynamic>)
          : null,
      timezone: map['timezone'] != null ? map['timezone'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      cod: map['cod'] != null ? map['cod'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherData(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, rain: $rain, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'] != null ? map['lon'] as double : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) =>
      Coord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] != null ? map['id'] as int : null,
      main: map['main'] != null ? map['main'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] != null ? map['temp'] as double : null,
      feelsLike: map['feelsLike'] != null ? map['feelsLike'] as double : null,
      tempMin: map['tempMin'] != null ? map['tempMin'] as double : null,
      tempMax: map['tempMax'] != null ? map['tempMax'] as double : null,
      pressure: map['pressure'] != null ? map['pressure'] as int : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }
}

class Wind {
  num? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] != null ? map['speed'] as num : null,
      deg: map['deg'] != null ? map['deg'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';
}

class Rain {
  double? d1h;

  Rain({this.d1h});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'd1h': d1h,
    };
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      d1h: map['d1h'] != null ? map['d1h'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) =>
      Rain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rain(d1h: $d1h)';
}

class Clouds {
  int? all;

  Clouds({this.all});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] != null ? map['all'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) =>
      Clouds.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Clouds(all: $all)';
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type'] != null ? map['type'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      sunrise: map['sunrise'] != null ? map['sunrise'] as int : null,
      sunset: map['sunset'] != null ? map['sunset'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) =>
      Sys.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }
}
