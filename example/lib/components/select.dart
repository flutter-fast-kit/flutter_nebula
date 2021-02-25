import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class SelectShowcase extends StatefulWidget {
  @override
  _SelectShowcaseState createState() => _SelectShowcaseState();
}

class _SelectShowcaseState extends ShowcaseState<SelectShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'label': BoolTyped(true),
          'description': BoolTyped(true),
          'icon': BoolTyped(false),
          'status': EnumTyped(NeWidgetStatus.primary, NeWidgetStatus.values),
          'shape': EnumTyped(NeWidgetShape.rectangle, NeWidgetShape.values),
          'size': EnumTyped(NeWidgetSize.medium, NeWidgetSize.values),
          'appearance':
              EnumTyped(NeWidgetAppearance.outline, NeWidgetAppearance.values),
        },
        builder: (_, data) => NeSelect(
          hint: 'Hint',
          label: data['label'] ? 'Label' : null,
          description: data['description'] ? 'Description' : null,
          icon: data['icon'] ? EvaIcons.star : null,
          status: data['status'],
          shape: data['shape'],
          items: selectItems,
          onSelect: data['enabled'] ? (v) {} : null,
          size: data['size'],
          appearance: data['appearance'],
        ),
      );

  @override
  String get showcaseName => 'Select';

  var selectItems = [
    NeSelectItem(
      title: 'Item 1',
      subtitle: 'Subtitle for Item 1',
      value: '1',
      icon: EvaIcons.star,
    ),
    NeSelectItem(
      title: 'Item 2',
      subtitle: 'Subtitle for Item 2',
      value: '2',
      icon: EvaIcons.star,
    ),
    NeSelectItem(
      title: 'Item 3',
      subtitle: 'Subtitle for Item 3',
      value: '3',
      icon: EvaIcons.star,
    ),
  ];

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Select',
          builder: () => SeparatedColumn(
            children: [
              NeSelect(
                hint: 'Enabled',
                items: selectItems,
                onSelect: (v) {},
              ),
              NeSelect(
                hint: 'Disabled',
                items: selectItems,
                onSelect: null,
              ),
            ],
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select with label and description',
          builder: () => NeSelect(
            label: 'Label',
            description: 'Description',
            hint: 'Hint',
            items: selectItems,
            onSelect: (v) {},
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select colors',
          builder: () => SeparatedColumn(
            children: NeWidgetStatus.values
                .map(
                  (value) => NeSelect(
                    hint: enumToString(value),
                    status: value,
                    onSelect: (v) {},
                    items: selectItems,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select shapes',
          builder: () => SeparatedColumn(
            children: NeWidgetShape.values
                .map(
                  (value) => NeSelect(
                    hint: enumToString(value),
                    shape: value,
                    onSelect: (v) {},
                    items: selectItems,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select icons',
          builder: () => NeSelect(
            hint: 'With icon',
            icon: EvaIcons.star,
            onSelect: (v) {},
            items: selectItems,
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select sizes',
          builder: () => SeparatedColumn(
            children: NeWidgetSize.values
                .map(
                  (value) => NeSelect(
                    hint: enumToString(value),
                    size: value,
                    onSelect: (v) {},
                    items: selectItems,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Select appearances',
          builder: () => SeparatedColumn(
            children: NeWidgetAppearance.values
                .map(
                  (value) => NeSelect(
                    hint: enumToString(value),
                    appearance: value,
                    status: NeWidgetStatus.primary,
                    onSelect: (v) {},
                    items: selectItems,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
      ];
}
