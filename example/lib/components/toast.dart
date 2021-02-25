import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

class ToastShowcase extends StatefulWidget {
  @override
  _ToastShowcaseState createState() => _ToastShowcaseState();
}

class _ToastShowcaseState extends ShowcaseState<ToastShowcase> {
  @override
  Widget playgroundBuilder() => InteractivePlayground(
        data: {
          'subtitle': BoolTyped(true),
          'icon': BoolTyped(true),
          'status': EnumTyped(NeWidgetStatus.success, NeWidgetStatus.values),
          'shape': EnumTyped(NeWidgetShape.semiRound, NeWidgetShape.values),
        },
        builder: (_, data) {
          return SizedBox(
            width: double.infinity,
            child: NeButton(
              status: data['status'],
              shape: data['shape'],
              label: Text('Show toast'),
              onTap: () => showToast(
                NeToast(
                  message: 'A message',
                  subtitle: data['subtitle'] ? 'And a subtitle' : null,
                  icon: data['icon'] ? EvaIcons.star : null,
                  status: data['status'],
                  shape: data['shape'],
                  duration: Duration(seconds: 5),
                ),
              ),
            ),
          );
        },
      );

  @override
  String get showcaseName => 'Toasts';

  showToast(NeToast data) {
    NeToastService.of(context).pushToast(toast: data);
  }

  @override
  List<ShowcaseWidgetData> get showcases {
    return [
      ShowcaseWidgetData(
        title: 'Toasts',
        builder: () => NeButton(
          label: Text('Show toast'),
          onTap: () => showToast(
            NeToast(
              message: 'Hi! I am a toast.',
              subtitle: 'Click me to dismiss!',
              icon: EvaIcons.star,
            ),
          ),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Toast colors',
        builder: () => SeparatedColumn(
          separatorBuilder: (_, i) => SizedBox(height: 8.0),
          children: NeWidgetStatus.values
              .map((value) => SizedBox(
                  width: double.infinity,
                  child: NeButton(
                    status: value,
                    label: Text('Show ${enumToString(value)} toast'),
                    onTap: () => showToast(
                      NeToast(
                        message: 'Hi! I am a ${enumToString(value)} toast.',
                        subtitle: 'Click me to dismiss!',
                        status: value,
                        icon: EvaIcons.star,
                      ),
                    ),
                  )))
              .toList(),
        ),
      ),
      ShowcaseWidgetData(
        title: 'Toast shapes',
        builder: () => SeparatedColumn(
          separatorBuilder: (_, i) => SizedBox(height: 8.0),
          children: NeWidgetShape.values
              .map((value) => SizedBox(
                  width: double.infinity,
                  child: NeButton(
                    label: Text('Show ${enumToString(value)} toast'),
                    onTap: () => showToast(
                      NeToast(
                        message: 'Hi! I am a ${enumToString(value)} toast.',
                        subtitle: 'Click me to dismiss!',
                        shape: value,
                        icon: EvaIcons.star,
                      ),
                    ),
                  )))
              .toList(),
        ),
      ),
    ];
  }
}
