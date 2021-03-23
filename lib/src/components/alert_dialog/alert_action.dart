import 'package:flutter/material.dart';

/// 事件按钮样式
///
/// [normal] 默认
/// [cancel] 加粗显示
/// [destructive] 红色加粗
/// []
enum AlertActionStyle { normal, cancel, destructive }

/// 事件按钮状态
///
/// [disable] 禁用 （为灰色）
/// [enable] 启用 默认
enum AlertActionState { disable, enable }

/// 事件按钮
///
/// [title] 按钮标题
/// [titleTextStyle] 按钮标题样式
/// [actionStyle] 样式
/// [actionState] 状态
/// [onPress] 回调事件
class AlertAction {
  final String title;
  final TextStyle? titleTextStyle;
  final AlertActionStyle actionStyle;
  final AlertActionState actionState;
  final VoidCallback? onPress;

  AlertAction(
      {required this.title,
      this.titleTextStyle,
      this.actionStyle = AlertActionStyle.normal,
      this.actionState = AlertActionState.enable,
      this.onPress});
}
