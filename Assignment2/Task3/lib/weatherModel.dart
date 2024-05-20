import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherCurrent current;
  WeatherForecast forecast;

  WeatherData({
    required this.current,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    current: WeatherCurrent.fromJson(json['current']),
    forecast: WeatherForecast.fromJson(json['forecast']),
  );

  Map<String, dynamic> toJson() => {
    "current": current.toJson(),
    "forecast": forecast.toJson(),
  };
}

class WeatherCurrent {
  double tempC;
  String icon;
  double windKph;
  double precip;
  int cloud;
  String conditionText; // Add this line

  WeatherCurrent({
    required this.tempC,
    required this.icon,
    required this.windKph,
    required this.precip,
    required this.cloud,
    required this.conditionText, // Add this line
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) => WeatherCurrent(
    tempC: json['temp_c'],
    icon: json['condition']['icon'],
    windKph: json['wind_kph'],
    precip: json['precip_mm'],
    cloud: json['cloud'],
    conditionText: json['condition']['text'], // Add this line
  );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "icon": icon,
    "wind_kph": windKph,
    "precip_mm": precip,
    "cloud": cloud,
    "condition_text": conditionText, // Add this line
  };
}

class WeatherForecast {
  List<ForecastDay> forecastDay;

  WeatherForecast({
    required this.forecastDay,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        forecastDay: List<ForecastDay>.from(
            json['forecastday'].map((x) => ForecastDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "forecastday": List<dynamic>.from(forecastDay.map((x) => x.toJson())),
  };
}

class ForecastDay {
  String date;
  List<HourWeather> hours;

  ForecastDay({
    required this.date,
    required this.hours,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
    date: json['date'],
    hours: List<HourWeather>.from(
        json['hour'].map((x) => HourWeather.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "hour": List<dynamic>.from(hours.map((x) => x.toJson())),
  };
}

class HourWeather {
  String time;
  double tempC;
  String icon;

  HourWeather({
    required this.time,
    required this.tempC,
    required this.icon,
  });

  factory HourWeather.fromJson(Map<String, dynamic> json) => HourWeather(
    time: json['time'],
    tempC: json['temp_c'],
    icon: json['condition']['icon'],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temp_c": tempC,
    "icon": icon,
  };
}