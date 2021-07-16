import 'package:example/pages/shared_preferences_page.dart';
import 'package:example/pages/throttle_debounce_page.dart';
import 'package:example/pages/toast_page.dart';
import 'package:flutter/material.dart';
import 'package:unite/uni.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unite Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: Uni.builder(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> lists(c) {
    return [
      ListTile(
        title: const Text("Toast/Loading"),
        onTap: () {
          Navigator.of(c).push(MaterialPageRoute(
              builder: (BuildContext context) => ToastPage()));
        },
      ),
      ListTile(
        title: const Text("SharedPreferences"),
        onTap: () {
          Navigator.of(c).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  const SharedPreferencesPage()));
        },
      ),
      ListTile(
        title: const Text("Debounce/Throttle"),
        onTap: () {
          Navigator.of(c).push(MaterialPageRoute(
              builder: (BuildContext context) => const DebounceThrottlePage()));
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    Uni.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (c, i) => lists(c)[i],
          separatorBuilder: (c, i) => const Divider(
                height: 1,
              ),
          itemCount: lists(context).length),
    );
  }
}
