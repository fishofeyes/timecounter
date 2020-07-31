library timercounter;

class TimeCounter {
  
  int duration;
  /// 定时速度
  int _speed;
  Function(int count) callback;

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
  static TimeCounter begin({int duration, int speed = 1, Function(int count) callback}) {
    final tool = TimeCounter();
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
