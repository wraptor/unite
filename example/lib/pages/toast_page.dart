import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unite/uni.dart';

class ToastPage extends StatelessWidget {
  ToastPage({Key? key}) : super(key: key);

  final List<Widget> lists = [
    ListTile(
      title: const Text("uni.toast"),
      onTap: () => Uni.toast("hello"),
    ),
    ListTile(
      title: const Text("uni.success"),
      onTap: () => Uni.success("hello"),
    ),
    ListTile(
      title: const Text("uni.info"),
      onTap: () => Uni.info("hello"),
    ),
    ListTile(
      title: const Text("uni.error"),
      onTap: () => Uni.error("hello"),
    ),
    ListTile(
      title: const Text("uni.loading"),
      onTap: () => Uni.loading("loading"),
    ),
    ListTile(
      title: const Text("uni.progress"),
      onTap: () {
        double progress = 0.0;
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
          progress += 0.01;
          Uni.progress(progress);
          if (progress >= 1.0) {
            Uni.hide();
            timer.cancel();
          }
        });
      },
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast/Loading"),
      ),
      body: ListView.separated(
          itemBuilder: (c, i) => lists[i],
          separatorBuilder: (c, i) => const Divider(
                height: .2,
              ),
          itemCount: lists.length),
    );
  }
}
