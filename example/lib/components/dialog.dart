import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:flutter_nebula_demo_online/utils.dart';
import 'package:separated_column/separated_column.dart';

String equinoxDescription =
    "An equinox is commonly regarded as the instant of time when the plane (extended indefinitely in all directions) of Earth's equator passes through the center of the Sun.";

class DialogShowcase extends StatefulWidget {
  @override
  _DialogShowcaseState createState() => _DialogShowcaseState();
}

class _DialogShowcaseState extends ShowcaseState<DialogShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Dialogs';

  Future pushInformationDialog({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    NeWidgetStatus status = NeWidgetStatus.info,
  }) async {
    return showDialog(context: context, builder: (context) {
      return NeDialog(
          child: body,
          header: Text(title),
          footerPadding: EdgeInsets.zero,
          status: status,
          footer: NeButton(
            onTap: () => Navigator.of(context).pop(),
            appearance: NeWidgetAppearance.ghost,
            label: Text('Close'),
            status: status,
          ),
        );
    });
  }

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'Dialogs',
          builder: () {
            return SeparatedColumn(
              separatorBuilder: (BuildContext context, int index) {  },
              children: [
                SizedBox(
                  width: double.infinity,
                  child: NeButton(
                    label: Text('Open information dialog'),
                    status: NeWidgetStatus.info,
                    onTap: () {
                      pushInformationDialog(context: context, title: '标题', body: Text('WeUI 是一套同微信原生视觉体验一致的基础样式库，由微信官方设计团队为微信内网页和微信小程序量身设计'));
                      // NeDialogService.of(context).pushInformationDialog(
                      //   context: context,
                      //   title: 'A title',
                      //   body: Text(equinoxDescription),
                      // );
                    },
                  ),
                )
              ]);
          }
        )
  ];
}