import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class TextFieldShowcase extends StatefulWidget {
  @override
  _TextFieldShowcaseState createState() => _TextFieldShowcaseState();
}

class _TextFieldShowcaseState extends ShowcaseState<TextFieldShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'enabled': BoolTyped(true),
          'label': BoolTyped(true),
          'description': BoolTyped(true),
          'error': BoolTyped(false),
          'icon': BoolTyped(false),
          'obscured': BoolTyped(false),
          'iconPosition': EnumTyped(NePositioning.left, NePositioning.values),
          'status': EnumTyped(NeWidgetStatus.primary, NeWidgetStatus.values),
          'shape': EnumTyped(NeWidgetShape.rectangle, NeWidgetShape.values),
          'size': EnumTyped(NeWidgetSize.medium, NeWidgetSize.values),
        },
        builder: (_, data) => NeTextField(
          hint: 'Hint',
          enabled: data['enabled'],
          label: data['label'] ? 'Label' : null,
          description: data['description'] ? 'Description' : null,
          error: data['error'] ? 'Error' : null,
          icon: data['icon'] ? EvaIcons.star : null,
          obscureText: data['obscured'],
          iconPosition: data['iconPosition'],
          status: data['status'],
          shape: data['shape'],
          size: data['size'],
        ),
      );

  @override
  String get showcaseName => 'TextField';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'TextField',
          builder: () => Column(
            children: [
              NeTextField(
                hint: 'Hint',
              ),
              SizedBox(height: 16.0),
              NeTextField(
                hint: 'Disabled',
                enabled: false,
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'TextField with Label and Description',
          builder: () => NeTextField(
            hint: 'Hint',
            label: 'Label',
            description: 'Description',
          ),
        ),
        ShowcaseWidgetData(
          title: 'TextField shapes',
          builder: () => SeparatedColumn(
            children: NeWidgetShape.values
                .map((shape) =>
                    NeTextField(hint: enumToString(shape), shape: shape))
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'TextField color',
          builder: () => SeparatedColumn(
            children: NeWidgetStatus.values
                .map((value) =>
                    NeTextField(hint: enumToString(value), status: value))
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'TextField with error',
          builder: () =>
              NeTextField(label: 'Label', hint: 'Hint', error: 'Error'),
        ),
        ShowcaseWidgetData(
          title: 'TextField with icon',
          builder: () => Column(
            children: [
              NeTextField(
                label: 'On left',
                hint: 'Hint',
                icon: EvaIcons.star,
                iconPosition: NePositioning.left,
              ),
              SizedBox(height: 16.0),
              NeTextField(
                label: 'On right',
                hint: 'Hint',
                icon: EvaIcons.star,
                iconPosition: NePositioning.right,
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Obscured TextField',
          builder: () => Column(
            children: [
              NeTextField(
                label: 'Label',
                hint: 'Hint',
                obscureText: true,
              ),
            ],
          ),
        ),
      ];
}
