import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FlutterEasyLoading {
  FlutterEasyLoading._internal();

  static TransitionBuilder builder({
    TransitionBuilder? builder,
  }) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 2)
      ..backgroundColor = const Color.fromRGBO(22, 22, 22, 0.8)
      ..radius = 10.0
      ..indicatorColor = Colors.white
      ..progressColor = Colors.white
      ..textColor = Colors.white
      ..contentPadding = const EdgeInsets.fromLTRB(20, 10, 20, 10)
      ..loadingStyle = EasyLoadingStyle.custom;
    return EasyLoading.init(builder: builder);
  }

  FlutterEasyLoading.toast(String msg) {
    EasyLoading.showToast(msg);
  }

  FlutterEasyLoading.info(String msg) {
    EasyLoading.showInfo(msg);
  }

  FlutterEasyLoading.error(String msg) {
    EasyLoading.showError(msg);
  }

  FlutterEasyLoading.success(String msg) {
    EasyLoading.showSuccess(msg);
  }

  FlutterEasyLoading.loading([String? msg]) {
    EasyLoading.show(status: msg);
  }

  FlutterEasyLoading.progress(double value, [String? msg]) {
    if (value >= 1.0) {
      value = 1.0;
    }
    if (value < 0) {
      value = 0;
    }
    EasyLoading.showProgress(value, status: msg);
  }

  FlutterEasyLoading.hide([bool animation = true]) {
    EasyLoading.dismiss(animation: animation);
  }
}
