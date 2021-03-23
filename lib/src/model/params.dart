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
  static Radius getRadius({required StyleData style, NeWidgetShape? shape}) {
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
