import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

import '../state.dart';

class AppBarShowcase extends StatefulWidget {
  @override
  _AppBarShowcaseState createState() => _AppBarShowcaseState();
}

class _AppBarShowcaseState extends ShowcaseState<AppBarShowcase> {
  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }

  @override
  String get showcaseName => 'App Bar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'AppBar',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeAppBar(
                title: 'Showcase',
                subtitle: showcaseName,
                actions: [
                  NeIconButton(
                    icon: EvaIcons.sunOutline,
                    onTap: AppState.toggleTheme,
                    appearance: NeWidgetAppearance.ghost,
                  ),
                ],
              ),
              NeAppBar.withoutTitle(
                bottom: NeAppBar(
                  title: 'Showcase',
                  // subtitle: showcaseName,
                  // actions: [
                  //   NeIconButton(
                  //     icon: EvaIcons.sunOutline,
                  //     onTap: AppState.toggleTheme,
                  //     appearance: NeWidgetAppearance.ghost,
                  //   ),
                  // ],
                ),
              ),
              NeAppBar.bottom(
                bottom: NeTabBar.top(
                  tabs: [
                    NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                    NeTabData.fromIcon(
                        icon: EvaIcons.star, title: 'Tab', disabled: true),
                    NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                  ],
                  onSelect: (i) {},
                ),
              )
            ],
          ),
        ),
      ];
}
