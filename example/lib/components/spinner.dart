import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class SpinnerShowcase extends StatefulWidget {
  @override
  _SpinnerShowcaseState createState() => _SpinnerShowcaseState();
}

class _SpinnerShowcaseState extends ShowcaseState<SpinnerShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Spinners';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Spinner',
          builder: () => NeSpinner(),
        ),
        ShowcaseWidgetData(
          title: 'Spinner colors',
          builder: () => Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.start,
            children: NeWidgetStatus.values
                .map((status) => NeSpinner(
                      status: status,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Spinner sizes',
          builder: () => Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.start,
            children: NeWidgetSize.values.reversed
                .map((size) => NeSpinner(
                      size: size,
                    ))
                .toList(),
          ),
        ),
      ];
}
