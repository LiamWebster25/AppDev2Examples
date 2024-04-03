import 'package:flutter/material.dart';
import 'User.dart';
import 'LoggedIn.dart';

class Login extends StatelessWidget {
  final User user;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Login(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                if (user.email == _emailController.text && user.password == _passwordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login successful!"),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoggedIn(user)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login unsuccessful!"),
                    ),
                  );
                }
              },
              child: Text('Log in'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
