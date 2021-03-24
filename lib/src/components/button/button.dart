import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/button/button_style.dart';

/// A widget that displays a Eva Design styled button. Can be deeply customized using
/// [NeButtonThemeData] or by passing `defaultButtonTheme` in `flutter_nebulaApp`'s theme.
/// Theme that is set in `flutter_nebulaApp` will be merged with the closest [NeButtonTheme] widget's theme,
/// with prevalence to the latter, and then combined with this butotn's settings.
class NeButton extends StatefulWidget {
  /// Controls the size of the widget.
  final NeWidgetSize size;

  /// Controls the status - and color of the widget.
  final NeWidgetStatus? status;

  /// Controls the appearance of the button. It can be either filled, outlined, or ghost. Will overwrite the value set by the theme.
  final NeWidgetAppearance appearance;

  /// Controls the BorderRadius of the button. Will overwrite the value set by the theme.
  final NeWidgetShape shape;

  /// Method that is called when user presses the button. Button will become disabled if `null` is passed;
  final VoidCallback onTap;

  /// Text to display inside of the button. Can be styled using [NeButtonThemeData].
  final Widget label;

  /// A leading widget. Will be placed on the left.
  final Widget? leading;

  /// A trailing widget. Will be placed on the right.
  final Widget? trailing;

  /// Width of the separator between [label] and [leading], [trailing].
  final double separatorWidth;

  /// Padding to use inside the button.
  final EdgeInsets? padding;

  /// Alignment of items in the button.
  final MainAxisAlignment itemAlignment;

  /// Color to use for the background.
  final Color? backgroundColor;

  /// Color to use for the border.
  final Color? borderColor;

  /// Color to use for the foreground.
  final Color? foregroundColor;

  /// Whether this button should fill the entire allowed width.
  final bool fluid;

  const NeButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.size = NeWidgetSize.medium,
    this.status,
    this.appearance = NeWidgetAppearance.filled,
    this.shape = NeWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.center,
    this.padding,
    this.fluid = false,
  }) : super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.filled`.
  const NeButton.filled({
    Key? key,
    required this.label,
    required this.onTap,
    this.size = NeWidgetSize.medium,
    this.status,
    this.shape = NeWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.center,
    this.padding,
    this.fluid = false,
  })  : this.appearance = NeWidgetAppearance.filled,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.outline`.
  const NeButton.outline({
    Key? key,
    required this.label,
    required this.onTap,
    this.size = NeWidgetSize.medium,
    this.status,
    this.shape = NeWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.center,
    this.padding,
    this.fluid = false,
  })  : this.appearance = NeWidgetAppearance.outline,
        super(key: key);

  /// Automatically sets the [appearance] to be `WidgetAppearance.ghost`.
  const NeButton.ghost({
    Key? key,
    required this.label,
    required this.onTap,
    this.size = NeWidgetSize.medium,
    this.status,
    this.shape = NeWidgetShape.rectangle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.separatorWidth = 16.0,
    this.itemAlignment = MainAxisAlignment.center,
    this.padding,
    this.fluid = false,
  })  : this.appearance = NeWidgetAppearance.ghost,
        super(key: key);

  @override
  _NeButtonState createState() => _NeButtonState();
}

class _NeButtonState extends State<NeButton> {
  bool outlined = false;

  Widget _buildBody(BuildContext context) {
    var list = <Widget>[];

    final style = StaticStyle.of(context);
    final disabled = widget.onTap == null;
    final active = outlined;

    final selectorStateBase = [
      'button',
      widget.appearance,
      widget.status,
      (disabled)
          ? 'disabled'
          : (active)
              ? 'active'
              : null,
    ];

    list = [
      if (widget.leading != null) ...[
        widget.leading!,
        SizedBox(width: widget.separatorWidth),
      ],
      widget.label,
      if (widget.trailing != null) ...[
        SizedBox(width: widget.separatorWidth),
        widget.trailing!,
      ],
    ];

    return StaticStyle(
      inheritFromParent: false,
      data: style.style.fork()
        ..inject(
          StyleData(
            {
              'icon-color': widget.foregroundColor ??
                  style.get(
                    generateSelector([...selectorStateBase, 'text-color']),
                  ),
              'icon-size': style.get(
                generateSelector(['button-text', widget.size, 'font-size']),
              ),
            },
          ),
        ),
      child: AnimatedDefaultTextStyle(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        style: TextStyle(
          fontSize: style.get(generateSelector(['button-text', widget.size, 'font-size'])),
          fontWeight: style.get('button-text-font-weight'),
          fontFamily: style.get('button-text-font-family'),
          color: widget.foregroundColor ?? style.get(generateSelector([...selectorStateBase, 'text-color'])),
        ),
        child: Row(
          mainAxisSize: (widget.fluid) ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: widget.itemAlignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final disabled = widget.onTap == null;
    final active = outlined;

    final selectorBase = ['button', widget.appearance];
    final selectorSizeBase = ['button', widget.appearance, widget.size];
    final selectorStateBase = [
      'button',
      widget.appearance,
      widget.status,
      (disabled)
          ? 'disabled'
          : (active)
              ? 'active'
              : null,
    ];

    final selectorBackgroundColor = style.get(generateSelector([...selectorStateBase, 'background-color']));
    return AnimatedContainer(
      duration: style.get('minor-animation-duration'),
      curve: style.get('minor-animation-curve'),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? selectorBackgroundColor,
        borderRadius: BorderRadius.all(NeWidgetShapeUtils.getRadius(
          style: style.style,
          shape: widget.shape,
        )),
        border: Border.all(
          width: style.get(
            generateSelector([...selectorBase, 'border-width']),
          ),
          color: widget.borderColor ??
              style.get(
                generateSelector([...selectorStateBase, 'border-color']),
              ),
        ),
      ),
      child: OutlinedGestureDetector(
        onTap: widget.onTap,
        onOutlineChange: (v) => setState(() => outlined = v),
        child: Padding(
          padding: widget.padding ??
              style.get(
                generateSelector([...selectorSizeBase, 'padding']),
              ),
          child: _buildBody(context),
        ),
      ),
    );
  }
}
