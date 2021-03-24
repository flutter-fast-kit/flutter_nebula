import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_nebula/src/components/android_toast/styled_toast_enum.dart';
import 'package:flutter_nebula/src/components/android_toast/styled_toast_manage.dart';
import 'package:flutter_nebula/src/components/android_toast/styled_toast_theme.dart';

import 'custom_size_transition.dart';

///Current context of the page which uses the toast
late BuildContext currentContext;

///Default toast duration
const _defaultDuration = Duration(
  milliseconds: 2300,
);

///Default animation duration
///When you use Curves.elasticOut, you can specify a longer duration to achieve beautiful effect
///But [animDuration] * 2  <= toast [duration], conditions must be met for toast to display properly
///so when you specify a longer animation duration, you must also specify toast duration to satisfy conditions above
const animationDuration = Duration(milliseconds: 400);

///The default horizontal margin of toast
const double _defaultHorizontalMargin = 50.0;

/// Show normal toast with style and animation
/// Can be used without wrapping you app with StyledToast, but must specify context;
/// When you wrap your app with StyledToast, [context] is optional;
ToastFuture showToast(
  String? msg, {
  BuildContext? context,
  Duration? duration,
  Duration? animDuration,
  AndroidToastPosition? position,
  TextStyle? textStyle,
  EdgeInsetsGeometry? textPadding,
  double? toastHorizontalMargin = _defaultHorizontalMargin,
  Color? backgroundColor,
  BorderRadius? borderRadius,
  ShapeBorder? shapeBorder,
  VoidCallback? onDismiss,
  TextDirection? textDirection,
  bool? dismissOtherToast,
  bool? movingOnWindowChange,
  AndroidToastAnimation? animation,
  AndroidToastAnimation? reverseAnimation,
  Alignment? alignment,
  Axis? axis,
  Offset? startOffset,
  Offset? endOffset,
  Offset? reverseStartOffset,
  Offset? reverseEndOffset,
  TextAlign? textAlign,
  Curve? curve,
  Curve? reverseCurve,
  bool? fullWidth,
}) {
  context = context != null ? context : currentContext;
  assert(context != null);

  AndroidToastTheme? _toastTheme = AndroidToastTheme.of(context);

  position ??= _toastTheme?.toastPositions ?? AndroidToastPosition.bottom;

  textStyle ??= _toastTheme?.textStyle ?? TextStyle(fontSize: 16.0, color: Colors.white);

  textPadding ??= _toastTheme?.textPadding ?? EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0);
  backgroundColor ??= _toastTheme?.backgroundColor ?? Colors.black87;
  borderRadius ??= _toastTheme?.borderRadius ?? BorderRadius.circular(5.0);

  shapeBorder ??= _toastTheme?.shapeBorder ??
      RoundedRectangleBorder(
        borderRadius: borderRadius,
      );

  textDirection ??= _toastTheme?.textDirection ?? TextDirection.ltr;

  textAlign ??= _toastTheme?.textAlign ?? TextAlign.center;

  fullWidth ??= _toastTheme?.fullWidth ?? false;

  Widget widget = Container(
    margin: EdgeInsets.symmetric(horizontal: toastHorizontalMargin ?? 50.0),
    width: fullWidth ? MediaQuery.of(context).size.width - (toastHorizontalMargin ?? 50.0) : null,
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: shapeBorder,
    ),
    padding: textPadding,
    child: Text(
      msg ?? '',
      style: textStyle,
      textAlign: textAlign,
    ),
  );

  return showToastWidget(
    widget,
    context: context,
    duration: duration,
    animDuration: animDuration,
    onDismiss: onDismiss,
    position: position,
    dismissOtherToast: dismissOtherToast,
    movingOnWindowChange: movingOnWindowChange,
    textDirection: textDirection,
    alignment: alignment,
    axis: axis,
    startOffset: startOffset,
    endOffset: endOffset,
    reverseStartOffset: reverseStartOffset,
    reverseEndOffset: reverseEndOffset,
    curve: curve,
    reverseCurve: reverseCurve,
    animation: animation,
    reverseAnimation: reverseAnimation,
  );
}

