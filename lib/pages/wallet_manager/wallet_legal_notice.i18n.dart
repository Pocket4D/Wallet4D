import 'package:i18n_extension/i18n_extension.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/i18n_extension

extension Localization on String {
  //
  static var _t = Translations("en_us") +
      {
        "en_us": "Legal Notice",
        "zh_cn": "法律声明",
      } +
      {
        "en_us": "Please review the Wallet4D Privacy Policy and Terms of Service.",
        "zh_cn": "请阅读有关Wallet4D的隐私政策和服务条款",
      } +
      {
        "en_us": "Term of Service",
        "zh_cn": "服务条款",
      } +
      {
        "en_us": "Privacy Policy",
        "zh_cn": "隐私政策",
      } +
      {
        "en_us": "Accept and continue",
        "zh_cn": "接受并继续",
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  String version(Object modifier) => localizeVersion(modifier, this, _t);

  Map<String, String> allVersions() => localizeAllVersions(this, _t);
}
