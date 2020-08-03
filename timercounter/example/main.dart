import 'package:flutter/material.dart';
import 'package:timercounter/timercounter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimerCounter _timeCounter;
  int counter = 59;

  @override
  void dispose() {
    _timeCounter.stop();
    super.dispose();
  }

  void _beginTimer() {
    _timeCounter = TimerCounter.begin(duration: 60, callback: (index){
      setState(() {
        counter = index;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("$counter"),
          RaisedButton(
            onPressed: _beginTimer,
          )
        ],
      ),
    );
  }
}