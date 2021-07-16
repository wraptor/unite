library unite;

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:unite/src/bottom_sheet.dart';
import 'package:unite/src/bottom_sheet_item.dart';
import 'package:unite/src/shared_preferences.dart';
import 'package:unite/src/theme.dart';
import 'src/flutter_easyloading.dart';
export 'src/throttle.dart';
export 'src/debounce.dart';
export 'src/bottom_sheet_item.dart';

class Uni {
  Uni._internal();

  static late BuildContext ctx;

  static bool get isDarkMode => Theme.isDarkMode(ctx);

  static double get width => Theme.width(ctx);

  static double get height => Theme.height(ctx);

  static Future<bool> init() {
    return SharedPreferences.init();
  }

  static TransitionBuilder builder({
    TransitionBuilder? builder,
  }) {
    return FlutterEasyLoading.builder(builder: builder);
  }

  Uni.bottomSheet({Widget? widget, List<SheetItem>? items, onTap}) {
    if (items != null) {
      BottomSheet.show(ctx, items, onTap);
    } else if (widget != null) {
      BottomSheet.custom(ctx, widget);
    }
  }

  Uni.toast(String msg) {
    FlutterEasyLoading.toast(msg);
  }

  Uni.info(String msg) {
    FlutterEasyLoading.info(msg);
  }

  Uni.error(String msg) {
    FlutterEasyLoading.error(msg);
  }

  Uni.success(String msg) {
    FlutterEasyLoading.success(msg);
  }

  Uni.loading(String msg) {
    FlutterEasyLoading.loading(msg);
  }

  Uni.progress(double value, [String? msg]) {
    FlutterEasyLoading.progress(value, msg);
  }

  Uni.hide([bool animation = true]) {
    FlutterEasyLoading.hide(animation);
  }

  static Future<bool> set(String key, dynamic value) {
    return SharedPreferences.set(key, value);
  }

  static dynamic get(String key) {
    return SharedPreferences.get(key);
  }

  static Future<File> downloadFile(String url, {String? progressMsg}) async {
    Dio simple = Dio();
    Uni.progress(0, progressMsg);
    String savePath = Directory.systemTemp.path + '/' + url.split('/').last;
    await simple.download(url, savePath,
        onReceiveProgress: (int count, int total) {
      if (total > 0) {
        Uni.progress(count / total, progressMsg);
      }
    }, options: Options(responseType: ResponseType.bytes));
    if (progressMsg == null) {
      Uni.hide();
    }
    return Future.value(File(savePath));
  }
}
