import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

export 'package:flutter_nebula/src/components/app_bar/app_bar_style.dart';

/// AppBar is used in [NeLayout]. It is displayed on top of a page. You can also use it in [NeLayout.bottom].
class NeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title of the page. Use [NeAppBar.withoutTitle()] if you want no title.
  final String title;

  /// Text under the title. Optional.
  final String subtitle;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// Recognizes if this page can be popped (using [Navigator.canPop()]) and adds back button
  /// if it can be popped. Overwritten by [leading].
  final bool inferLeading;

  /// A widget (usually a [NeIconButton]) in the left.
  final Widget leading;

  /// Set of actions. Usually a list of [NeIconButton].
  final List<Widget> actions;

  /// Widget to display on the bottom. Usually it is [NeTabBar].
  final PreferredSizeWidget bottom;

  /// Does this app bar have a title?
  final bool hasTitle;

  // Color to use in the background.
  final Color backgroundColor;

  // Color to use in the foreground.
  final Color foregroundColor;

  const NeAppBar({
    Key key,
    @required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.leading,
    this.actions = const [],
    this.inferLeading = true,
    this.bottom,
    this.hasTitle = true,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  const NeAppBar.withoutTitle({
    Key key,
    @required this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.title = null,
        this.subtitle = null,
        this.centerTitle = false,
        this.leading = null,
        this.actions = null,
        this.inferLeading = false,
        this.hasTitle = false;

  const NeAppBar.bottom({
    Key key,
    @required this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  })  : this.title = null,
        this.subtitle = null,
        this.centerTitle = false,
        this.leading = null,
        this.actions = null,
        this.inferLeading = false,
        this.hasTitle = false;

  Widget _buildBody(BuildContext context) {
    final style = StaticStyle.of(context);
    var leadingWidget;
    if (leading != null) {
      leadingWidget = leading;
    } else if (leading == null &&
        inferLeading &&
        Navigator.of(context).canPop()) {
      leadingWidget = new NeIconButton(
        icon: EvaIcons.arrowBack,
        size: NeWidgetSize.medium,
        appearance: NeWidgetAppearance.ghost,
        onTap: () => Navigator.pop(context),
      );
    }

    var actionsWidgets = actions ?? [];

    if ((centerTitle != null && centerTitle) ||
        (style.get('app-bar-title-center'))) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              if (leadingWidget != null) leadingWidget,
              Expanded(child: SizedBox()),
              ...actionsWidgets,
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: _AppBarTitle(
              title: title,
              subtitle: subtitle,
              centered: centerTitle,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          if (leadingWidget != null) ...[leadingWidget, SizedBox(width: 8.0)],
          _AppBarTitle(
            title: title,
            subtitle: subtitle,
            centered: centerTitle,
          ),
          SizedBox(width: 8.0),
          Expanded(child: SizedBox()),
          ...actionsWidgets,
        ],
      );
    }
  }

  double _calculateHeight() {
    double height = 0.0;
    if (hasTitle) height += 64.0;
    if (bottom != null) height += bottom.preferredSize.height;
    print('height: $height');
    return height;
  }

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    Color _backgroundColor =
        backgroundColor ?? style.get('app-bar-background-color');
    final SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
          child: StaticStyle(
            inheritFromParent: false,
            data: style.style.fork()
              ..inject(StyleData({
                'app-bar-foreground-color':
                    foregroundColor ?? style.get('app-bar-foreground-color'),
                'icon-color':
                    foregroundColor ?? style.get('app-bar-foreground-color'),
              })),
            child: Container(
              height: 48,
              child: Column(
                children: [
                  if (hasTitle)
                    Container(
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: _buildBody(context),
                    ),
                  if (bottom != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: bottom,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _AppBarTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centered;

  const _AppBarTitle({Key key, this.title, this.subtitle, this.centered})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          (centered) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: style.get("app-bar-title-font-weight"),
            fontSize: style.get("app-bar-title-font-size"),
            fontFamily: style.get("app-bar-title-font-family"),
            color: style.get("app-bar-title-color"),
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: TextStyle(
              fontWeight: style.get("app-bar-subtitle-font-weight"),
              fontSize: style.get("app-bar-subtitle-font-size"),
              fontFamily: style.get("app-bar-subtitle-font-family"),
              color: style.get("app-bar-subtitle-color"),
            ),
          ),
      ],
    );
  }
}
