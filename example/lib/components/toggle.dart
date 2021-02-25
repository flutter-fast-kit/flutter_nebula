import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class ToggleShowcase extends StatefulWidget {
  @override
  _ToggleShowcaseState createState() => _ToggleShowcaseState();
}

class _ToggleShowcaseState extends ShowcaseState<ToggleShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Toggles';

  Map<String, bool> status = {};

  bool getStatus(String key, [bool def = true]) {
    if (status.containsKey(key)) return status[key];
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
          title: 'Toggle',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NeToggle(
                value: getStatus('d.0', true),
                onChanged: (v) => setStatus('d.0', v),
                description: 'Description',
              ),
              NeToggle(
                value: false,
                onChanged: null,
                description: 'Disabled',
              ),
              NeToggle(
                value: true,
                onChanged: null,
                description: 'Selected disabled',
              ),
            ],
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Toggle colors',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NeWidgetStatus.values
                .map(
                  (value) => NeToggle(
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
          title: 'Description location',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NePositioning.values
                .map(
                  (value) => NeToggle(
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
        ShowcaseWidgetData(
          title: 'Display Icon',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NePositioning.values
                .map(
                  (value) => NeToggle(
                    showIcon: true,
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
