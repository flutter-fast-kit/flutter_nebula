import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/main.dart';
import 'package:flutter_nebula_demo_online/state.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(EquinoxShowcaseApp());
}

class EquinoxShowcaseApp extends StatefulWidget {
  @override
  _EquinoxShowcaseAppState createState() => _EquinoxShowcaseAppState();
}

class _EquinoxShowcaseAppState extends State<EquinoxShowcaseApp> {
  @override
  Widget build(BuildContext context) {
    AppState.subscribe(() => setState(() => {}));
    return NebulaApp(
      title: 'Flutter Demo',
      theme: AppState.theme,
      home: MainPage(),
      builder: (BuildContext context, Widget? child) {
        return Container();
      },
    );
  }
}
