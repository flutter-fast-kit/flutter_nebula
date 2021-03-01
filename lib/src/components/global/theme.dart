import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';
import 'package:flutter_platform_selector/flutter_platform_selector.dart';

class NeTheme extends StatelessWidget {
  final StyleData theme;
  final Widget child;

  final bool isDarkMode;

  const NeTheme({Key key, this.theme, this.child, this.isDarkMode = false})
      : super(key: key);

  static const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
      <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialDesign.Theme(
        data: MaterialDesign.ThemeData(
          // splashFactory: const NoSplashFactory(),
          splashColor: Colors.transparent, // 取消水波纹
          errorColor: isDarkMode
              ? theme.get('color-danger-700')
              : theme.get('color-danger-600'),
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
          primaryColor: isDarkMode ? Color(0xFF1A273F) : Color(0xFFFFFFFF),
          accentColor: Color(0xFF135FDB),
          // Tab指示器颜色
          indicatorColor: Color(0xFF135FDB),
          // 页面背景色
          scaffoldBackgroundColor:
              isDarkMode ? Color(0xFF1A273F) : Color(0xFFFFFFFF),
          // 主要用于Material背景色
          canvasColor: isDarkMode ? Color(0xFF1A273F) : Color(0xFFFFFFFF),
          // 文字选择色（输入框复制粘贴菜单）
          textSelectionColor: Color(0xFF135FDB).withAlpha(70),
          textSelectionHandleColor: Color(0xFF135FDB),
          // 稳定发行版：1.23 变更(https://flutter.dev/docs/release/breaking-changes/text-selection-theme)
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color(0xFF135FDB).withAlpha(70),
            selectionHandleColor: Color(0xFF135FDB),
          ),
          // textTheme: TextTheme(
          //   // TextField输入文字颜色
          //   subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
          //   // Text文字样式
          //   bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
          //   subtitle2:
          //       isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
          // ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: theme.get('text-hint-color')),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: theme.get('app-bar-background-color'),
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
          dividerTheme: DividerThemeData(
              color: theme.get('divider-color'), space: 0.6, thickness: 0.6),
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
          pageTransitionsTheme: PlatformUniversal.isWeb
              ? PageTransitionsTheme()
              : const PageTransitionsTheme(builders: _defaultBuilders),
        ),
        child: ScrollConfiguration(
          behavior: NebulaScrollBehavior(),
          child: StaticStyle(
            data: theme,
            child: AnimatedDefaultTextStyle(
              duration: theme.get('major-animation-duration'),
              curve: theme.get('major-animation-curve'),
              style: TextStyle(color: theme.get('text-basic-color')),
              child: child,
            ),
          ),
        ));
  }
}
