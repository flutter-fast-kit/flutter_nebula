import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class TextShowcase extends StatefulWidget {
  @override
  _TextShowcaseState createState() => _TextShowcaseState();
}

class _TextShowcaseState extends ShowcaseState<TextShowcase> {
  
  @override
  String get showcaseName => 'Texts';

  @override
  List<ShowcaseWidgetData> get showcases {
    return [
      ShowcaseWidgetData(
        title: 'heading1',
        builder: () {
          return NeText.heading1('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'heading2',
        builder: () {
          return NeText.heading2('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'heading3',
        builder: () {
          return NeText.heading3('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'heading4',
        builder: () {
          return NeText.heading4('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'heading5',
        builder: () {
          return NeText.heading5('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'heading6',
        builder: () {
          return NeText.heading6('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'paragraph1',
        builder: () {
          return NeText.paragraph1('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'paragraph2',
        builder: () {
          return NeText.paragraph2('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'subtitle1',
        builder: () {
          return NeText.subtitle1('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'subtitle2',
        builder: () {
          return NeText.subtitle2('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'label',
        builder: () {
          return NeText.label('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'caption1',
        builder: () {
          return NeText.caption1('我是文字');
        }
      ),
      ShowcaseWidgetData(
        title: 'caption2',
        builder: () {
          return NeText.caption2('我是文字');
        }
      ),
    ];
  }

  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }
}
