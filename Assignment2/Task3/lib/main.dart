import 'package:flutter/material.dart';
import 'weatherAPI.dart';
import 'weatherModel.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(), // Changed from MainApp to WeatherScreen
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _selectedLocation = "Montreal";
  List<String> locations = [
    'Montreal',
    'New York',
    'Bangkok',
    'Sydney',
    'Madrid',
    'Moscow',
    'Tokyo',
  ];
  var weatherAPI = WeatherAPI();
  late WeatherData? _weatherData = null;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<WeatherData?> _loadWeather() async {
    _weatherData = (await weatherAPI.getWeather(_selectedLocation));
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  String _getTime(String time) {
    return time.substring(time.length - 5);
  }

  String formatDateString(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('EEEE, MMMM d').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _weatherData == null
            ? Center(child: CircularProgressIndicator())
            : Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 545,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [

                          Spacer(),
                          DropdownButton<String>(
                            value: _selectedLocation,
                            dropdownColor: Colors.lightBlueAccent,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _selectedLocation = value;
                                }
                                _loadWeather();
                              });
                            },
                            items: locations
                                .map<DropdownMenuItem<String>>(
                                    (String location) {
                                  return DropdownMenuItem<String>(
                                    value: location,
                                    child: Text(
                                      location,
                                      style: TextStyle(color: Colors.white),

                                    ),
                                  );
                                }).toList(),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      "https:${_weatherData!.current.icon}",
                      width: 180,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "${_weatherData!.current.tempC}°",
                      style: TextStyle(
                          fontSize: 48, color: Colors.lightBlue[100]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${_weatherData!.current.conditionText}", //ADD CONDITION
                      style: TextStyle(
                          fontSize: 20, color: Colors.lightBlue[100]),
                    ),
                    SizedBox(height: 7),
                    Text(
                      formatDateString(_weatherData!.forecast.forecastDay[0].date),
                      style: TextStyle(
                          fontSize: 13, color: Colors.lightBlue[100]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 290,
                      child: Divider(thickness: 1),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind:",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightBlue[100]),
                              ),
                              Text(
                                style: TextStyle(color: Colors.white),
                                "${_weatherData!.current.windKph}km/h",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Precipitation:",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightBlue[100]),
                              ),
                              Text(
                                style: TextStyle(color: Colors.white),
                                "${_weatherData!.current.precip}mm",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Clouds:",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightBlue[100]),
                              ),
                              Text(
                                style: TextStyle(color: Colors.white),
                                "${_weatherData!.current.cloud}%",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hourly:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 392,
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              height: 115,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    _getTime(_weatherData!.forecast.forecastDay.first.hours[index].time),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.network(
                                    "https:${_weatherData!.forecast.forecastDay.first.hours[index].icon}",
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.contain,
                                  ),
                                  Text(
                                    "${_weatherData!.forecast.forecastDay.first.hours[index].tempC}°",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
