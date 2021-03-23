import 'package:flutter/material.dart';

class NeSpace extends StatelessWidget {
  const NeSpace({
    Key? key,
    this.direction = Axis.horizontal,
    this.size = 0.0,
  }) : super(key: key);

  final Axis direction;
  final double size;

  /// 水平间隔
  static const NeSpace h1 = NeSpace(direction: Axis.horizontal, size: 1);
  static const NeSpace h3 = NeSpace(direction: Axis.horizontal, size: 3);
  static const NeSpace h4 = NeSpace(direction: Axis.horizontal, size: 4);
  static const NeSpace h5 = NeSpace(direction: Axis.horizontal, size: 5);
  static const NeSpace h8 = NeSpace(direction: Axis.horizontal, size: 8);
  static const NeSpace h10 = NeSpace(direction: Axis.horizontal, size: 10);
  static const NeSpace h12 = NeSpace(direction: Axis.horizontal, size: 12);
  static const NeSpace h15 = NeSpace(direction: Axis.horizontal, size: 15);
  static const NeSpace h16 = NeSpace(direction: Axis.horizontal, size: 16);
  static const NeSpace h20 = NeSpace(direction: Axis.horizontal, size: 20);
  static const NeSpace h32 = NeSpace(direction: Axis.horizontal, size: 32);
  static const NeSpace h34 = NeSpace(direction: Axis.horizontal, size: 34);
  static const NeSpace h42 = NeSpace(direction: Axis.horizontal, size: 42);
  static const NeSpace h47 = NeSpace(direction: Axis.horizontal, size: 47);
  static const NeSpace h24 = NeSpace(direction: Axis.horizontal, size: 24);

  /// 垂直间隔
  static const NeSpace v1 = NeSpace(direction: Axis.vertical, size: 1);
  static const NeSpace v4 = NeSpace(direction: Axis.vertical, size: 4);
  static const NeSpace v5 = NeSpace(direction: Axis.vertical, size: 5);
  static const NeSpace v8 = NeSpace(direction: Axis.vertical, size: 8);
  static const NeSpace v10 = NeSpace(direction: Axis.vertical, size: 10);
  static const NeSpace v12 = NeSpace(direction: Axis.vertical, size: 12);
  static const NeSpace v13 = NeSpace(direction: Axis.vertical, size: 13);
  static const NeSpace v14 = NeSpace(direction: Axis.vertical, size: 14);
  static const NeSpace v15 = NeSpace(direction: Axis.vertical, size: 15);
  static const NeSpace v16 = NeSpace(direction: Axis.vertical, size: 16);
  static const NeSpace v24 = NeSpace(direction: Axis.vertical, size: 24);
  static const NeSpace v32 = NeSpace(direction: Axis.vertical, size: 32);
  static const NeSpace v50 = NeSpace(direction: Axis.vertical, size: 50);
  static const NeSpace v34 = NeSpace(direction: Axis.vertical, size: 34);
  static const NeSpace v42 = NeSpace(direction: Axis.vertical, size: 42);
  static const NeSpace v47 = NeSpace(direction: Axis.vertical, size: 47);

  static const NeSpace empty = NeSpace();

  factory NeSpace.v(double size, {Key? key}) {
    return NeSpace(key: key, direction: Axis.vertical, size: size);
  }

  factory NeSpace.h(double size, {Key? key}) {
    return NeSpace(key: key, direction: Axis.horizontal, size: size);
  }

  @override
  Widget build(BuildContext context) {
    if (size == 0.0) {
      return SizedBox.shrink();
    }
    if (direction == Axis.horizontal) {
      return SizedBox(width: size);
    }
    return SizedBox(height: size);
  }
}
