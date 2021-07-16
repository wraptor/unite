import 'dart:async';

/// 节流
/// 比如有一个按钮执行需要打印"hello world"，使用节流后，按钮连续点击在wait间隔连续触发
/// @param func 执行函数
/// @param duration 间隔时常
/// @returns {function(): void}
bool enable = true;

void Function() throttle(
  Function() func, {
  int delay = 1000,
}) {
  return () {
    if (enable) {
      enable = false;
      func();
      Future.delayed(Duration(milliseconds: delay)).then((value) {
        enable = true;
      });
    }
  };
}

class Throttle {
  Timer? _interval;
  Function? _nextFn;
  void call(Function fn, [Duration delay = const Duration(milliseconds: 1000)]) {
    if (_interval != null) {
      _nextFn = fn;
      return;
    }
    _interval = Timer.periodic(delay, (timer) {
      if (_nextFn == null) {
        cancel();
        return;
      }
      _nextFn!();
      _nextFn = null;
    });
    fn();
  }
  void cancel() {
    _interval?.cancel();
    _interval = null;
  }
}
