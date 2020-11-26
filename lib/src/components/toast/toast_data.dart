import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// A set of data to display in a toast.
class NeToast {
  /// Message gets displayed as the largest element in the tab.
  final String message;

  /// Subtitle provides some additional information besides [message]. Optional.
  final String subtitle;

  /// Icon to display alongside [message]. Optional.
  final IconData icon;

  /// Status of this toast
  final NeWidgetStatus status;

  /// The shape of this toast. Uses [NeThemeData.defaultWidgetShape] as default.
  final NeWidgetShape shape;

  /// Duration of this toast. After [duration] elapses, tab will hide automatically.
  final Duration duration;

  /// Gets called when user taps the toast. Optional.
  final VoidCallback onTap;

  const NeToast({
    @required this.message,
    this.subtitle,
    this.icon,
    this.onTap,
    this.status,
    this.shape,
    this.duration = const Duration(seconds: 3),
  });
}
