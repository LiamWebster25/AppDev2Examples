import 'package:flutter/material.dart';
import 'SecondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState(guests: 2, rooms: 1);
}

class _ReservationScreenState extends State<ReservationScreen> {
  int guests;
  int rooms;

  _ReservationScreenState({required this.guests, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Location row
            Row(
              children: [
              Icon(Icons.location_on),
              Text('Las Vegas, NV',
                  )],),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            //Guest Row
            Row(
              children: [
                Icon(
                  Icons.people,
                ),
                Text(' $guests '),
                Expanded(child: Text('Guest(s)')),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (guests > 1) guests--;
                    });
                  },
                ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      guests++;
                    });
                  },
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Icon(Icons.bed),
                Text(' $rooms '),
                Expanded(child: Text('Room(s)')),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (rooms > 1) rooms--;
                    });
                  },
                ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      rooms++;
                    });
                  },
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
            Icon(Icons.arrow_forward_rounded),
            Expanded(child: Text(" Today ")),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Icon(Icons.arrow_back_rounded),
                Expanded(child: Text(" Tomorrow ")),
              ],
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height:40),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('You are trying to book ${guests} guest(s) and ${rooms} room(s).'),
                ));
              },
              child: Text('Reserve'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size.fromHeight(50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(guests: guests, rooms: rooms)),
                );
              },
              child: Text('Book Hotels'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
