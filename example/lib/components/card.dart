import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

String equinoxDescription =
    "An equinox is commonly regarded as the instant of time when the plane (extended indefinitely in all directions) of Earth's equator passes through the center of the Sun.";

class CardShowcase extends StatefulWidget {
  @override
  _CardShowcaseState createState() => _CardShowcaseState();
}

class _CardShowcaseState extends ShowcaseState<CardShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Cards';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          builder: () => NeCard(
            statusAppearance: NeCardStatusAppearance.none,
            header: Text('Basic card'),
            child: Text(equinoxDescription),
          ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => NeCard(
            statusAppearance: NeCardStatusAppearance.none,
            header: Text('With header and footer'),
            child: Text(equinoxDescription),
            footer: Text('By Wikipedia'),
          ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => NeCard(
            status: NeWidgetStatus.success,
            statusAppearance: NeCardStatusAppearance.header,
            header: Text('With status'),
            child: Text(equinoxDescription),
            footer: Text('By Wikipedia'),
          ),
          override: true,
        ),
        ShowcaseWidgetData(
          builder: () => NeCard(
            status: NeWidgetStatus.warning,
            statusAppearance: NeCardStatusAppearance.strip,
            header: Text('With status as a tiny strip'),
            child: Text(equinoxDescription),
            footer: Text('By Wikipedia'),
          ),
          override: true,
        ),
        ShowcaseWidgetData(
          title: 'Card shapes',
          builder: () => Column(
            children: [
              NeCard(
                status: NeWidgetStatus.success,
                statusAppearance: NeCardStatusAppearance.strip,
                header: Text('Rectangle'),
                child: Text(equinoxDescription),
                shape: NeWidgetShape.rectangle,
                footer: Text('By Wikipedia'),
              ),
              SizedBox(height: 16.0),
              NeCard(
                status: NeWidgetStatus.danger,
                shape: NeWidgetShape.semiRound,
                statusAppearance: NeCardStatusAppearance.strip,
                header: Text('Semi Round'),
                child: Text(equinoxDescription),
                footer: Text('By Wikipedia'),
              ),
            ],
          ),
        ),
      ];
}
