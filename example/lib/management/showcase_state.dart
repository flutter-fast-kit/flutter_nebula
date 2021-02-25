import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/state.dart';

export 'package:flutter_nebula_demo_online/management/interactive_playground.dart';

class ShowcaseWidgetData {
  final String title;
  final Widget Function() builder;
  final bool override;

  ShowcaseWidgetData({
    this.title,
    this.builder,
    this.override = false,
  });
}

abstract class ShowcaseState<T extends StatefulWidget> extends State<T> {
  List<ShowcaseWidgetData> get showcases;
  String get showcaseName;
  Widget playgroundBuilder();

  List<Widget> get children {
    var items = <Widget>[];

    showcases.forEach((showcase) {
      items.add(
        showcase.override
            ? showcase.builder()
            : NeCard(
                statusAppearance: NeCardStatusAppearance.none,
                header: Text(showcase.title),
                child: showcase.builder(),
              ),
      );
      items.add(SizedBox(height: 16.0));
    });

    items.add(playgroundBuilder());
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return NeLayout(
      appBar: NeAppBar(
        title: 'Showcase',
        subtitle: showcaseName,
        centerTitle: true,
        actions: [
          NeIconButton(
            icon: EvaIcons.sunOutline,
            onTap: AppState.toggleTheme,
            appearance: NeWidgetAppearance.ghost,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: children,
        ),
      ),
    );
  }
}
