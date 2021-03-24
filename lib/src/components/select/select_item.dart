import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// Represents an item in Select list.
class NeSelectItem<T> {
  /// Icon to display alongisde the title and subtitle.
  final IconData? icon;

  /// Main information.
  final String title;

  /// Additional information.
  final String? subtitle;

  /// Underlying value that this item holds.
  final T value;

  NeSelectItem({
    required this.title,
    required this.value,
    this.icon,
    this.subtitle,
  });

  double caluclateHeight(StaticStyleState style) {
    double titleHeight = (title != null) ? style.get('list-item-title-font-size') : 0.0;
    double subtitleHeight = (subtitle != null) ? style.get('list-item-subtitle-font-size') : 0.0;

    return 36.0 + titleHeight + subtitleHeight;
  }
}
