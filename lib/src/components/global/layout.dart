import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// A widget that represents a page. Similar to [Scaffold].
class NeLayout extends StatefulWidget {
  /// A theme to use in this page. Overwrites the [flutter_nebulaApp.theme].
  final StyleData theme;

  /// Page's body. Will be placed below [appBar].
  final Widget child;

  /// A slot for [NeAppBar] or other application bars. Can be `null`.
  final PreferredSizeWidget appBar;

  /// A slot for [NeTabBar.bottom()] or other widget to place on the bottom. Can be `null`.
  final PreferredSizeWidget bottomTabBar;

  const NeLayout({
    Key key,
    this.theme,
    @required this.child,
    this.appBar,
    this.bottomTabBar,
  }) : super(key: key);
  @override
  _NeLayoutState createState() => _NeLayoutState();
}

class _NeLayoutState extends State<NeLayout> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? StaticStyle.of(context)?.style;
    return NeTheme(
      theme: theme,
      child: AnimatedContainer(
        duration: theme.get('major-animation-duration'),
        curve: theme.get('major-animation-curve'),
        color: theme.get('background-basic-color-3'),
        child: MaterialDesign.Material(
          type: MaterialDesign.MaterialType.transparency,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: (widget.appBar != null)
                    ? widget.appBar.preferredSize.height +
                        MediaQuery.of(context).padding.top
                    : 0.0,
                bottom: (widget.bottomTabBar != null)
                    ? widget.bottomTabBar.preferredSize.height
                    : 0.0,
                left: 0.0,
                right: 0.0,
                child: widget.child,
              ),
              if (widget.appBar != null) widget.appBar,
              if (widget.bottomTabBar != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomTabBar,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
