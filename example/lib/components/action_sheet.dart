import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

class ActionSheetShowcase extends StatefulWidget {
  @override
  _ActionSheetShowcaseState createState() => _ActionSheetShowcaseState();
}

class _ActionSheetShowcaseState extends ShowcaseState<ActionSheetShowcase> {
  @override
  Widget playgroundBuilder() {
    return SizedBox();
  }

  @override
  String get showcaseName => 'ActionSheet';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
          title: 'ActionSheet',
          builder: () => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: [
              NeButton(
                  onTap: () {
                    showActionSheet(
                        context: context,
                        actions: <ActionItem>[
                          ActionItem(
                              title: "男",
                              onPressed: () {
                                print('选择了男!');
                                Navigator.pop(context);
                              }),
                          ActionItem(
                              title: "女",
                              onPressed: () {
                                print('选择了女!');
                                Navigator.pop(context);
                              }),
                        ],
                        bottomActionItem: BottomActionItem(title: "取消"));
                  },
                  label: Text('单选/有尾部')),
              NeButton(
                  onTap: () {
                    showActionSheet(
                        context: context,
                        topActionItem: TopActionItem(desc: "请选择职业哈😄"),
                        actions: <ActionItem>[
                          ActionItem(
                              title: "IT",
                              onPressed: () {
                                print('选择了IT!');
                                Navigator.pop(context);
                              }),
                          ActionItem(
                              title: "律师",
                              onPressed: () {
                                print('选择了律师!');
                                Navigator.pop(context);
                              }),
                        ],
                        bottomActionItem: BottomActionItem(title: "取消"));
                  },
                  label: Text('单选/头尾')),
              NeButton(
                  onTap: () {
                    showActionSheet(
                      context: context,
                      topActionItem: TopActionItem(
                          title: "请选择支付方式",
                          doneAction: (List<int> data) {
                            Navigator.pop(context);
                            print('选了数据: $data}');
                          }),
                      choiceConfig: ChoiceConfig(items: [
                        ChoiceItem(
                            title: "支付宝",
                            leftIcon: Icon(Icons.payment_rounded)),
                        ChoiceItem(
                            title: "微信",
                            leftIcon: Icon(Icons.wb_twighlight),
                            isSelected: true),

                        /// 默认选项
                        ChoiceItem(
                            title: "银行卡",
                            leftIcon: Icon(Icons.ac_unit_outlined)),
                      ]),
                    );
                  },
                  label: Text('单选')),
              NeButton(
                onTap: () {
                  showActionSheet(
                    context: context,
                    topActionItem: TopActionItem(
                        title: "请选择支付方式",
                        doneAction: (List<int> data) {
                          Navigator.pop(context);
                          print('选了数据: $data}');
                        }),
                    choiceConfig: ChoiceConfig(isCheckBox: true, items: [
                      ChoiceItem(
                          title: "支付宝", leftIcon: Icon(Icons.payment_rounded)),
                      ChoiceItem(
                          title: "微信",
                          leftIcon: Icon(Icons.wb_twighlight),
                          isSelected: true),

                      /// 默认选项
                      ChoiceItem(
                          title: "银行卡",
                          leftIcon: Icon(Icons.ac_unit_outlined),
                          isSelected: true),
                    ]),
                  );
                },
                label: Text('多选'),
              ),
              NeButton(
                onTap: () {
                  showActionSheet(
                      context: context,
                      isScrollControlled: true,
                      topActionItem: TopActionItem(
                          title: "请选择支付方式",
                          doneAction: (List<int> data) {
                            Navigator.pop(context);
                            print('选了数据: $data}');
                          }),
                      content: Container(
                        child: Column(
                          children: [
                            TextField(),
                            NeButton(
                              onTap: null,
                              label: Text('Only leading'),
                              leading: NeIcon(EvaIcons.star),
                              fluid: true,
                            ),
                            TextField(),
                          ],
                        ),
                      ));
                },
                label: Text('模态输入框'),
              )
            ],
          ),
        ),
      ];
}
