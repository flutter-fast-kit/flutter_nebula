import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class TabsShowcase extends StatefulWidget {
  @override
  _TabsShowcaseState createState() => _TabsShowcaseState();
}

class _TabsShowcaseState extends ShowcaseState<TabsShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'hasIcons': BoolTyped(true),
        },
        builder: (_, data) => NeTabBar.top(
          tabs: [
            NeTabData.fromIcon(
                icon: data['hasIcons'] ? EvaIcons.star : null, title: 'Tab'),
            NeTabData.fromIcon(
                icon: data['hasIcons'] ? EvaIcons.star : null, title: 'Tab'),
            NeTabData.fromIcon(
                icon: data['hasIcons'] ? EvaIcons.star : null, title: 'Tab'),
          ],
          onSelect: data['enabled'] ? (i) {} : null,
        ),
      );

  @override
  String get showcaseName => 'TabBar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Tabs',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.top(
              tabs: [
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Tabs without icons',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.top(
              tabs: [
                NeTabData.fromIcon(title: 'Tab'),
                NeTabData.fromIcon(title: 'Tab'),
                NeTabData.fromIcon(title: 'Tab'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Disabled tabs',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.top(
              tabs: [
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: null,
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Partially disabled tabs',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.top(
              tabs: [
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
                NeTabData.fromIcon(
                    icon: EvaIcons.star, title: 'Tab', disabled: true),
                NeTabData.fromIcon(icon: EvaIcons.star, title: 'Tab'),
              ],
              onSelect: (i) {},
            ),
          ),
        ),
      ];
}
