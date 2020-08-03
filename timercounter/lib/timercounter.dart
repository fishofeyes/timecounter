library timercounter;

class TimerCounter {
  
  int duration;
  /// 定时速度
  int _speed;
  Function(int count) callback;

  /**
    * Examples:

    *     class _SmsCounterViewState extends State<SmsCounterView> {
    *       TimeCounter _timer;
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
    *       _timer = TimeCounter.begin(duration: 59, callback:(timerCount){ 
    *         // do somthing ...
    *       });
    *     }
    */
  static TimerCounter begin({int duration, int speed = 1, Function(int count) callback}) {
    final tool = TimerCounter();
    tool.duration = duration;
    tool.callback = callback;
    tool._speed = speed;
    tool._begin();
    return tool;
  }

  void _begin() {
    Future.delayed(Duration(seconds: _speed)).then((value) {
      duration -= 1;
      if(callback != null) callback(duration);
      if(duration >= 0) _begin();
    });
  }

  void stop() {
    duration = 0;
  }
  
}
