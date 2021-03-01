import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/components/action_sheet.dart';
import 'package:flutter_nebula_demo_online/components/alert_dialog.dart';
import 'package:flutter_nebula_demo_online/components/android_toast.dart';
import 'package:flutter_nebula_demo_online/components/button.dart';
import 'package:flutter_nebula_demo_online/components/card.dart';
import 'package:flutter_nebula_demo_online/components/checkbox.dart';
import 'package:flutter_nebula_demo_online/components/dialog.dart';
import 'package:flutter_nebula_demo_online/components/icon_button.dart';
import 'package:flutter_nebula_demo_online/components/progress_bar.dart';
import 'package:flutter_nebula_demo_online/components/radio.dart';
import 'package:flutter_nebula_demo_online/components/select.dart';
import 'package:flutter_nebula_demo_online/components/spinner.dart';
import 'package:flutter_nebula_demo_online/components/tabs.dart';
import 'package:flutter_nebula_demo_online/components/tabs_bottom.dart';
import 'package:flutter_nebula_demo_online/components/text_field.dart';
import 'package:flutter_nebula_demo_online/components/toast.dart';
import 'package:flutter_nebula_demo_online/components/toggle.dart';
import 'package:flutter_nebula_demo_online/state.dart';

import 'components/app_bar.dart';
import 'components/text.dart';

void main() => runApp(EquinoxShowcaseApp());

class EquinoxShowcaseApp extends StatefulWidget {
  @override
  _EquinoxShowcaseAppState createState() => _EquinoxShowcaseAppState();
}

class _EquinoxShowcaseAppState extends State<EquinoxShowcaseApp> {
  @override
  void initState() {
    super.initState();
    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //设置为透明
          statusBarIconBrightness: Brightness.light);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppState.subscribe(() => setState(() => {}));
    return NebulaApp(
      title: 'Flutter Demo',
      theme: AppState.theme,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: builder,
      ),
    );
  }

  final List<ShowcaseData> showcases = [
    ShowcaseData(
      builder: (_) => ActionSheetShowcase(),
      title: 'Action Sheet',
    ),
    ShowcaseData(
      builder: (_) => AppBarShowcase(),
      title: 'App Bar',
    ),
    ShowcaseData(
      builder: (_) => DialogShowcase(),
      title: 'Dialog',
    ),
    ShowcaseData(
      builder: (_) => AndroidToastShowcase(),
      title: 'Android Style Toast',
    ),
    ShowcaseData(
      builder: (_) => AlertDialogShowcase(),
      title: 'Alert Dialog',
    ),
    ShowcaseData(
      builder: (_) => TextShowcase(),
      title: ' Text',
    ),
    ShowcaseData(
      builder: (_) => ButtonShowcase(),
      title: 'Buttons',
    ),
    ShowcaseData(
      builder: (_) => CardShowcase(),
      title: 'Cards',
    ),
    ShowcaseData(
      builder: (_) => CheckboxShowcase(),
      title: 'Checkbox',
    ),
    ShowcaseData(
      builder: (_) => IconButtonShowcase(),
      title: 'Icon Buttons',
    ),
    ShowcaseData(
      builder: (_) => ProgressBarShowcase(),
      title: 'Progress Bar',
    ),
    ShowcaseData(
      builder: (_) => RadioShowcase(),
      title: 'Radio',
    ),
    ShowcaseData(
      builder: (_) => SelectShowcase(),
      title: 'Select',
    ),
    ShowcaseData(
      builder: (_) => SpinnerShowcase(),
      title: 'Spinners',
    ),
    ShowcaseData(
      builder: (_) => TabsShowcase(),
      title: 'TabBar',
    ),
    ShowcaseData(
      builder: (_) => TabsBottomShowcase(),
      title: 'TabBar (bottom)',
    ),
    ShowcaseData(
      builder: (_) => TextFieldShowcase(),
      title: 'TextField',
    ),
    ShowcaseData(
      builder: (_) => ToastShowcase(),
      title: 'Toast',
    ),
    ShowcaseData(
      builder: (_) => ToggleShowcase(),
      title: 'Toggle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NeLayout(
      appBar: NeAppBar(
        title: Text('Showcase app'),
        centerTitle: true,
        actions: [
          NeIconButton(
            icon: EvaIcons.sunOutline,
            onTap: AppState.toggleTheme,
            appearance: NeWidgetAppearance.ghost,
            size: NeWidgetSize.large,
          ),
        ],
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: showcases.length,
          itemBuilder: (_, index) {
            final item = showcases[index];
            return NeListItem(
              onTap: () => navigateTo(context, item.builder),
              title: item.title,
              icon: EvaIcons.star,
              subtitle: '${item.title} showcase',
            );
          }),
    );
  }
}

class ShowcaseData {
  final String title;
  final WidgetBuilder builder;

  ShowcaseData({this.title, this.builder});
}
