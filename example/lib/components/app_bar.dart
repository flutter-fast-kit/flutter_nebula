import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';

import '../state.dart';

class AppBarShowcase extends StatefulWidget {
  @override
  _AppBarShowcaseState createState() => _AppBarShowcaseState();
}

class _AppBarShowcaseState extends State {
  @override
  Widget build(BuildContext context) {
    // return NeLayout(
    //   appBar: NeAppBar(
    //     title: Text('Showcase'),
    //     actions: [
    //       NeIconButton(
    //         icon: EvaIcons.sunOutline,
    //         onTap: AppState.toggleTheme,
    //         appearance: NeWidgetAppearance.ghost,
    //       ),
    //     ],
    //   ),
    //   child: Container(color: Colors.amberAccent),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('Showcase'),
        actions: [
          NeIconButton(
            icon: EvaIcons.sunOutline,
            onTap: AppState.toggleTheme,
            appearance: NeWidgetAppearance.ghost,
          ),
        ],
      ),
      body: Container(color: Colors.amberAccent),
    );
  }
}
