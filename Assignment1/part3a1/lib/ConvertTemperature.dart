import 'package:flutter/material.dart';
import 'main.dart';
import 'SearchPage.dart';

class ConvertTemperature extends StatefulWidget {
  @override
  _ConvertTemperatureState createState() => _ConvertTemperatureState();
}

class _ConvertTemperatureState extends State<ConvertTemperature> {
  int _selectedIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String _result = '0';
  bool _isFahrenheitToCelsius = true;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConvertTemperature()),
      );
    }
  }

  void _convertTemperature() {
    final double? value = double.tryParse(_controller.text);
    if (value != null) {
      if (_isFahrenheitToCelsius) {
        _result = '${((value - 32) * 5 / 9).toStringAsFixed(2)}°C';
      } else {
        _result = '${(value * 9 / 5 + 32).toStringAsFixed(2)}°F';
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConvertTemperature')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _isFahrenheitToCelsius = !_isFahrenheitToCelsius;
                });
              },
              child: Text(_isFahrenheitToCelsius ? 'F -> C' : 'C -> F'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('SUBMIT'),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(10),
              width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Center( child: Text('${_result}',
                    style: TextStyle(
                        color: Colors.white)))
            ),],
        ),
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