/// Show custom content widget toast
ToastFuture showToastWidget(
  Widget widget, {
  BuildContext? context,
  Duration? duration,
  Duration? animDuration,
  VoidCallback? onDismiss,
  bool? dismissOtherToast,
  bool? movingOnWindowChange,
  TextDirection? textDirection,
  Alignment? alignment,
  Axis? axis,
  Offset? startOffset,
  Offset? endOffset,
  Offset? reverseStartOffset,
  Offset? reverseEndOffset,
  AndroidToastPosition? position,
  AndroidToastAnimation? animation,
  AndroidToastAnimation? reverseAnimation,
  Curve? curve,
  Curve? reverseCurve,
}) {
  OverlayEntry entry;
  ToastFuture future;

  context = context != null ? context : currentContext;
  assert(context != null);
  AndroidToastTheme? _toastTheme = AndroidToastTheme.of(context);
  duration ??= _toastTheme?.duration ?? _defaultDuration;
  animDuration ??= _toastTheme?.animDuration ?? animationDuration;

  dismissOtherToast ??= _toastTheme?.dismissOtherOnShow ?? true;

  movingOnWindowChange ??= _toastTheme?.movingOnWindowChange ?? true;

  textDirection ??= textDirection ?? _toastTheme?.textDirection ?? TextDirection.ltr;

  position ??= _toastTheme?.toastPositions ?? AndroidToastPosition.bottom;

  alignment ??= _toastTheme?.alignment ?? Alignment.center;

  axis ??= _toastTheme?.axis ?? Axis.vertical;

  startOffset ??= _toastTheme?.startOffset;
  endOffset ??= _toastTheme?.endOffset;
  reverseStartOffset ??= _toastTheme?.reverseStartOffset;
  reverseEndOffset ??= _toastTheme?.reverseEndOffset;

  curve ??= curve ?? _toastTheme?.curve ?? Curves.linear;

  reverseCurve ??= reverseCurve ?? _toastTheme?.reverseCurve ?? Curves.linear;
  animation ??= animation ?? _toastTheme?.toastAnimation ?? AndroidToastAnimation.fade;
  reverseAnimation ??= reverseAnimation ?? _toastTheme?.reverseAnimation;

  onDismiss ??= onDismiss ?? _toastTheme?.onDismiss;

  GlobalKey<StyledToastWidgetState> key = GlobalKey();

  entry = OverlayEntry(builder: (ctx) {
    return IgnorePointer(
      child: _StyledToastWidget(
        duration: duration!,
        animDuration: animDuration!,
        position: position!,
        movingOnWindowChange: movingOnWindowChange,
        animation: animation!,
        reverseAnimation: reverseAnimation,
        alignment: alignment,
        axis: axis!,
        startOffset: startOffset,
        endOffset: endOffset,
        reverseStartOffset: reverseStartOffset,
        reverseEndOffset: reverseEndOffset,
        curve: curve!,
        reverseCurve: reverseCurve!,
        key: key,
        child: Directionality(
          textDirection: textDirection!,
          child: Material(
            child: widget,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  });

  // dismissOtherToast ??= _toastTheme?.dismissOtherOnShow ?? false;

  if (dismissOtherToast == true) {
    ToastManager().dismissAll();
  }

  future = ToastFuture.create(duration, entry, onDismiss, key);

  Overlay.of(context)?.insert(entry);
  ToastManager().addFuture(future);

  return future;
}

///
///created time: 2019-06-18 10:47
///author linzhiliang
///version 1.0
///since
///file name: styled_toast.dart
///description: Toast wrapper widget
///
class StyledToast extends StatefulWidget {
  ///Child of toast scope
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

  ///Toast animation
  final AndroidToastAnimation? toastAnimation;

  ///Toast reverse animation
  final AndroidToastAnimation? reverseAnimation;

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

  ///Animation curve
  final Curve? curve;

  ///Animation reverse curve
  final Curve? reverseCurve;

  ///callback when toast dismissed
  final VoidCallback? onDismiss;

  ///Dismiss old toast when new one shows
  final bool dismissOtherOnShow;

  ///When window change, moving toast.
  final bool movingOnWindowChange;

  ///The locale of you app
  final Locale locale;

  ///Full width that the width of the screen minus the width of the margin.
  final bool? fullWidth;

  StyledToast({
    Key? key,
    required this.child,
    required this.locale,
    this.textAlign,
    this.textDirection,
    this.borderRadius,
    this.backgroundColor,
    this.textPadding,
    this.textStyle = const TextStyle(fontSize: 16.0, color: Colors.white),
    this.shapeBorder,
    this.duration,
    this.animDuration,
    this.toastPositions,
    this.toastAnimation,
    this.reverseAnimation,
    this.alignment,
    this.axis,
    this.startOffset,
    this.endOffset,
    this.reverseStartOffset,
    this.reverseEndOffset,
    this.curve,
    this.reverseCurve,
    this.dismissOtherOnShow = true,
    this.movingOnWindowChange = true,
    this.onDismiss,
    this.fullWidth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StyledToastState();
  }
}

class _StyledToastState extends State<StyledToast> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget overlay = Overlay(
      initialEntries: <OverlayEntry>[
        OverlayEntry(builder: (ctx) {
          currentContext = ctx;
          return widget.child;
        })
      ],
    );

    TextDirection direction = widget.textDirection ?? TextDirection.ltr;

    Widget wrapper = Directionality(
        textDirection: direction,
        child: Stack(
          children: <Widget>[
            overlay,
          ],
        ));

    TextStyle textStyle = widget.textStyle ??
        TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        );

    Color backgroundColor = widget.backgroundColor ?? Colors.black87;

    BorderRadius borderRadius = widget.borderRadius ?? BorderRadius.circular(5.0);

    TextAlign textAlign = widget.textAlign ?? TextAlign.center;
    EdgeInsets textPadding = widget.textPadding ??
        const EdgeInsets.symmetric(
          horizontal: 17.0,
          vertical: 8.0,
        );

    // TODO: implement build
    return MediaQuery(
      child: AndroidToastTheme(
        child: wrapper,
        textAlign: textAlign,
        textDirection: direction,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        textPadding: textPadding,
        textStyle: textStyle,
        shapeBorder: widget.shapeBorder,
        duration: widget.duration,
        animDuration: widget.animDuration,
        toastPositions: widget.toastPositions,
        toastAnimation: widget.toastAnimation,
        reverseAnimation: widget.reverseAnimation,
        alignment: widget.alignment,
        axis: widget.axis,
        startOffset: widget.startOffset,
        endOffset: widget.endOffset,
        reverseStartOffset: widget.reverseStartOffset,
        reverseEndOffset: widget.reverseEndOffset,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
        dismissOtherOnShow: widget.dismissOtherOnShow,
        movingOnWindowChange: widget.movingOnWindowChange,
        onDismiss: widget.onDismiss,
        fullWidth: widget.fullWidth,
      ),
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
    );
  }
}

///
///created time: 2019-06-18 10:44
///author linzhiliang
///version 1.0
///since
///file name: styled_toast.dart
///description: Toast widget
///
class _StyledToastWidget extends StatefulWidget {
  ///Child widget
  final Widget child;

  ///Toast duration
  final Duration duration;

  ///Toast animation duration
  final Duration animDuration;

  ///Animation curve
  final Curve curve;

  ///Animation reverse curve
  final Curve reverseCurve;

  ///Toast position
  final AndroidToastPosition position;

  ///Alignment of animation, scale, rotate animation.
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
  final AndroidToastAnimation animation;

  ///Toast reverse animation
  final AndroidToastAnimation? reverseAnimation;

  ///When window change, moving toast.
  final bool? movingOnWindowChange;

  _StyledToastWidget({
    Key? key,
    required this.child,
    required this.duration,
    required this.animDuration,
    this.curve = Curves.linear,
    this.reverseCurve = Curves.linear,
    this.position = AndroidToastPosition.bottom,
    this.alignment = Alignment.center,
    this.axis = Axis.horizontal,
    this.startOffset,
    this.endOffset,
    this.reverseStartOffset,
    this.reverseEndOffset,
    this.animation = AndroidToastAnimation.fade,
    this.reverseAnimation,
    this.movingOnWindowChange = true,
  })  : assert(animDuration * 2 <= duration),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StyledToastWidgetState();
  }
}

class StyledToastWidgetState extends State<_StyledToastWidget>
    with TickerProviderStateMixin<_StyledToastWidget>, WidgetsBindingObserver {
  ///Animation controller
  late AnimationController _animationController;

  ///Reverse animation controller
  late AnimationController _reverseAnimController;

  ///Fade animation
  late Animation<double> fadeAnim;

  ///Scale animation
  late Animation<double> scaleAnim;

  ///Size animation
  late Animation<double> sizeAnim;

  ///Slide from top animation
  late Animation<Offset> slideFromTopAnim;

  ///Slide from bottom animation
  late Animation<Offset> slideFromBottomAnim;

  ///Slide from left animation
  late Animation<Offset> slideFromLeftAnim;

  ///Slide from right animation
  late Animation<Offset> slideFromRightAnim;

  ///Fade scale animation
  late Animation<double> fadeScaleAnim;

  ///Rotate animation
  late Animation<double> rotateAnim;

  ///Fade animation reverse
  late Animation<double> fadeAnimReverse;

  ///Scale animation reverse
  late Animation<double> scaleAnimReverse;

  ///Size animation reverse
  late Animation<double> sizeAnimReverse;

  ///Slide from top animation reverse
  late Animation<Offset> slideToTopAnimReverse;

  ///Slide from bottom animation reverse
  late Animation<Offset> slideToBottomAnimReverse;

  ///Slide from left animation reverse
  late Animation<Offset> slideToLeftAnimReverse;

  ///Slide from right animation reverse
  late Animation<Offset> slideToRightAnimReverse;

  ///Fade scale animation reverse
  late Animation<double> fadeScaleAnimReverse;

  ///Rotate animation reverse
  late Animation<double> rotateAnimReverse;

  double opacity = 1.0;

  bool? get movingOnWindowChange => widget.movingOnWindowChange;

  double get offset => widget.position.offset;

  AlignmentGeometry? get positionAlignment => widget.position.align;

  /// A [Timer] needed to dismiss the toast with animation
  /// after the given [duration] of time.
  late Timer _toastTimer;

  @override
  void initState() {
    super.initState();

    _initAnim();

    _animationController.forward();

    //Dismiss toast
    _toastTimer = Timer(widget.duration - widget.animDuration, () async {
      dismissToastAnim();
    });

    WidgetsBinding.instance?.addObserver(this);
  }

  ///Init animation
  void _initAnim() {
    _animationController = AnimationController(vsync: this, duration: widget.animDuration);

    switch (widget.animation) {
      case AndroidToastAnimation.fade:
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.slideFromTop:
        slideFromTopAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(0.0, -1.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        break;
      case AndroidToastAnimation.slideFromTopFade:
        slideFromTopAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(0.0, -1.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.slideFromBottom:
        slideFromBottomAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(0.0, 1.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        break;
      case AndroidToastAnimation.slideFromBottomFade:
        slideFromBottomAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(0.0, 1.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.slideFromLeft:
        slideFromLeftAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(-1.0, 0.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );

        break;
      case AndroidToastAnimation.slideFromLeftFade:
        slideFromLeftAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(-1.0, 0.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.slideFromRight:
        slideFromRightAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(1.0, 0.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );

        break;
      case AndroidToastAnimation.slideFromRightFade:
        slideFromRightAnim = _animationController.drive(
          Tween<Offset>(begin: widget.startOffset ?? Offset(1.0, 0.0), end: widget.endOffset ?? Offset.zero).chain(
            CurveTween(
              curve: widget.curve,
            ),
          ),
        );
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.size:
        sizeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.sizeFade:
        sizeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );

        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.scale:
        scaleAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.fadeScale:
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        scaleAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        break;
      case AndroidToastAnimation.rotate:
        rotateAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
      case AndroidToastAnimation.scaleRotate:
        scaleAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        rotateAnim = Tween<double>(begin: 0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        break;
      case AndroidToastAnimation.fadeRotate:
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        rotateAnim = Tween<double>(begin: 0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: widget.curve),
            reverseCurve: Interval(0.0, 1.0, curve: widget.reverseCurve),
          ),
        );
        break;
      case AndroidToastAnimation.none:
        break;
      default:
        fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve, reverseCurve: widget.reverseCurve),
        );
        break;
    }

    if (widget.reverseAnimation != null && widget.animation != widget.reverseAnimation) {
      _reverseAnimController = AnimationController(vsync: this, duration: widget.animDuration);

      switch (widget.reverseAnimation) {
        case AndroidToastAnimation.fade:
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );

          break;
        case AndroidToastAnimation.slideToTop:
          slideToTopAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(0.0, -1.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );

          break;
        case AndroidToastAnimation.slideToTopFade:
          slideToTopAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(0.0, -1.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.slideToBottom:
          slideToBottomAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(0.0, 1.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );

          break;
        case AndroidToastAnimation.slideToBottomFade:
          slideToBottomAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(0.0, 1.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.slideToLeft:
          slideToLeftAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(-1.0, 0.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );

          break;
        case AndroidToastAnimation.slideToLeftFade:
          slideToLeftAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(-1.0, 0.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.slideToRight:
          slideToRightAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(1.0, 0.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );

          break;
        case AndroidToastAnimation.slideToRightFade:
          slideToRightAnimReverse = _reverseAnimController.drive(
            Tween<Offset>(
                    begin: widget.reverseStartOffset ?? Offset.zero, end: widget.reverseEndOffset ?? Offset(1.0, 0.0))
                .chain(
              CurveTween(
                curve: widget.reverseCurve,
              ),
            ),
          );
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.size:
          sizeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
                parent: _reverseAnimController, curve: widget.reverseCurve, reverseCurve: widget.reverseCurve),
          );
          break;
        case AndroidToastAnimation.sizeFade:
          sizeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
                parent: _reverseAnimController, curve: widget.reverseCurve, reverseCurve: widget.reverseCurve),
          );

          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
                parent: _reverseAnimController, curve: widget.reverseCurve, reverseCurve: widget.reverseCurve),
          );
          break;
        case AndroidToastAnimation.scale:
          scaleAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.fadeScale:
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          scaleAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          break;
        case AndroidToastAnimation.rotate:
          rotateAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
        case AndroidToastAnimation.scaleRotate:
          scaleAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          rotateAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          break;
        case AndroidToastAnimation.fadeRotate:
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          rotateAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: Interval(0.0, 1.0, curve: widget.reverseCurve),
            ),
          );
          break;
        case AndroidToastAnimation.none:
          break;
        default:
          fadeAnimReverse = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _reverseAnimController,
              curve: widget.reverseCurve,
            ),
          );
          break;
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    w = createAnimWidget(widget.child);

    w = Opacity(
      opacity: opacity,
      child: w,
    );

    if (movingOnWindowChange != true) {
      var mediaQueryData = MediaQueryData.fromWindow(ui.window);

      Widget container = Container(
        padding: EdgeInsets.only(bottom: mediaQueryData.padding.bottom, top: mediaQueryData.padding.top),
        alignment: positionAlignment,
        child: w,
      );

      if (Alignment.center == positionAlignment) {
      } else if (Alignment.bottomCenter == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(bottom: offset),
          child: container,
        );
      } else if (Alignment.topCenter == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(top: offset),
          child: container,
        );
      } else if (Alignment.topLeft == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(top: offset),
          child: container,
        );
      } else if (Alignment.topRight == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(top: offset),
          child: container,
        );
      } else if (Alignment.centerLeft == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(left: offset),
          child: container,
        );
      } else if (Alignment.centerRight == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(right: offset),
          child: container,
        );
      } else if (Alignment.bottomLeft == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(bottom: offset),
          child: container,
        );
      } else if (Alignment.bottomRight == positionAlignment) {
        container = Padding(
          padding: EdgeInsets.only(bottom: offset),
          child: container,
        );
      } else {
        container = Padding(
          padding: EdgeInsets.all(offset),
          child: container,
        );
      }

      return container;
    }

    var mediaQueryData = MediaQueryData.fromWindow(ui.window);
    Widget container = Container(
      padding: EdgeInsets.only(bottom: mediaQueryData.padding.bottom, top: mediaQueryData.padding.top),
      alignment: positionAlignment,
      child: w,
    );

    if (Alignment.center == positionAlignment) {
    } else if (Alignment.bottomCenter == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(bottom: offset),
        child: container,
      );
    } else if (Alignment.topCenter == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(top: offset),
        child: container,
      );
    } else if (Alignment.topLeft == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(top: offset),
        child: container,
      );
    } else if (Alignment.topRight == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(top: offset),
        child: container,
      );
    } else if (Alignment.centerLeft == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(left: offset),
        child: container,
      );
    } else if (Alignment.centerRight == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(right: offset),
        child: container,
      );
    } else if (Alignment.bottomLeft == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(bottom: offset),
        child: container,
      );
    } else if (Alignment.bottomRight == positionAlignment) {
      container = Padding(
        padding: EdgeInsets.only(bottom: offset),
        child: container,
      );
    } else {}

    return container;
  }

  ///Create animation widget
  Widget createAnimWidget(Widget w) {
    switch (widget.animation) {
      case AndroidToastAnimation.fade:
        w = FadeTransition(
          opacity: fadeAnim,
          child: w,
        );
        break;
      case AndroidToastAnimation.slideFromTop:
        w = SlideTransition(
          position: slideFromTopAnim,
          child: w,
        );
        break;
      case AndroidToastAnimation.slideFromTopFade:
        w = SlideTransition(
          position: slideFromTopAnim,
          child: FadeTransition(
            opacity: fadeAnim,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.slideFromBottom:
        w = SlideTransition(
          position: slideFromBottomAnim,
          child: w,
        );
        break;
      case AndroidToastAnimation.slideFromBottomFade:
        w = SlideTransition(
          position: slideFromBottomAnim,
          child: FadeTransition(
            opacity: fadeAnim,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.slideFromLeft:
        w = SlideTransition(
          position: slideFromLeftAnim,
          child: w,
        );
        break;
      case AndroidToastAnimation.slideFromLeftFade:
        w = SlideTransition(
          position: slideFromLeftAnim,
          child: FadeTransition(
            opacity: fadeAnim,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.slideFromRight:
        w = SlideTransition(
          position: slideFromRightAnim,
          child: w,
        );
        break;
      case AndroidToastAnimation.slideFromRightFade:
        w = SlideTransition(
          position: slideFromRightAnim,
          child: FadeTransition(
            opacity: fadeAnim,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.size:
        w = CustomSizeTransition(
          sizeFactor: sizeAnim,
          alignment: positionAlignment ?? Alignment.center,
          axisAlignment: 0.0,
          axis: widget.axis ?? Axis.horizontal,
          child: w,
        );
        break;
      case AndroidToastAnimation.sizeFade:
        w = CustomSizeTransition(
          sizeFactor: sizeAnim,
          axisAlignment: 0.0,
          alignment: positionAlignment ?? Alignment.center,
          axis: widget.axis ?? Axis.horizontal,
          child: FadeTransition(
            opacity: fadeAnim,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.scale:
        w = ScaleTransition(
          scale: scaleAnim,
          alignment: widget.alignment ?? Alignment.center,
          child: w,
        );
        break;
      case AndroidToastAnimation.fadeScale:
        w = FadeTransition(
          opacity: fadeAnim,
          child: ScaleTransition(
            scale: scaleAnim,
            alignment: widget.alignment ?? Alignment.center,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.rotate:
        w = RotationTransition(
          turns: rotateAnim,
          alignment: widget.alignment ?? FractionalOffset.center,
          child: w,
        );
        break;
      case AndroidToastAnimation.fadeRotate:
        w = FadeTransition(
          opacity: fadeAnim,
          child: RotationTransition(
            turns: rotateAnim,
            alignment: widget.alignment ?? FractionalOffset.center,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.scaleRotate:
        w = ScaleTransition(
          scale: scaleAnim,
          alignment: widget.alignment ?? Alignment.center,
          child: RotationTransition(
            turns: rotateAnim,
            alignment: widget.alignment ?? FractionalOffset.center,
            child: w,
          ),
        );
        break;
      case AndroidToastAnimation.none:
        w = Container(
          child: w,
        );
        break;
      default:
        w = FadeTransition(
          opacity: fadeAnim,
          child: w,
        );
        break;
    }

    if (widget.reverseAnimation != null && widget.animation != widget.reverseAnimation) {
      switch (widget.reverseAnimation) {
        case AndroidToastAnimation.fade:
          w = FadeTransition(
            opacity: fadeAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.slideToTop:
          w = SlideTransition(
            position: slideToTopAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.slideToTopFade:
          w = SlideTransition(
            position: slideToTopAnimReverse,
            child: FadeTransition(
              opacity: fadeAnimReverse,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.slideToBottom:
          w = SlideTransition(
            position: slideToBottomAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.slideToBottomFade:
          w = SlideTransition(
            position: slideToBottomAnimReverse,
            child: FadeTransition(
              opacity: fadeAnimReverse,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.slideToLeft:
          w = SlideTransition(
            position: slideToLeftAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.slideToLeftFade:
          w = SlideTransition(
            position: slideToLeftAnimReverse,
            child: FadeTransition(
              opacity: fadeAnimReverse,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.slideToRight:
          w = SlideTransition(
            position: slideToRightAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.slideToRightFade:
          w = SlideTransition(
            position: slideToRightAnimReverse,
            child: FadeTransition(
              opacity: fadeAnimReverse,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.size:
          w = CustomSizeTransition(
            alignment: positionAlignment ?? Alignment.center,
            axis: widget.axis ?? Axis.horizontal,
            sizeFactor: sizeAnimReverse,
            child: w,
          );
          break;
        case AndroidToastAnimation.sizeFade:
          w = FadeTransition(
            opacity: fadeAnimReverse,
            child: CustomSizeTransition(
              alignment: positionAlignment ?? Alignment.center,
              axis: widget.axis ?? Axis.horizontal,
              sizeFactor: sizeAnimReverse,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.scale:
          w = ScaleTransition(
            scale: scaleAnimReverse,
            alignment: widget.alignment ?? Alignment.center,
            child: w,
          );
          break;
        case AndroidToastAnimation.fadeScale:
          w = FadeTransition(
            opacity: fadeAnimReverse,
            child: ScaleTransition(
              scale: scaleAnimReverse,
              alignment: widget.alignment ?? Alignment.center,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.rotate:
          w = RotationTransition(
            turns: rotateAnimReverse,
            alignment: widget.alignment ?? FractionalOffset.center,
            child: w,
          );
          break;
        case AndroidToastAnimation.fadeRotate:
          w = FadeTransition(
            opacity: fadeAnimReverse,
            child: RotationTransition(
              turns: rotateAnimReverse,
              alignment: widget.alignment ?? FractionalOffset.center,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.scaleRotate:
          w = ScaleTransition(
            scale: scaleAnimReverse,
            child: RotationTransition(
              turns: rotateAnimReverse,
              alignment: widget.alignment ?? FractionalOffset.center,
              child: w,
            ),
          );
          break;
        case AndroidToastAnimation.none:
          break;
        default:
          break;
      }
    }

    return w;
  }

  ///Dismiss toast
  void dismissToast() {
    _toastTimer.cancel();
    setState(() {
      opacity = 0.0;
    });
  }

  ///Dismiss toast with animation
  void dismissToastAnim() async {
    if (!mounted) {
      return;
    }
    try {
      if (widget.reverseAnimation != null &&
          _reverseAnimController != null &&
          widget.animation != widget.reverseAnimation) {
        await _reverseAnimController.forward().orCancel;
      } else {
        await _animationController.reverse().orCancel;
      }
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    _toastTimer.cancel();
    WidgetsBinding.instance?.removeObserver(this);
    if (_animationController != null) {
      _animationController.dispose();
    }
    if (widget.reverseAnimation != null && _reverseAnimController != null) {
      _reverseAnimController.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (this.mounted) setState(() {});
  }

  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeAppLifecycleState(ui.AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeLocales(List<ui.Locale>? locales) {
    super.didChangeLocales(locales);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }

  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
  }

  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }
}
