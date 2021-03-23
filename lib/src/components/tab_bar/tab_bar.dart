import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// NeTabBar is generally put inside [NeAppBar.bottom] or [NeLayout.bottomTabBar]. It can be used to display various
/// paths or pages. Use [NeTabBar.bottom()] if you want to make it a BottomTabBar, and [NeTabBar.top()] otherwise.
///
/// [tabs] must not be null.
class NeTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Index of a tab that is selected by default.
  final int defaultSelected;

  /// This method is called when a tab is selected. Can be `null` to make all tabs disabled.
  final Function(int) onSelect;

  /// List of all tabs. See [NeTabData] for more;
  final List<NeTabData> tabs;

  /// Whether this is a top tabbar or bottom tab bar.
  final NeVerticalPositioning position;

  const NeTabBar({
    Key key,
    this.defaultSelected,
    required this.onSelect,
    required this.tabs,
    this.position = NeVerticalPositioning.top,
  }) : super(key: key);

  const NeTabBar.top({
    Key key,
    this.defaultSelected,
    required this.onSelect,
    required this.tabs,
  })   : this.position = NeVerticalPositioning.top,
        super(key: key);

  const NeTabBar.bottom({
    Key key,
    this.defaultSelected,
    required this.onSelect,
    required this.tabs,
  })   : this.position = NeVerticalPositioning.bottom,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeTabs(
      onSelect: onSelect,
      tabs: tabs,
      defaultSelected: defaultSelected,
      showPagerIndicator: position == NeVerticalPositioning.top ? true : null,
      pagerIndicatorPosition:
          this.position == NeVerticalPositioning.top ? NeVerticalPositioning.bottom : NeVerticalPositioning.top,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
