// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class NeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const NeAppBar(
//       {Key key,
//       this.backgroundColor,
//       this.title = '',
//       this.centerTitle = '',
//       this.actionName = '',
//       this.backImg = 'assets/images/ic_back_black.png',
//       this.onPressed,
//       this.onPressedBack,
//       this.isBack = true,
//       this.actionTextColor,
//       this.centerWidget})
//       : super(key: key);
//
//   final Color backgroundColor;
//   final String title;
//   final String centerTitle;
//   final String backImg;
//   final String actionName;
//   final VoidCallback onPressed;
//   final VoidCallback onPressedBack; //返回点击事件----可以自定义，用于向上一级页面传值
//   final bool isBack;
//   final Widget centerWidget;
//   final Color actionTextColor; //点击按钮颜色
//   @override
//   Widget build(BuildContext context) {
//     Color _backgroundColor;
//
//     if (backgroundColor == null) {
//       _backgroundColor = context.backgroundColor;
//     } else {
//       _backgroundColor = backgroundColor;
//     }
//
//     final SystemUiOverlayStyle _overlayStyle =
//         ThemeData.estimateBrightnessForColor(_backgroundColor) ==
//                 Brightness.dark
//             ? SystemUiOverlayStyle.light
//             : SystemUiOverlayStyle.dark;
//
//     Widget back = isBack
//         ? IconButton(
//             onPressed: onPressedBack ??
//                 () {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                   Navigator.maybePop(context);
//                 },
//             tooltip: 'Back',
//             padding: const EdgeInsets.all(12.0),
//             icon: Image.asset(
//               backImg,
//               color: ThemeUtils.getIconColor(context),
//             ),
//           )
//         : Gaps.empty;
//
//     Widget action = actionName.isNotEmpty
//         ? Positioned(
//             right: 0.0,
//             child: Theme(
//               data: Theme.of(context).copyWith(
//                 buttonTheme: const ButtonThemeData(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   minWidth: 60.0,
//                 ),
//               ),
//               child: FlatButton(
//                 child: Text(actionName, key: const Key('actionName')),
//                 textColor: actionTextColor ??
//                     (context.isDark ? Colours.dark_text : Colours.text),
//                 highlightColor: Colors.transparent,
//                 onPressed: onPressed,
//               ),
//             ),
//           )
//         : Gaps.empty;
//
//     Widget titleWidget = Semantics(
//       namesRoute: true,
//       header: true,
//       child: Container(
//         alignment:
//             centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
//         width: double.infinity,
//         child: Text(
//           title.isEmpty ? centerTitle : title,
//           style: TextStyle(
//             fontSize: Dimens.font_sp18,
//           ),
//         ),
//         margin: const EdgeInsets.symmetric(horizontal: 48.0),
//       ),
//     );
//
//     List<Widget> widgets = [
//       titleWidget,
//       back,
//       action,
//     ];
//
//     if (centerWidget != null) {
//       widgets.insert(1, centerWidget);
//     }
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: _overlayStyle,
//       child: Material(
//         color: _backgroundColor,
//         child: SafeArea(
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: widgets,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(48.0);
// }
