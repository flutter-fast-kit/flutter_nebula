import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

enum NeTextState {
  basic,
  alternate,
  disabled,
  hint,
  control,
}

enum NeTextStyle {
  caption1,
  caption2,
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  label,
  paragraph1,
  paragraph2,
  subtitle1,
  subtitle2,
}

class NeTextUtils {
  static String getStyleName({NeTextStyle? style}) {
    switch (style) {
      case NeTextStyle.caption1:
        return 'caption';
      case NeTextStyle.caption2:
        return 'caption-2';
      case NeTextStyle.heading1:
        return 'heading-1';
      case NeTextStyle.heading2:
        return 'heading-2';
      case NeTextStyle.heading3:
        return 'heading-3';
      case NeTextStyle.heading4:
        return 'heading-4';
      case NeTextStyle.heading5:
        return 'heading-5';
      case NeTextStyle.heading6:
        return 'heading-6';
      case NeTextStyle.label:
        return 'label';
      case NeTextStyle.paragraph1:
        return 'paragraph';
      case NeTextStyle.paragraph2:
        return 'paragraph-2';
      case NeTextStyle.subtitle1:
        return 'subtitle';
      case NeTextStyle.subtitle2:
        return 'subtitle-2';
      default:
        return 'subtitle-2';
    }
  }

  static TextStyle getTextStyle({NeTextStyle? style, required StaticStyleState styleData}) {
    final styleName = 'text-${getStyleName(style: style)}';
    final fontFamily = styleData.get('$styleName-font-family');
    final fontSize = styleData.get('$styleName-font-size');
    final fontWeight = styleData.get('$styleName-font-weight');

    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
