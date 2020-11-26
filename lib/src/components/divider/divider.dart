import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// Divider is used to divide parts of content.
class NeDivider extends StatelessWidget {
  final Color color;
  final double width;
  const NeDivider({
    Key key,
    this.color,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return Container(
      color: color ?? style.get('divider-color'),
      height: width ?? style.get('divider-width'),
    );
  }
}
