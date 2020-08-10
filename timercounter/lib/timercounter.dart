library timercounter;
export 'package:timercounter/timercounter.dart';
class TimerCounter {
  
  int duration;
  /// 定时速度
  int _speed;
  Function(int count) callback;
  
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
      if(duration >= 0){
        if(callback != null) callback(duration);
        _begin();
      }
    });
  }

  void stop() {
    duration = 0;
  }
  
}
