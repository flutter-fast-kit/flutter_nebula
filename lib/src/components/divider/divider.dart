import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// Divider is used to divide parts of content.
class NeDivider extends StatelessWidget {
  final Color color;
  final double width;
  final Axis direction;
  const NeDivider(
      {Key key, this.color, this.width, this.direction = Axis.horizontal})
      : super(key: key);

  factory NeDivider.h({Color color, double width}) {
    return NeDivider(color: color, width: width, direction: Axis.horizontal);
  }

  factory NeDivider.v({Color color, double width}) {
    return NeDivider(color: color, width: width, direction: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    Color _color = color ?? style.get('divider-color');
    double _width = width ?? style.get('divider-width');

    if (direction == Axis.horizontal) {
      return Divider(color: _color, height: _width);
    }
    return VerticalDivider(
      color: _color,
      width: _width,
    );
  }
}
