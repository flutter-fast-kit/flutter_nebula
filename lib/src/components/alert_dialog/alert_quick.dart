import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_css_style/flutter_css_style.dart';

import 'alert_action.dart';
import 'alert_dialog.dart';

/// 提示框
///
/// [content] 上下文
/// [title] 标题
/// [content] 内容
/// [contentTextStyle] 内容字体样式
/// [scrollable] 内容区域超过高度是否可以滚动, 默认为true
/// [barrierDismissible] 点击空白区域是否可以关闭弹窗, 默认为true
/// 按钮组（两者必须存在一个）
/// [leftAction] 左侧按钮
/// [rightAction] 右侧按钮
///
void showAlertDialog({
  @required BuildContext context,
  Widget title,
  Widget content,
  TextStyle contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  List<AlertAction> actions,
}) {
  assert(context != null);

  assert(actions != null, '按钮不能为空!');

  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      final style = StaticStyle.of(context);
      final List<Widget> actionWidgets = [];
      actions.forEach((action) {
        actionWidgets.add(Expanded(
            flex: 1,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: action.actionState != AlertActionState.disable
                  ? () {
                      Navigator.pop(context);
                      if (action.onPress != null) {
                        action.onPress();
                      }
                    }
                  : null,
              child: Text(
                action.title,
                style: const TextStyle(
                  fontSize: 14,
                ).merge(action.titleTextStyle).merge(
                    action.actionStyle == AlertActionStyle.cancel
                        ? const TextStyle(fontWeight: FontWeight.bold)
                        : action.actionStyle == AlertActionStyle.destructive
                            ? const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold)
                            : null),
              ),
            )));

        final index = actions.indexOf(action);
        if (actions.length == 2 && index == 0) {
          actionWidgets.add(Container(
            child: VerticalDivider(
              indent: 0,
              color: style.get('alert-dialog-divider-color'),
            ),
          ));
        }
      });

      return NeAlertDialog(
        title: title,
        elevation: 0,
        scrollable: scrollable,
        content: content,
        contentTextStyle: contentTextStyle,
        actions: actionWidgets,
      );
    },
  );
}

/// 带有 取消、确定的弹出框
///
void showConfirmAlertDialog({
  @required BuildContext context,
  Widget title = const Text('温馨提示'),
  Widget content,
  TextStyle contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  String cancelText = '取消',
  String okText = '确定',
  VoidCallback onOkPress,
}) {
  showAlertDialog(
      context: context,
      title: title,
      content: content,
      contentTextStyle: contentTextStyle,
      scrollable: scrollable,
      barrierDismissible: barrierDismissible,
      actions: [
        AlertAction(title: cancelText),
        AlertAction(title: okText, onPress: onOkPress)
      ]);
}

/// 只有确定按钮的弹出框
///
void showInfoAlertDialog({
  @required BuildContext context,
  Widget title = const Text('温馨提示'),
  Widget content,
  TextStyle contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  String okText = '确定',
  VoidCallback onOkPress,
}) {
  showAlertDialog(
      context: context,
      title: title,
      content: content,
      contentTextStyle: contentTextStyle,
      scrollable: scrollable,
      barrierDismissible: barrierDismissible,
      actions: [AlertAction(title: okText, onPress: onOkPress)]);
}
