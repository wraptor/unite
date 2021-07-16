import 'dart:async';

/// 防抖，1000内再次触发不执行
/// @param immediate 是否立即执行
///

void Function() debounce(
  Function func, {
  int delay = 500,
  bool immediate = true,
}) {
  Timer? timer;
  bool enable = true;
  return () {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    if (enable) {
      enable = false;
      if (immediate) {
        func.call();
      }
    }
    if (immediate) {
      timer = Timer(Duration(milliseconds: delay), () {
        enable = true;
      });
    } else {
      timer = Timer(Duration(milliseconds: delay), () {
        func.call();
        enable = true;
      });
    }
  };
}

/// 防抖，500内再次触发不执行
class Debounce {
  Timer? _timer;

  /// Call this intance as a function
  void call(Function fn, [Duration d = const Duration(milliseconds: 500)]) {
    cancel();
    _timer = Timer(d, () => fn());
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }
}
