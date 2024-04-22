import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var BMI = 0.0;
var height = 1.0;
var weight = 55;
var age = 40;
bool? gender;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  weightIncrement() {
    setState(() {
      weight++;
    });
  }

  weightDecrement() {
    setState(() {
      weight--;
    });
  }

  ageIncrement() {
    setState(() {
      age++;
    });
  }

  ageDecrement() {
    setState(() {
      age--;
    });
  }

  bmiCalculate() {
    setState(() {
      BMI = weight / ((height * 0.3048) * (height * 0.3048));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('BMI CALCULATOR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text("Your BMI - ${BMI.toStringAsFixed(2)}", style: TextStyle(color: Colors.lightGreen, fontSize: 20),),
                  ],
                ),
              ),
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: gender,
                            onChanged: (bool? value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          Icon(Icons.woman, color: Colors.white, size: 70,),
                        ],
                      )
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue: gender,
                          onChanged: (bool? value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        Icon(Icons.man, color: Colors.white, size: 70,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              height: 125,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text('${height.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 24),),
                    Text('Height (ft)', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Slider(
                      min: 1,
                      max: 8,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Weight (Kg)', style: TextStyle(color: Colors.white)),
                        Text('${weight}', style: TextStyle(color: Colors.white)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              ElevatedButton(
                                  onPressed: () {
                                    weightIncrement();
                                  }, child: Icon(Icons.add, color: Colors.blueGrey)),
                              SizedBox(width: 50),
                              ElevatedButton(
                                  onPressed: () {
                                    weightDecrement();
                                  }, child: Icon(Icons.remove, color: Colors.blueGrey)),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Age (Kg)', style: TextStyle(color: Colors.white)),
                        Text('${age}', style: TextStyle(color: Colors.white)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              ElevatedButton(
                                  onPressed: () {
                                    ageIncrement();
                                  }, child: Icon(Icons.add, color: Colors.blueGrey)),
                              SizedBox(width: 50),
                              ElevatedButton(
                                  onPressed: () {
                                    ageDecrement();
                                  }, child: Icon(Icons.remove, color: Colors.blueGrey)),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              bmiCalculate();
            }, child: Text('CALCULATE', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 32))
            ),
          ],
        ),
      ),
    );
  }
}
