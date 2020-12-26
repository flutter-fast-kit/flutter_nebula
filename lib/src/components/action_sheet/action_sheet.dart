export 'action_item.dart';
export 'bottom_action_item.dart';
export 'bottom_action_sheet.dart';
export 'choice_config.dart';
export 'choice_item.dart';
export 'top_action_item.dart';

/// DEMO
// body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       RaisedButton(
//           child: Text("性别选择"),
//           onPressed: () {
//             showActionSheet(
//                 context: context,
//                 actions: <ActionItem>[
//                   ActionItem(
//                       title: "男",
//                       onPressed: () {
//                         print('选择了男!');
//                         Navigator.pop(context);
//                       }),
//                   ActionItem(
//                       title: "女",
//                       onPressed: () {
//                         print('选择了女!');
//                         Navigator.pop(context);
//                       }),
//                 ],
//                 bottomActionItem: BottomActionItem(title: "取消"));
//           }),
//       RaisedButton(
//           child: Text("职业选择-带描述"),
//           onPressed: () {
//             showActionSheet(
//                 context: context,
//                 topActionItem: TopActionItem(desc: "请选择职业哈😄"),
//                 actions: <ActionItem>[
//                   ActionItem(
//                       title: "IT",
//                       onPressed: () {
//                         print('选择了IT!');
//                         Navigator.pop(context);
//                       }),
//                   ActionItem(
//                       title: "律师",
//                       onPressed: () {
//                         print('选择了律师!');
//                         Navigator.pop(context);
//                       }),
//                 ],
//                 bottomActionItem: BottomActionItem(title: "取消"));
//           }),
//       RaisedButton(
//           child: Text("选择支付方式-单选"),
//           onPressed: () {
//             showActionSheet(
//               context: context,
//               topActionItem: TopActionItem(
//                   title: "请选择支付方式",
//                   doneAction: (List<int> data) {
//                     Navigator.pop(context);
//                     print('选了数据: $data}');
//                   }),
//               choiceConfig: ChoiceConfig(items: [
//                 ChoiceItem(
//                     title: "支付宝", leftIcon: Icon(Icons.payment_rounded)),
//                 ChoiceItem(
//                     title: "微信",
//                     leftIcon: Icon(Icons.wb_twighlight),
//                     isSelected: true),
//
//                 /// 默认选项
//                 ChoiceItem(
//                     title: "银行卡", leftIcon: Icon(Icons.ac_unit_outlined)),
//               ]),
//             );
//           }),
//       RaisedButton(
//           child: Text("选择支付方式-多选"),
//           onPressed: () {
//             showActionSheet(
//               context: context,
//               topActionItem: TopActionItem(
//                   title: "请选择支付方式",
//                   doneAction: (List<int> data) {
//                     Navigator.pop(context);
//                     print('选了数据: $data}');
//                   }),
//               choiceConfig: ChoiceConfig(isCheckBox: true, items: [
//                 ChoiceItem(
//                     title: "支付宝", leftIcon: Icon(Icons.payment_rounded)),
//                 ChoiceItem(
//                     title: "微信",
//                     leftIcon: Icon(Icons.wb_twighlight),
//                     isSelected: true),
//
//                 /// 默认选项
//                 ChoiceItem(
//                     title: "银行卡",
//                     leftIcon: Icon(Icons.ac_unit_outlined),
//                     isSelected: true),
//               ]),
//             );
//           }),
//     ],
//   ),
// )
