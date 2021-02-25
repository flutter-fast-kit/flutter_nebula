import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';

class ButtonShowcase extends StatefulWidget {
  @override
  _ButtonShowcaseState createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends ShowcaseState<ButtonShowcase> {
  @override
  InteractivePlayground playgroundBuilder() {
    return InteractivePlayground(
      data: {
        'enabled': BoolTyped(true),
        'leadingIconEnabled': BoolTyped(false),
        'trailingIconEnabled': BoolTyped(false),
        'fluid': BoolTyped(false),
        'iconPosition': EnumTyped(NePositioning.left, NePositioning.values),
        'appearance':
            EnumTyped(NeWidgetAppearance.filled, NeWidgetAppearance.values),
        'shape': EnumTyped(NeWidgetShape.rectangle, NeWidgetShape.values),
        'status': EnumTyped(NeWidgetStatus.primary, NeWidgetStatus.values),
        'size': EnumTyped(NeWidgetSize.large, NeWidgetSize.values),
      },
      builder: (_, data) => NeButton(
        onTap: data['enabled'] ? onClick : null,
        appearance: data['appearance'],
        leading: data['leadingIconEnabled'] ? NeIcon(EvaIcons.star) : null,
        trailing: data['trailingIconEnabled'] ? NeIcon(EvaIcons.star) : null,
        label: Text('Button'),
        shape: data['shape'],
        status: data['status'],
        size: data['size'],
        fluid: data['fluid'],
      ),
    );
  }

  @override
  String get showcaseName => 'Buttons';

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
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Buttons',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(onTap: onClick, label: Text('Active')),
              NeButton(onTap: null, label: Text('Disabled')),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button colors',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.filled(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.filled(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button sizes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetSize.values.reversed
                .map((size) => NeButton(
                      onTap: onClick,
                      label: Text(enumToString(size)),
                      size: size,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Outline button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.outline(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.outline(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Ghost button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.ghost(
                        onTap: onClick,
                        label: Text(enumToString(status)),
                        status: status,
                      ))
                  .toList()),
              ...(NeWidgetStatus.values
                  .map((status) => NeButton.ghost(
                        onTap: null,
                        label: Text('${enumToString(status)} disabled'),
                        status: status,
                      ))
                  .toList()),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button shapes',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: NeWidgetShape.values
                .map((shape) => NeButton(
                      onTap: onClick,
                      label: Text(enumToString(shape)),
                      shape: shape,
                    ))
                .toList(),
          ),
        ),
        ShowcaseWidgetData(
          title: 'Button with icon',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                onTap: onClick,
                label: Text('Only leading'),
                leading: NeIcon(EvaIcons.star),
              ),
              NeButton(
                onTap: onClick,
                label: Text('Only trailing'),
                trailing: NeIcon(EvaIcons.star),
              ),
              NeButton(
                onTap: onClick,
                label: Text('Both'),
                leading: NeIcon(EvaIcons.star),
                trailing: NeIcon(EvaIcons.star),
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Fluid button',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                onTap: onClick,
                label: Text('Only leading'),
                leading: NeIcon(EvaIcons.star),
                fluid: true,
              ),
              NeButton(
                onTap: onClick,
                label: Text('Only trailing'),
                trailing: NeIcon(EvaIcons.star),
                fluid: true,
              ),
              NeButton(
                onTap: onClick,
                label: Text('Both1'),
                leading: NeIcon(EvaIcons.star),
                trailing: NeIcon(EvaIcons.star),
                fluid: true,
              ),
            ],
          ),
        ),
        ShowcaseWidgetData(
          title: 'Fluid button with itemAlignment set',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: MainAxisAlignment.values
                .map(
                  (value) => NeButton(
                    onTap: onClick,
                    label: Text(enumToString(value)),
                    leading: NeIcon(EvaIcons.star),
                    trailing: NeIcon(EvaIcons.star),
                    fluid: true,
                    itemAlignment: value,
                  ),
                )
                .toList(),
          ),
        ),
      ];
}
