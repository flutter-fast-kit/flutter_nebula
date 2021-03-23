import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

class NeToggleableDesciptionUtils {
  static List<Widget>? buildListWithDescription(
      {required Widget main,
      required double padding,
      Widget? description,
      required NePositioning descriptionPosition}) {
    if (description == null || descriptionPosition == NePositioning.none) {
      return <Widget>[main];
    }
    if (descriptionPosition == NePositioning.left) {
      return <Widget>[
        Flexible(child: description),
        SizedBox(width: padding),
        main,
      ];
    } else if (descriptionPosition == NePositioning.right) {
      return <Widget>[
        main,
        SizedBox(width: padding),
        Flexible(child: description),
      ];
    }
    return null;
  }
}
