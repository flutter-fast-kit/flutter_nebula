import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

class TransparentPageRoute<T> extends PageRoute<T> {
  TransparentPageRoute({
    required this.builder,
    RouteSettings? settings,
  })  : assert(builder != null),
        super(
          settings: settings,
          fullscreenDialog: false,
        );

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 250);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final result = builder(context);

    return Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: AnimatedBuilder(
          animation: animation,
          child: null,
          builder: (BuildContext context, Widget? child) {
            final style = StaticStyle.of(context);
            return Opacity(
              opacity: style.get('minor-animation-curve').transform(animation.value),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: result,
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
