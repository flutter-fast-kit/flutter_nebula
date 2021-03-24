import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class CheckboxShowcase extends StatefulWidget {
  @override
  _CheckboxShowcaseState createState() => _CheckboxShowcaseState();
}

class _CheckboxShowcaseState extends ShowcaseState<CheckboxShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Checkboxes';

  Map<String, bool> status = {};

  bool getStatus(String key, [bool def = true]) {
    if (status.containsKey(key)) return status[key]!;
    status[key] = def;
    return def;
  }

  setStatus(String key, bool value) {
    status[key] = value;
    setState(() {});
  }

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Checkbox',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NeCheckbox(
                value: getStatus('d.0', true),
                onChanged: (v) => setStatus('d.0', v),
                description: 'Description',
              ),
              NeCheckbox(
                value: getStatus('d.1'),
                onChanged: (v) => setStatus('d.1', v),
                description: 'Tristate',
              ),
              NeCheckbox(
                value: false,
                onChanged: null,
                description: 'Disabled',
              ),
              NeCheckbox(
                value: true,
                onChanged: null,
                description: 'Selected disabled',
              ),
            ],
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Checkbox colors',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NeWidgetStatus.values
                .map(
                  (value) => NeCheckbox(
                    value: getStatus(value.toString(), false),
                    onChanged: (v) => setStatus(value.toString(), v),
                    description: enumToString(value),
                    status: value,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Checkbox shapes',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NeWidgetShape.values
                .map(
                  (value) => NeCheckbox(
                    value: getStatus(value.toString(), false),
                    onChanged: (v) => setStatus(value.toString(), v),
                    description: enumToString(value),
                    shape: value,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Description location',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NePositioning.values
                .map(
                  (value) => NeCheckbox(
                    value: getStatus(value.toString(), false),
                    onChanged: (v) => setStatus(value.toString(), v),
                    description: enumToString(value),
                    descriptionPosition: value,
                  ),
                )
                .toList(),
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
      ];
}
