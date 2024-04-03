import 'package:flutter/material.dart';
import 'User.dart';

class LoggedIn extends StatelessWidget {
  final User user;

  LoggedIn(this.user); // Added parameter type and this keyword
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome! You are logged in"),
      ), // Added comma here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${user.email}!"),
          ],
        ),
      ),
    );
  }
}
