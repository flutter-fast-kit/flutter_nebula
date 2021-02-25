import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class TabsBottomShowcase extends StatefulWidget {
  @override
  _TabsBottomShowcaseState createState() => _TabsBottomShowcaseState();
}

class _TabsBottomShowcaseState extends ShowcaseState<TabsBottomShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'hasTitle': BoolTyped(true),
          'hasIcons': BoolTyped(true),
        },
        builder: (_, data) => NeTabBar.bottom(
          tabs: [
            NeTabData.fromIcon(
              icon: data['hasIcons'] ? EvaIcons.star : null,
              title: data['hasTitle'] ? 'Tab' : null,
            ),
            NeTabData.fromIcon(
              icon: data['hasIcons'] ? EvaIcons.star : null,
              title: data['hasTitle'] ? 'Tab' : null,
            ),
            NeTabData.fromIcon(
              icon: data['hasIcons'] ? EvaIcons.star : null,
              title: data['hasTitle'] ? 'Tab' : null,
            ),
          ],
          onSelect: data['enabled'] ? (i) {} : null,
        ),
      );

  @override
  String get showcaseName => 'Bottom TabBar';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Bottom TabBar',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.bottom(
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
            child: NeTabBar.bottom(
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
          title: 'Tabs without title',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.bottom(
              tabs: [
                NeTabData.fromIcon(icon: EvaIcons.star),
                NeTabData.fromIcon(icon: EvaIcons.star),
                NeTabData.fromIcon(icon: EvaIcons.star),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Disabled tabs',
          builder: () => NeCard(
            padding: const EdgeInsets.all(4.0),
            child: NeTabBar.bottom(
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
            child: NeTabBar.bottom(
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
