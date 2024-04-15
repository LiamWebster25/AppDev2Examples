//DEPENDENCIES:
//page_transition: ^2.1.0 -> flutter

import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime currentDate = DateTime.now();
  Future<void> _selectTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030));
    if(pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentDate.toString()),
            ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Pick a Date'))
          ],
        ),
      ),
    );
  }
}