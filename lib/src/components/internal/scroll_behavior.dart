import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NebulaScrollBehavior implements ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  TargetPlatform getPlatform(BuildContext context) {
    return defaultTargetPlatform;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }

  @override
  bool shouldNotify(ScrollBehavior oldDelegate) {
    return false;
  }

  @override
  GestureVelocityTrackerBuilder velocityTrackerBuilder(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return (PointerEvent event) => IOSScrollViewFlingVelocityTracker(event.kind);
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return (PointerEvent event) => VelocityTracker.withKind(event.kind);
    }
    assert(false);
    return (PointerEvent event) => VelocityTracker(event.kind);
  }

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return buildViewportChrome(context, child, details.direction);
  }

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    // TODO: implement buildScrollbar
    return buildScrollbar(context, child, details);
  }

  @override
  ScrollBehavior copyWith(
      {bool scrollbars = true, bool overscroll = true, ScrollPhysics? physics, TargetPlatform? platform}) {
    // TODO: implement copyWith
    // throw UnimplementedError();
    return copyWith(scrollbars: scrollbars, overscroll: overscroll, physics: physics, platform: platform);
  }
}
