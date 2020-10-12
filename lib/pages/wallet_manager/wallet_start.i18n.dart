import 'package:i18n_extension/i18n_extension.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/i18n_extension

extension Localization on String {
  //
  static var _t = Translations("en_us") +
      {
        "en_us": "Create a new wallet",
        "zh_cn": "创建一个新钱包",
      } +
      {
        "en_us": "I already have a wallet",
        "zh_cn": "我已经有一个钱包",
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  String version(Object modifier) => localizeVersion(modifier, this, _t);

  Map<String, String> allVersions() => localizeAllVersions(this, _t);
}
