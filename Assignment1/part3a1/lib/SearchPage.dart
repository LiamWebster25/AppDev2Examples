import 'package:flutter/material.dart';
import 'main.dart';
import 'ConvertTemperature.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()), // Navigate to the SearchPage
      );
    }
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()), // Navigate to the SearchPage
      );
    }
    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConvertTemperature()), // Navigate to the SearchPage
      );    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row( //ROW 1 --------------------------------------
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.map, color: Colors.blue, size: 150),
                  ),
                  Text('Map'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.qr_code_2, color: Colors.blue, size: 150),
                  ),
                  Text('QRCode'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.cloud, color: Colors.blue, size: 150),
                  ),
                  Text('Weather'),
                ],
              ),
            ],
          ),
          Row( //ROW 2 ---------------------------------------
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.location_city, color: Colors.purple, size: 150),
                  ),
                  Text('City Guides'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.directions_walk_rounded, color: Colors.green, size: 150),
                  ),
                  Text('Walk'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.directions_boat, color: Colors.green, size: 150),
                  ),
                  Text('Boat'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.pedal_bike, color: Colors.green, size: 150),
                  ),
                  Text('Bike'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.restaurant, color: Colors.red, size: 150),
                  ),
                  Text('Food'),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.car_rental, color: Colors.green, size: 150),
                  ),
                  Text('Car'),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
