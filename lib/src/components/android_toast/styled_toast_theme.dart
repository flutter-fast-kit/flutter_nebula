import 'package:flutter/widgets.dart';
import 'package:flutter_nebula/src/components/android_toast/styled_toast_enum.dart';

class AndroidToastTheme extends InheritedWidget {
  ///Child widget
  final Widget child;

  ///Text align
  final TextAlign? textAlign;

  ///Text direction
  final TextDirection? textDirection;

  ///Border radius
  final BorderRadius? borderRadius;

  ///Background color
  final Color? backgroundColor;

  ///Padding for the text and the container edges
  final EdgeInsets? textPadding;

  ///Text style for content
  final TextStyle? textStyle;

  ///Shape for the container
  final ShapeBorder? shapeBorder;

  ///Toast show duration
  final Duration? duration;

  ///Toast animation duration
  final Duration? animDuration;

  ///Position of the toast widget in current window
  final AndroidToastPosition? toastPositions;

  ///Alignment of animation, like size, rotate animation.
  final Alignment? alignment;

  ///Axis of animation, like size animation
  final Axis? axis;

  ///Start offset of slide animation
  final Offset? startOffset;

  ///End offset of slide animation
  final Offset? endOffset;

  ///Start offset of reverse slide animation
  final Offset? reverseStartOffset;

  ///End offset of reverse slide animation
  final Offset? reverseEndOffset;

  ///Toast animation
  final AndroidToastAnimation? toastAnimation;

  ///Toast reverse animation
  final AndroidToastAnimation? reverseAnimation;

  ///Animation curve
  final Curve? curve;

  ///Animation reverse curve
  final Curve? reverseCurve;

  ///Dismiss old toast when new one shows
  final bool? dismissOtherOnShow;

  ///When window change, moving toast.
  final bool? movingOnWindowChange;

  ///Callback when toast dismissed
  final VoidCallback? onDismiss;

  ///Full width that the width of the screen minus the width of the margin.
  final bool? fullWidth;

  AndroidToastTheme({
    required this.child,
    this.textAlign,
    this.textDirection,
    this.borderRadius,
    this.backgroundColor,
    this.textPadding,
    this.textStyle,
    this.shapeBorder,
    this.duration,
    this.animDuration,
    this.toastPositions,
    this.alignment,
    this.axis,
    this.startOffset,
    this.endOffset,
    this.reverseStartOffset,
    this.reverseEndOffset,
    this.toastAnimation,
    this.reverseAnimation,
    this.curve,
    this.reverseCurve,
    this.dismissOtherOnShow,
    this.movingOnWindowChange,
    this.onDismiss,
    this.fullWidth,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static AndroidToastTheme? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AndroidToastTheme>();
}
