import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/tabs/tab_style.dart';

/// A data for tab. Either [icon] or [title] must be present.
class NeTabData {
  /// Leading widget to display alongside [title].
  final WidgetBuilder? icon;

  /// Leading widget to display alongside [title] while tab is active.
  final WidgetBuilder? activeIcon;

  /// Label to display. Can be null.
  final WidgetBuilder? title;

  /// Whether the tab is disabled or not. By default it is false.
  final bool disabled;

  NeTabData({
    this.icon,
    this.activeIcon,
    this.title,
    this.disabled = false,
  });

  factory NeTabData.fromIcon(
      {String? title, IconData? icon, IconData? activeIcon, bool disabled = false, double iconSize = 18.0}) {
    return NeTabData(
      icon: (icon != null) ? (_) => NeIcon(icon, size: iconSize) : null,
      activeIcon: (icon != null && activeIcon != null) ? (_) => NeIcon(activeIcon, size: iconSize) : null,
      title: (title != null) ? (_) => Text(title) : null,
      disabled: disabled,
    );
  }
}

/// A singular tab. [data] must not be null.
class NeTab extends StatefulWidget {
  final NeTabData data;
  final bool active;
  final VoidCallback? onTap;
  final bool? showPagerIndicator;
  final Alignment pagerIndicatorAlignment;

  const NeTab({
    Key? key,
    required this.data,
    this.active = false,
    this.onTap,
    this.showPagerIndicator = true,
    this.pagerIndicatorAlignment = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  _NeTabState createState() => _NeTabState();
}

class _NeTabState extends State<NeTab> {
  bool tapping = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);

    final disabled = widget.onTap == null;
    final active = widget.active;
    final hover = tapping;

    final foregroundColor = style.get(generateSelector([
      'tab-foreground',
      (disabled)
          ? 'disabled'
          : (active)
              ? 'active'
              : null,
      'color'
    ]));
    var containerColor = style.get(generateSelector([
      'tab-indicator',
      (disabled)
          ? 'disabled'
          : (hover)
              ? 'hover'
              : (active)
                  ? 'active'
                  : null,
      'color'
    ]));

    bool? showPagerIndicator = widget.showPagerIndicator;
    if (showPagerIndicator == null) {
      showPagerIndicator = widget.data.title == null && widget.data.icon != null;
    }

    return OutlinedGestureDetector(
      onOutlineChange: (v) => setState(() => tapping = v),
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: StaticStyle(
          inheritFromParent: false,
          data: style.style.fork()
            ..inject(StyleData({
              'icon-color': foregroundColor,
            })),
          child: AnimatedDefaultTextStyle(
            duration: style.get('minor-animation-duration'),
            curve: style.get('minor-animation-curve'),
            style: TextStyle(
              fontFamily: style.get('tab-text-font-family'),
              fontSize: style.get('tab-text-font-size'),
              fontWeight: style.get('tab-text-font-weight'),
              color: foregroundColor,
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if ((!widget.active && widget.data.icon != null) ||
                          (widget.active && widget.data.activeIcon == null))
                        widget.data.icon!(context),
                      if (widget.active && widget.data.activeIcon != null) widget.data.activeIcon!(context),
                      if (widget.data.icon != null && widget.data.title != null) SizedBox(height: 2.0),
                      if (widget.data.title != null) widget.data.title!(context),
                    ],
                  ),
                ),
                if (showPagerIndicator)
                  Align(
                    alignment: widget.pagerIndicatorAlignment,
                    child: AnimatedContainer(
                      duration: style.get('minor-animation-duration'),
                      curve: style.get('minor-animation-curve'),
                      width: double.infinity,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
