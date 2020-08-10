import 'package:flutter/material.dart';

import 'package:timercounter/timercounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimerCounter _timeCounter;
  int counter = 10;

  @override
  void dispose() {
    _timeCounter.stop();
    super.dispose();
  }

  void _beginTimer() {
    _timeCounter = TimerCounter.begin(duration: counter, callback: (index){
      setState(() {
        counter = index == 0 ? 10 : index;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter++"),
            RaisedButton(
              child: Text("begin"),
              onPressed: _beginTimer,
            ),
            RaisedButton(
              child: Text("stop"),
              onPressed: () => _timeCounter.stop(),
            )
          ],
        ),
      ),
    );
  }
}