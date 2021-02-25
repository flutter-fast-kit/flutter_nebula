import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class IconButtonShowcase extends StatefulWidget {
  @override
  _IconButtonShowcaseState createState() => _IconButtonShowcaseState();
}

class _IconButtonShowcaseState extends ShowcaseState<IconButtonShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  onClick() {
    /*EqToastService.of(context).pushToast(
      toast: EqToast(
        message: 'I have been clicked!',
        status: WidgetStatus.success,
        icon: EvaIcons.star,
      ),
    );*/
  }

  @override
  String get showcaseName => 'Buttons';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'IconButton',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeIconButton(
                onTap: onClick,
                icon: EvaIcons.star,
              ),
              NeIconButton(
                onTap: null,
                icon: EvaIcons.star,
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton colors',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetStatus.values
                .map((status) => NeIconButton(
                      onTap: onClick,
                      icon: EvaIcons.star,
                      status: status,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton sizes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetSize.values.reversed
                .map((size) => NeIconButton(
                      onTap: onClick,
                      icon: EvaIcons.star,
                      size: size,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton outline',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetStatus.values
                .map((status) => NeIconButton(
                      onTap: onClick,
                      icon: EvaIcons.star,
                      status: status,
                      appearance: NeWidgetAppearance.outline,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton ghost',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetStatus.values
                .map((status) => NeIconButton(
                      onTap: onClick,
                      icon: EvaIcons.star,
                      status: status,
                      appearance: NeWidgetAppearance.ghost,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'IconButton shapes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetShape.values
                .map((shape) => NeIconButton(
                      onTap: onClick,
                      icon: EvaIcons.star,
                      shape: shape,
                    ))
                .toList(),
          ),
        ),
      ];
}
