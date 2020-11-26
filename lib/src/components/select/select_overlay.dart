import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

class NeSelectOverlay extends StatelessWidget {
  final NeWidgetStatus status;
  final Animation<double> animation;
  final double borderRadius;
  final List<NeSelectItem> items;
  final int selectedIndex;
  final void Function(int, NeSelectItem) onSelect;
  final bool openingFromBottom;
  final double height;

  const NeSelectOverlay({
    Key key,
    this.animation,
    this.borderRadius,
    this.items,
    this.selectedIndex,
    this.onSelect,
    this.status,
    this.openingFromBottom,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final maxBorderRadius = style.get('border-radius-semi-round');
    final borderRadiusValue = min<double>(borderRadius, maxBorderRadius);
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => Container(
        constraints: BoxConstraints(maxHeight: height),
        child: NeCard(
          borderRadius: (openingFromBottom)
              ? BorderRadius.vertical(
                  top: Radius.zero,
                  bottom: Radius.circular(borderRadiusValue),
                )
              : BorderRadius.vertical(
                  top: Radius.circular(borderRadiusValue),
                  bottom: Radius.zero,
                ),
          padding: EdgeInsets.zero,
          child: SizeTransition(
            axis: Axis.vertical,
            sizeFactor: animation,
            child: SizedBox(
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: items.map((item) {
                  int index = items.indexOf(item);
                  return NeListItem(
                    title: item.title,
                    subtitle: item.subtitle,
                    padding: EdgeInsets.all(16.0),
                    icon: item.icon,
                    onTap: () => onSelect(index, item),
                    status: status,
                    active: index == selectedIndex,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
