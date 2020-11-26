import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/components/spinner/spinner_painter.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/spinner/spinner_style.dart';

/// Spinners are used to show user that something is downloading or in progress.
/// To customize a spinner globally, you can use [NeThemeData.defaultSpinnerTheme] and
/// [NeSpinnerThemeData].
class NeSpinner extends StatefulWidget {
  /// Status of a spinner. Controls its color.
  final NeWidgetStatus status;

  /// Size of a spinner.
  final NeWidgetSize size;

  const NeSpinner({
    Key key,
    this.status = NeWidgetStatus.primary,
    this.size = NeWidgetSize.medium,
  }) : super(key: key);
  @override
  _NeSpinnerState createState() => _NeSpinnerState();
}

class _NeSpinnerState extends State<NeSpinner>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = CurvedAnimation(
        curve: Cubic(0.275, 0.725, 0.725, 0.275), parent: animationController);

    animationController.repeat(min: 0.0, max: 1.0);
  }

  dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final size = style.get(generateSelector(['spinner', widget.size, 'size']));
    return Center(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Transform.rotate(
            angle: animation.value * pi * 2.0,
            child: CustomPaint(
              painter: SpinnerPainter(
                color: style
                    .get(generateSelector(['spinner', widget.status, 'color'])),
                strokeWidth: style.get(
                    generateSelector(['spinner', widget.size, 'stroke-width'])),
              ),
              isComplex: false,
              willChange: false,
              child: SizedBox(width: size, height: size),
            ),
          );
        },
      ),
    );
  }
}
