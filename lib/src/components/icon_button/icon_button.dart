import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/icon_button/icon_button_style.dart';

/// This widget is used to display a button without a label.
/// Customize this using [NeIconButtonThemeData].
class NeIconButton extends StatefulWidget {
  /// Controls the size of the button
  final NeWidgetSize size;

  /// Controls the colors.
  final NeWidgetStatus? status;

  /// If provided, overwrites the color set by [status] in [WidgetAppearance.ghost] and
  /// [WidgetAppearance.outline] appearances.
  final Color? color;

  /// Controls the appearance of the widget.
  final NeWidgetAppearance appearance;

  /// Controls the border radius.
  final NeWidgetShape shape;

  /// Method is called when user taps on the button. Can be null to disable this button.
  final VoidCallback? onTap;

  /// Icon to display.
  final IconData icon;

  const NeIconButton({
    Key? key,
    required this.icon,
    this.onTap,
    this.size = NeWidgetSize.medium,
    this.status,
    this.appearance = NeWidgetAppearance.filled,
    this.shape = NeWidgetShape.round,
    this.color,
  }) : super(key: key);

  @override
  _NeIconButtonState createState() => _NeIconButtonState();
}

class _NeIconButtonState extends State<NeIconButton> {
  bool outlined = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final active = outlined;
    final disabled = widget.onTap == null;

    final selectorBase = ['icon-button', widget.appearance];
    final selectorSizeBase = ['icon-button', widget.appearance, widget.size];
    final selectorStateBase = [
      'icon-button',
      widget.appearance,
      widget.status,
      (disabled)
          ? 'disabled'
          : (active)
              ? 'active'
              : null,
    ];

    return OutlinedWidget(
      outlined: outlined,
      borderRadius: BorderRadius.all(NeWidgetShapeUtils.getRadius(
        style: style.style,
        shape: widget.shape,
      )),
      clipInner: widget.appearance != NeWidgetAppearance.ghost,
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        decoration: BoxDecoration(
          color: style.get(generateSelector([...selectorStateBase, 'background-color'])),
          borderRadius: BorderRadius.all(NeWidgetShapeUtils.getRadius(
            style: style.style,
            shape: widget.shape,
          )),
          border: Border.all(
            width: style.get(
              generateSelector([...selectorBase, 'border-width']),
            ),
            color: style.get(
              generateSelector([...selectorStateBase, 'border-color']),
            ),
          ),
        ),
        child: OutlinedGestureDetector(
          onTap: widget.onTap,
          onOutlineChange: (v) => setState(() => outlined = v),
          child: Padding(
            padding: style.get(
              generateSelector([...selectorSizeBase, 'padding']),
            ),
            child: Icon(
              widget.icon,
              size: style.get(generateSelector(['icon-button', widget.size, 'icon-size'])),
              color: style.get(generateSelector([...selectorStateBase, 'icon-color'])),
            ),
          ),
        ),
      ),
    );
  }
}
