import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula_demo_online/management/showcase_state.dart';
import 'package:separated_column/separated_column.dart';

String equinoxDescription =
    "An equinox is commonly regarded as the instant of time when the plane (extended indefinitely in all directions) of Earth's equator passes through the center of the Sun.";

class DialogShowcase extends StatefulWidget {
  @override
  _DialogShowcaseState createState() => _DialogShowcaseState();
}

class _DialogShowcaseState extends ShowcaseState<DialogShowcase> {
  @override
  Widget playgroundBuilder() => SizedBox();

  @override
  String get showcaseName => 'Dialogs';

  @override
  List<ShowcaseWidgetData> get showcases => [
        ShowcaseWidgetData(
            title: 'Dialogs',
            builder: () {
              final space = SizedBox(height: 50);
              return SeparatedColumn(
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          space,
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 3,
                                color: Colors.cyan,
                              ),
                              NeDivider(),
                              Container(
                                width: 100,
                                height: 3,
                                color: Colors.cyan,
                              ),
                              NeDivider(),
                              Container(
                                width: 100,
                                height: 3,
                                color: Colors.cyan,
                              )
                            ],
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                NeDivider.v(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                NeDivider.v(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            color: Colors.white,
                            width: double.infinity,
                            height: 200,
                          ),
                          Text("Default"),
                        ],
                      ),
                    )
                  ]);
            })
      ];
}
