import "package:flutter/material.dart";
import "main.dart";

class SecondScreen extends StatelessWidget {
final int guests;
final int rooms;

SecondScreen({required this.guests, required this.rooms});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
          body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("You booked ${guests} guest(s) and ${rooms} room(s). Thanks.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            ),
          ),
    ),
          );
  }
}
