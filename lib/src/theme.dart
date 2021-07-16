import 'package:flutter/material.dart' as material;

class Theme {
  static bool isDarkMode(content) {
    return material.Theme.of(content).brightness == material.Brightness.dark;
  }

  static double width(ctx) {
    return material.MediaQuery.of(ctx).size.width;
  }

  static double height(ctx) {
    return material.MediaQuery.of(ctx).size.height;
  }
}
