import 'package:flutter/material.dart';

class NoSplashFactory implements InteractiveInkFeatureFactory {
  const NoSplashFactory();

  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      Offset? position,
      required color,
      TextDirection? textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return new NoSplash(controller: controller, referenceBox: referenceBox, color: color);
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
  }) : super(controller: controller, referenceBox: referenceBox, color: color) {
    assert(controller != null);
    assert(referenceBox != null);
    controller.addInkFeature(this);
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
