import 'package:flutter_nebula/flutter_nebula.dart';

String generateSelector(List<dynamic> items) {
  List<dynamic> nonNull = items.where((i) => i != null).toList();
  String string = "";

  for (final item in nonNull) {
    string += enumValueToString(item);
    string += "-";
  }

  return string.substring(0, string.length - 1);
}
