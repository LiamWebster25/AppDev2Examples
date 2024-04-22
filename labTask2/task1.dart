import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            CircleAvatar(
              radius: 80, // Image radius
              backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
            ),
            Text('Liam Webster', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('MOBILE DEVELOPER', style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
            Container(child:
            Divider(),
            width: 150,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
                child:
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 50),
                Text('+84 123456789'),
              ]
            ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child:
              Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 50),
                    Text('tynk.mobiledev@gmail.com'),
                  ]
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child:
              Row(
                  children: [
                    Icon(Icons.facebook),
                    SizedBox(width: 50),
                    Text('@tinh_huynh_97'),
                  ]
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child:
              Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 50),
                    Text('TinHuynh'),
                  ]
              ),
            ),
          ]
        )
      )
    );
  }
}
