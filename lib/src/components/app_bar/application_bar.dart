import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_css_style/flutter_css_style.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// 自定义AppBar
class NeApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const NeApplicationBar(
      {Key key,
      this.backgroundColor,
      this.title = '',
      this.centerTitle = '',
      this.actionName = '',
      this.backImg = const Icon(Icons.arrow_back_rounded),
      this.onPressed,
      this.onPressedBack,
      this.isBack = true,
      this.actionTextColor,
      this.centerWidget,
      this.centerFontSize})
      : super(key: key);

  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final Widget backImg;
  final String actionName;
  final VoidCallback onPressed;
  final VoidCallback onPressedBack; // 返回点击事件----可以自定义，用于向上一级页面传值
  final bool isBack;
  final Widget centerWidget;
  final Color actionTextColor; //点击按钮颜色
  final double centerFontSize; //中间标题大小

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

    final Widget back = isBack
        ? IconButton(
            onPressed: onPressedBack ??
                () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.maybePop(context);
                },
            tooltip: 'Back',
            padding: const EdgeInsets.all(12.0),
            icon: backImg,
          )
        : NeSpace.empty;

    final Widget action = actionName.isNotEmpty
        ? Positioned(
            right: 0.0,
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: const ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  minWidth: 60.0,
                ),
              ),
              child: FlatButton(
                child: Text(actionName, key: const Key('actionName')),
                textColor: actionTextColor ?? Colors.black, // todo: ....
                highlightColor: Colors.transparent,
                onPressed: onPressed,
              ),
            ),
          )
        : NeSpace.empty;

    final Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        alignment:
            centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
        width: double.infinity,
        child: Text(
          title.isEmpty ? centerTitle : title,
          style: TextStyle(
              fontSize: title.isEmpty ? 16 : 18,
              fontWeight: FontWeight.bold,

              ///
              color: const Color.fromRGBO(66, 66, 66, 1.0)

              ///
              ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 48.0),
      ),
    );

    final List<Widget> widgets = [
      titleWidget,
      back,
      action,
    ];

    if (centerWidget != null) {
      widgets.insert(1, centerWidget);
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: widgets,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
