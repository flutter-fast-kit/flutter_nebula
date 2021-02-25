import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class RadioShowcase extends StatefulWidget {
  @override
  _RadioShowcaseState createState() => _RadioShowcaseState();
}

class _RadioShowcaseState extends ShowcaseState<RadioShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Radio';

  Map<String, bool> status = {};

  bool getStatus(String key, [bool def = false]) {
    if (status.containsKey(key)) return status[key];
    status[key] = def;
    return def;
  }

  setStatus(String key) {
    status[key] = true;
    var prefix = key.split('.').first;
    for (final itemKey in status.keys) {
      if (itemKey.split('.').first == prefix && itemKey != key) {
        status[itemKey] = false;
      }
    }
    setState(() {});
  }

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Radio',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NeRadio(
                value: getStatus('d.0'),
                onSelected: () => setStatus('d.0'),
                description: 'Description',
              ),
              NeRadio(
                value: getStatus('d.1'),
                onSelected: () => setStatus('d.1'),
                description: 'Description',
              ),
              NeRadio(
                value: false,
                onSelected: null,
                description: 'Disabled',
              ),
            ],
            separatorBuilder: (_, i) => SizedBox(height: 16.0),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Radio colors',
          builder: () => SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: NeWidgetStatus.values
                .map(
                  (value) => NeRadio(
                    value: getStatus(value.toString()),
                    onSelected: () => setStatus(value.toString()),
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
                  (value) => NeRadio(
                    value: getStatus(value.toString()),
                    onSelected: () => setStatus(value.toString()),
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
