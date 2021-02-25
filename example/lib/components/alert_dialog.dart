import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class AlertDialogShowcase extends StatefulWidget {
  @override
  _AlertDialogShowcaseState createState() => _AlertDialogShowcaseState();
}

class _AlertDialogShowcaseState extends ShowcaseState<AlertDialogShowcase> {
  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }

  @override
  String get showcaseName => 'Alert Dialog';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'AlertDialog',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                  onTap: () {
                    showConfirmAlertDialog(
                        context: context, content: Text('我是内容!!!!!!'));
                  },
                  label: Text('确定/取消按钮')),
              NeButton(
                  onTap: () {
                    showInfoAlertDialog(
                        context: context, content: Text('我是内容'));
                  },
                  label: Text('确定按钮')),
              NeButton(
                  onTap: () {
                    showAlertDialog(
                        context: context,
                        title: Text('确认绑定此路径'),
                        content: Text('绑定此路径将无法更改'),
                        actions: [
                          AlertAction(
                              title: '取消',
                              actionStyle: AlertActionStyle.destructive),
                          AlertAction(
                              title: '确定',
                              onPress: () {
                                print('绑定此路径将无法更改');
                              }),
                        ]);
                  },
                  label: Text('自定义')),
            ],
          ),
        ),
      ];
}
