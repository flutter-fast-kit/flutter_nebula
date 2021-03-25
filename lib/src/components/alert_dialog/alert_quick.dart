import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/locales/locales.dart';
import 'package:flutter_platform_selector/flutter_platform_selector.dart';

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
  required BuildContext context,
  Widget? title,
  Widget? content,
  TextStyle? contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  required List<AlertAction> actions,
}) {
  assert(context != null);

  assert(actions != null, '按钮不能为空!');

  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      final List<Widget> actionWidgets = [];
      actions.forEach((action) {
        NeWidgetStatus? status;
        switch (action.actionStyle) {
          case AlertActionStyle.cancel:
            status = NeWidgetStatus.info;
            break;
          case AlertActionStyle.destructive:
            status = NeWidgetStatus.danger;
            break;
          default:
            break;
        }

        actionWidgets.add(
          NeButton.ghost(
            fluid: false,
            label: Text(action.title),
            size: NeWidgetSize.large,
            status: status,
            onTap: action.actionState == AlertActionState.disable
                ? () {}
                : () {
                    Navigator.pop(context);
                    if (action.onPress != null) {
                      action.onPress!();
                    }
                  },
          ),
        );

        if (PlatformUniversal.isIOS) {
          final index = actions.indexOf(action);
          if (actions.length == 2 && index == 0) {
            actionWidgets.add(Container(
              child: NeDivider.v(),
            ));
          }
        }
      });

      return NeAlertDialog(
          title: title,
          elevation: 0,
          scrollable: scrollable,
          content: content,
          contentTextStyle: contentTextStyle,
          actions: actionWidgets,
          actionsPadding: PlatformSelector.select<EdgeInsetsGeometry>(
            ios: EdgeInsets.zero,
            other: EdgeInsets.zero,
            android: EdgeInsets.only(bottom: 12, right: 12),
          )!);
    },
  );
}

/// 带有 取消、确定的弹出框
///
void showConfirmAlertDialog({
  required BuildContext context,
  Widget? title,
  Widget? content,
  TextStyle? contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  String? cancelText,
  String? okText,
  VoidCallback? onOkPress,
  VoidCallback? onCancelPress,
}) {
  showAlertDialog(
      context: context,
      title: title ?? Text(context.tr('title')),
      content: content,
      contentTextStyle: contentTextStyle,
      scrollable: scrollable,
      barrierDismissible: barrierDismissible,
      actions: [
        AlertAction(
            title: cancelText ?? context.tr('cancel'), actionStyle: AlertActionStyle.cancel, onPress: onCancelPress),
        AlertAction(title: okText ?? context.tr('ok'), onPress: onOkPress)
      ]);
}

/// 只有确定按钮的弹出框
///
void showInfoAlertDialog({
  required BuildContext context,
  Widget? title,
  Widget? content,
  TextStyle? contentTextStyle,
  bool scrollable = true,
  bool barrierDismissible = true,
  String? okText,
  VoidCallback? onOkPress,
}) {
  showAlertDialog(
      context: context,
      title: title ?? Text(context.tr('title')),
      content: content,
      contentTextStyle: contentTextStyle,
      scrollable: scrollable,
      barrierDismissible: barrierDismissible,
      actions: [AlertAction(title: okText ?? context.tr('ok'), onPress: onOkPress)]);
}
