import 'package:flutter/widgets.dart';
import 'package:flutter_css_style/flutter_css_style.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

class AppState {
  static StyleData theme = NeThemes.defaultLightTheme;
  static bool isDark = false;
  static late VoidCallback _subscriber;

  static toggleTheme() {
    if (!AppState.isDark) {
      AppState.theme = NeThemes.defaultDarkTheme;
    } else {
      AppState.theme = NeThemes.defaultLightTheme;
    }
    AppState.isDark = !AppState.isDark;
    _subscriber();
  }

  static subscribe(VoidCallback method) {
    _subscriber = method;
  }
}
