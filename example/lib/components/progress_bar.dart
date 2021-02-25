import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class ProgressBarShowcase extends StatefulWidget {
  @override
  _ProgressBarShowcaseState createState() => _ProgressBarShowcaseState();
}

class _ProgressBarShowcaseState extends ShowcaseState<ProgressBarShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
          data: {
            'shape': EnumTyped(NeWidgetShape.rectangle, NeWidgetShape.values),
            'status': EnumTyped(NeWidgetStatus.primary, NeWidgetStatus.values),
            'size': EnumTyped(NeWidgetSize.large, NeWidgetSize.values),
          },
          builder: (_, data) {
            return StatefulBuilder(builder: (context, setState) {
              return Row(
                children: [
                  NeIconButton(
                    icon: EvaIcons.minus,
                    onTap: () => setState(() =>
                        percentage2 = (percentage2 - 0.25).clamp(0.0, 1.0)),
                    status: data['status'],
                    appearance: NeWidgetAppearance.ghost,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: NeProgressBar(
                        value: percentage2,
                        status: data['status'],
                        shape: data['shape'],
                        size: data['size'],
                        text: '${(percentage2 * 100.0).round().toString()}%'),
                  ),
                  SizedBox(width: 16.0),
                  NeIconButton(
                    icon: EvaIcons.plus,
                    onTap: () => setState(() =>
                        percentage2 = (percentage2 + 0.25).clamp(0.0, 1.0)),
                    status: data['status'],
                    appearance: NeWidgetAppearance.ghost,
                  ),
                ],
              );
            });
          });

  @override
  String get showcaseName => 'ProgressBar';
  double percentage = 0.5;
  double percentage2 = 0.5;
  @override
  List<ShowcaseWidgetData> get showcases {
    return [
      ShowcaseWidgetData(
        title: 'Progress bar',
        builder: () => SeparatedColumn(
          children: [
            NeProgressBar(
              value: 0.45,
              text: '45%',
            ),
            NeProgressBar(
              value: 0.85,
              text: '85%',
            ),
          ],
          separatorBuilder: (_, i) => SizedBox(height: 16.0),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar colors',
        builder: () => SeparatedColumn(
          children: NeWidgetStatus.values
              .map(
                (value) => NeProgressBar(
                  value: 0.8,
                  text: enumToString(value),
                  status: value,
                ),
              )
              .toList(),
          separatorBuilder: (_, i) => SizedBox(height: 16.0),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar shapes',
        builder: () => SeparatedColumn(
          children: NeWidgetShape.values
              .map(
                (value) => NeProgressBar(
                  value: 0.8,
                  text: enumToString(value),
                  status: NeWidgetStatus.success,
                  shape: value,
                ),
              )
              .toList(),
          separatorBuilder: (_, i) => SizedBox(height: 16.0),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar sizes',
        builder: () => SeparatedColumn(
          children: NeWidgetSize.values
              .map(
                (value) => NeProgressBar(
                  value: 0.8,
                  text: enumToString(value),
                  size: value,
                ),
              )
              .toList(),
          separatorBuilder: (_, i) => SizedBox(height: 16.0),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Progress bar animation',
        builder: () => StatefulBuilder(builder: (context, setState) {
          return Row(
            children: [
              NeIconButton(
                icon: EvaIcons.minus,
                onTap: () => setState(
                    () => percentage = (percentage - 0.25).clamp(0.0, 1.0)),
                status: NeWidgetStatus.success,
                appearance: NeWidgetAppearance.ghost,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: NeProgressBar(
                    value: percentage,
                    status: NeWidgetStatus.success,
                    text: '${(percentage * 100.0).round().toString()}%'),
              ),
              SizedBox(width: 16.0),
              NeIconButton(
                icon: EvaIcons.plus,
                onTap: () => setState(
                    () => percentage = (percentage + 0.25).clamp(0.0, 1.0)),
                status: NeWidgetStatus.success,
                appearance: NeWidgetAppearance.ghost,
              ),
            ],
          );
        }),
      ),
    ];
  }
}
