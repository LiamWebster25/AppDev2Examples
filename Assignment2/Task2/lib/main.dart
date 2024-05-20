import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Calendar.dart';
import 'Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePageDrawer(),
    );
  }
}

class MyHomePageDrawer extends StatelessWidget {
  const MyHomePageDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 2'),
      ),
      body: Center(
        child: Text('Hello this is the 2nd task for assignment 2'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Calendar()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(content: Text('You are being logged out'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
