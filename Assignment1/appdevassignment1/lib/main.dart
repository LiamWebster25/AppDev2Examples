import 'package:flutter/material.dart';
import 'Login.dart';
import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-up'),
      ),
      body: Center(
    child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.question_answer,
            size: 200,
            color: Colors.blue),
            SizedBox(height: 20.0,),
            Container(
              width: 500,
              child:
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email',
              ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 500,
              child:
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
    ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                User user = new User(_emailController.text, _passwordController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Registration Successful!"),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login(user)),
                );
              },
              child: Text('Sign up'),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
      ),
    );
  }
}
