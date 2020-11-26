import 'package:flutter/material.dart' as MaterialDesign;
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

class NeTheme extends StatelessWidget {
  final StyleData theme;
  final Widget child;

  const NeTheme({Key key, this.theme, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialDesign.Theme(
        data: MaterialDesign.ThemeData(
          splashFactory: const NoSplashFactory(),
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
