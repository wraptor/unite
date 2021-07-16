import 'package:flutter/material.dart';
import 'package:unite/uni.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SharedPreferencesPage> {
  late String value = "";

  @override
  void initState() {
    super.initState();
    Uni.set("value", "我是保存在sharedPreferences的");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Text("value:$value"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    value = "我是主动设置的";
                  });
                },
                child: const Text("设置值"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    value = Uni.get("value");
                  });
                },
                child: const Text("从sp取值"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
