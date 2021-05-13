# timercounter

倒计时工具.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Usage

It is really easy to use!
You should ensure that you add the `timercounter` as a dependency in your flutter project.

```yaml
dependencies:
  timercounter: ^0.0.4
```

``` dart

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

```
