import 'package:flutter/material.dart';
import 'package:unite/uni.dart';

class DebounceThrottlePage extends StatefulWidget {
  const DebounceThrottlePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DebounceThrottlePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Throttle/Debounce"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: debounce(() {
                  Uni.toast("触发了防抖$count");
                  count++;
                }),
                child: const Text("防抖(先执行)"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: debounce(() {
                  Uni.toast("触发了防抖$count");
                  count++;
                }, immediate: false),
                child: const Text("防抖(后执行)"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: throttle(() {
                  Uni.toast("触发了$count");
                  count++;
                }, delay: 2000),
                child: const Text("节流（2秒一次）"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
