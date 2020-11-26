import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

class NeIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final NeWidgetStatus status;

  const NeIcon(
    this.icon, {
    Key key,
    this.size,
    this.color,
    this.status,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final statusColor = style.get(generateSelector(['color', status, '500']));
    return Icon(
      icon,
      size: size ?? style.get('icon-size'),
      color: statusColor ?? color ?? style.get('icon-color'),
    );
  }
}
