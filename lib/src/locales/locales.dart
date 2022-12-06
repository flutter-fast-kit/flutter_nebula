import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nebula/src/locales/delegate.dart';

class NeLocales {
  static NeLocalesDelegate get defaultLocales => NeLocalesDefault();
  static NeLocalesDelegate? _customLocale;

  static NeLocalesDelegate? get customLocale => _customLocale;

  static void setLocaleDelegate(NeLocalesDelegate delegate) {
    _customLocale = delegate;
  }

  static String getLang(BuildContext context, String key) {
    String? lang;
    if (_customLocale != null) {
      lang = _customLocale!.load(context, key);
    }
    if (lang == null) {
      lang = defaultLocales.load(context, key);
    }
    return lang;
  }
}

extension NeLocalesContext on BuildContext {
  String tr(String key) {
    return NeLocales.getLang(this, key);
  }
}

class NeLocalesDefault implements NeLocalesDelegate {
  static final _defaultLangs = {
    'zh_CN': {'title': '温馨提示', 'ok': '确定', 'cancel': '取消'},
    'zh_TW': {'title': '溫馨提示', 'ok': '確定', 'cancel': '取消'},
    'en_US': {'title': 'Tips', 'ok': 'Confirm', 'cancel': 'Cancel'},
    'ko_KR': {'title': '팁', 'ok': '결정', 'cancel': '취소 하 다'},
    'ja_JP': {'title': 'チップ', 'ok': '決定する', 'cancel': 'キャンセル'},
    'fr_FR': {'title': 'Conseils', 'ok': 'déterminer', 'cancel': 'Annulation'},
    'es_ES': {'title': 'Consejos', 'ok': 'determinar', 'cancel': 'Cancelar'},
    'tr_TR': {'title': 'nazik ipuçları', 'ok': 'Elbette', 'cancel': 'İptal'},
  };

  @override
  String load(BuildContext context, String key) {
    final Locale? locale = EasyLocalization.of(context)?.locale;
    final dic = _defaultLangs['${locale?.languageCode}_${locale?.countryCode}'];
    return dic?[key] ?? _defaultLangs['zh_TW']![key]!;
  }
}
