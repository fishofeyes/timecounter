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

``` dart
/**
* Examples:

*     class _SmsCounterViewState extends State<SmsCounterView> {
*       TimeTool _timer;
*       int counter = 59;

*     @override
*     void initState() {
*       super.initState();
*       _beginTimer();
*     }

*     @override
*     void dispose() {
*       _timer.stop();
*       super.dispose();
*     }

*     void _beginTimer() {
*       _timer = TimeTool.begin(duration: 59, callback:(timerCount){ 
*         // do somthing ...
*       });
*     }
*/
```
