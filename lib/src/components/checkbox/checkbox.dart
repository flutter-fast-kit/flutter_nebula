import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/checkbox/checkbox_style.dart';

/// A widget that represents a boolean. [value] can be null. Can be deeply customized using
/// [NeCheckboxThemeData] or by passing `defaultCheckboxTheme` in `NeThemeData`.
/// Theme that is set in `flutter_nebulaApp` will be merged with the closest [NeCheckbox] widget's theme,
/// with prevalence to the latter, and then combined with this butotn's settings.
class NeCheckbox extends StatefulWidget {
  /// Current value of the widget. Can be null (tristate).
  final bool value;

  /// A description to put either on left or on the right of checkbox, controlled by [descriptionPosition].
  final String description;

  /// Status of the widget. Controls the color of the checkbox.
  final NeWidgetStatus status;

  /// Status of the widget. Controls the color of the checkbox. Gets overwritten
  /// if [NeCheckboxThemeData.borderRadius] is present.
  final NeWidgetShape shape;

  /// Controls the location of description.
  final NePositioning descriptionPosition;

  /// Padding for the radio. Defaults to `control-padding`.
  final EdgeInsets padding;

  /// A method that is called when checkbox's value is changed. Checkbox is disabled if [onChanged] is null.
  /// If [value] is null, returns `true`.
  /// Otherwise, returns the opposite of [value].
  final void Function(bool) onChanged;

  const NeCheckbox({
    Key key,
    required this.value,
    required this.onChanged,
    this.description,
    this.status,
    this.shape,
    this.descriptionPosition = NePositioning.right,
    this.padding,
  }) : super(key: key);

  @override
  _NeCheckboxState createState() => _NeCheckboxState();
}

class _NeCheckboxState extends State<NeCheckbox> {
  bool outlined = false;

  _onTap() {
    if (widget.value == null)
      widget.onChanged(true);
    else
      widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final enabled = widget.onChanged != null;
    final selected = widget.value;
    final focused = outlined;

    final List selectorBasis = [
      'checkbox',
      (enabled) ? widget.status : 'disabled',
      (enabled && focused) ? 'focus' : null,
      (selected != null && selected && !focused && enabled)
          ? 'checked'
          : (selected == null && !focused && enabled)
              ? 'indeterminate'
              : null,
    ];

    final borderRadius = NeWidgetShapeUtils.getRadius(style: style.style, shape: widget.shape);

    final checkbox = OutlinedWidget(
      outlined: outlined,
      predefinedSize: Size.square(style.get('checkbox-size')),
      borderRadius: BorderRadius.all(borderRadius),
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        width: style.get('checkbox-size'),
        height: style.get('checkbox-size'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(borderRadius),
          color: style.get(generateSelector([...selectorBasis, 'background-color'])),
          border: Border.all(
            color: style.get(generateSelector([...selectorBasis, 'border-color'])),
            width: style.get('checkbox-border-width'),
          ),
        ),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Center(
            child: (widget.value == null)
                ? Icon(
                    EvaIcons.minus,
                    color: style.get(generateSelector([...selectorBasis, 'checkmark-color'])),
                    size: 16.0,
                  )
                : (widget.value)
                    ? Icon(
                        EvaIcons.checkmark,
                        color: style.get(generateSelector([...selectorBasis, 'checkmark-color'])),
                        size: 16.0,
                      )
                    : SizedBox(),
          ),
        ),
      ),
    );

    final description = (widget.description != null)
        ? NeText.subtitle2(
            widget.description,
            style: TextStyle(
              fontFamily: style.get('checkbox-text-font-family'),
              fontSize: style.get('checkbox-text-font-size'),
              fontWeight: style.get('checkbox-text-font-weight'),
              color: (enabled) ? style.get('checkbox-text-color') : style.get('checkbox-disabled-text-color'),
            ),
          )
        : null;

    return OutlinedGestureDetector(
      onTap: (widget.onChanged != null) ? _onTap : null,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Padding(
        padding: widget.padding ?? style.get('checkbox-padding'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: NeToggleableDesciptionUtils.buildListWithDescription(
            main: checkbox,
            description: description,
            descriptionPosition: widget.descriptionPosition ?? style.get('checkbox-description-position'),
            padding: style.get('checkbox-description-padding'),
          ),
        ),
      ),
    );
  }
}
