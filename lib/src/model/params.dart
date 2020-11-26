import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

enum NeWidgetSize {
  giant,
  large,
  medium,
  small,
  tiny,
}

enum NeWidgetState {
  normal,
  hover,
  active,
  focus,
  disabled,
}

enum NeWidgetStatus {
  primary,
  success,
  info,
  warning,
  danger,
}

enum NeWidgetShape {
  rectangle,
  round,
  semiRound,
}

enum NeWidgetAppearance {
  filled,
  outline,
  ghost,
}

enum NePositioning {
  left,
  right,
  none,
}

enum NeVerticalPositioning {
  top,
  bottom,
}

String enumValueToString(dynamic e) {
  String str = e.toString();
  return str.split('.').last;
}

class NeWidgetShapeUtils {
  static Radius getRadius({StyleData style, NeWidgetShape shape}) {
    final widgetShape = shape ?? style.get('widget-shape');

    switch (widgetShape) {
      case NeWidgetShape.rectangle:
        return Radius.circular(style.get('border-radius-rectangle'));
      case NeWidgetShape.round:
        return Radius.circular(1000.0); // Fix this...
      case NeWidgetShape.semiRound:
        return Radius.circular(style.get('border-radius-semi-round'));
      default:
        return Radius.circular(style.get('border-radius-rectangle'));
    }
  }
}
/*
class WidgetSizeUtils {
  static double getSizeValue({WidgetSize size}) {
    switch (size) {
      case WidgetSize.giant:
        return 56.0;
      case WidgetSize.large:
        return 48.0;
      case WidgetSize.medium:
        return 40.0;
      case WidgetSize.small:
        return 32.0;
      case WidgetSize.tiny:
        return 24.0;
      default:
        return 40.0;
    }
  }

  static EdgeInsets getPadding({WidgetSize size}) {
    switch (size) {
      case WidgetSize.giant:
        return EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0);
      case WidgetSize.large:
        return EdgeInsets.symmetric(vertical: 14.0, horizontal: 22.0);
      case WidgetSize.medium:
        return EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0);
      case WidgetSize.small:
        return EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
      case WidgetSize.tiny:
        return EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0);
      default:
        return EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
    }
  }
}}
*/
