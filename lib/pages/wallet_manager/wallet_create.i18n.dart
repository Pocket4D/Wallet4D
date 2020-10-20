import 'package:i18n_extension/i18n_extension.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/i18n_extension

extension Localization on String {
  //
  static var _t = Translations("en_us") +
      {
        "en_us": "Wallet Name",
        "zh_cn": "钱包名称",
      } +
      {
        "en_us": "Password",
        "zh_cn": "密码",
      } +
      {
        "en_us": "Confirm Your Password",
        "zh_cn": "请再次输入密码",
      } +
      {
        "en_us": "Password is not matched",
        "zh_cn": "两次输入密码不一致",
      } +
      {
        "en_us": "Wallet Name must not be empty",
        "zh_cn": "钱包名字不能为空",
      } +
      {
        "en_us": "Please save words below on a paper, in the next step you will need to use them",
        "zh_cn": "请在一张纸上记录以下单词，在下一步流程中将使用这些单词",
      } +
      {
        "en_us": "Click these words in correct order, you should had saved them elsewhere",
        "zh_cn": "按顺序点击刚才记录的单词，你刚才应该已经在其他地方保存了它们",
      } +
      {
        "en_us": "Enter password to encrypt your wallet",
        "zh_cn": "输入密码，加密钱包",
      } +
      {
        "en_us": "I have saved",
        "zh_cn": "我已经保存",
      } +
      {
        "en_us": "Next Step",
        "zh_cn": "下一步",
      } +
      {
        "en_us": "Finish",
        "zh_cn": "完成",
      } +
      {
        "en_us": "Step",
        "zh_cn": "步骤",
      } +
      {
        "en_us": "of 3",
        "zh_cn": " / 3",
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  String version(Object modifier) => localizeVersion(modifier, this, _t);

  Map<String, String> allVersions() => localizeAllVersions(this, _t);
}
