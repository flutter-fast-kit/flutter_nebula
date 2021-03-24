import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/toggle/toggle_style.dart';

/// Toggle represents a bool value. [value] cannot be null, unlike [NeCheckbox].
class NeToggle extends StatefulWidget {
  /// The value of toggle. Cannot be null.
  final bool value;

  /// Status of the widget. Controls the color of the toggle.
  final NeWidgetStatus? status;

  /// A description to put either on left or on the right of checkbox, controlled by [descriptionPosition].
  final String? description;

  /// Controls the location of description.
  final NePositioning descriptionPosition;

  /// If it is true, Display icon when toggle is selected.
  final bool showIcon;

  /// A method to call when user presses the toggle. Passes the inverse of [value].
  /// If it is null, then toggle is disabled.
  final void Function(bool) onChanged;

  /// Amount of padding.
  final EdgeInsets? padding;

  const NeToggle({
    Key? key,
    required this.value,
    required this.onChanged,
    this.status,
    this.description,
    this.showIcon = false,
    this.descriptionPosition = NePositioning.left,
    this.padding,
  }) : super(key: key);

  @override
  _NeToggleState createState() => _NeToggleState();
}

class _NeToggleState extends State<NeToggle> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  bool outlined = false;

  didChangeDependencies() {
    super.didChangeDependencies();
    final style = StaticStyle.of(context);
    final animationDuration = style.get('minor-animation-duration');

    if (animationController != null) {
      animationController.duration = animationDuration;
    } else {
      animationController = AnimationController(vsync: this, duration: animationDuration);
    }
    animation = CurvedAnimation(parent: animationController, curve: style.get('minor-animation-curve'));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(NeToggle oldWidget) {
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  _onTap() {
    if (widget.value == null)
      widget.onChanged(true);
    else
      widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final selected = widget.value;
    final enabled = (widget.onChanged != null);
    final focused = outlined;

    final selectorBasis = [
      'toggle',
      (enabled) ? widget.status : 'disabled',
      (enabled && focused) ? 'focus' : null,
      (selected && !focused && enabled) ? 'checked' : null,
    ];

    final size = Size(style.get('toggle-width'), style.get('toggle-height'));

    final toggle = OutlinedWidget(
      outlined: outlined,
      predefinedSize: size,
      borderRadius: BorderRadius.circular(size.longestSide / 2.0),
      child: AnimatedContainer(
        duration: style.get('minor-animation-duration'),
        curve: style.get('minor-animation-curve'),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.longestSide / 2.0),
          color: style.get(generateSelector([...selectorBasis, 'background-color'])),
          border: Border.all(
            color: style.get(generateSelector([...selectorBasis, 'border-color'])),
            width: style.get('toggle-border-width'),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          alignment: Alignment.centerLeft,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, _) => Transform.translate(
              offset: Offset((size.width - size.height - 2.0) * animation.value, 0.0),
              child: Container(
                  width: size.height - 4.0,
                  height: size.height - 4.0,
                  decoration: BoxDecoration(
                    color: style.get(generateSelector([...selectorBasis, 'knob-color'])),
                    shape: BoxShape.circle,
                  ),
                  child: widget.showIcon
                      ? AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: selected ? 1 : 0,
                          child: NeIcon(
                            EvaIcons.checkmarkOutline,
                            color: style.get(generateSelector([...selectorBasis, 'background-color'])),
                          ),
                        )
                      : null),
            ),
          ),
        ),
      ),
    );
    final description = (widget.description != null)
        ? NeText.subtitle2(
            widget.description!,
            style: TextStyle(
              fontFamily: style.get('toggle-text-font-family'),
              fontSize: style.get('toggle-text-font-size'),
              fontWeight: style.get('toggle-text-font-weight'),
              color: (enabled) ? style.get('toggle-text-color') : style.get('toggle-disabled-text-color'),
            ),
          )
        : null;

    return OutlinedGestureDetector(
      onTap: (widget.onChanged != null) ? _onTap : null,
      onOutlineChange: (v) => setState(() => outlined = v),
      child: Padding(
        padding: widget.padding ?? style.get('toggle-padding'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: NeToggleableDesciptionUtils.buildListWithDescription(
            main: toggle,
            description: description,
            descriptionPosition: widget.descriptionPosition ?? style.get('toggle-description-position'),
            padding: style.get('toggle-description-padding'),
          )!,
        ),
      ),
    );
  }
}
