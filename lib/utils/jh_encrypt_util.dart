import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flustars/flustars.dart';

const _IV = "0000000000000000";

//128的keysize=16，192keysize=24，256keysize=32

class JhEncryptUtils {
  //Base64编码
  static String encodeBase64(String data) {
    return base64Encode(utf8.encode(data));
  }

  //Base64解码
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  // md5 加密 32位小写
  static String encodeMd5(String plainText) {
    return EncryptUtil.encodeMd5(plainText);
  }

  //AES加密
  static aesEncrypt(String plainText, String password, [String ivValue = _IV]) {
    try {
      final key = Key.fromUtf8(password);
      final iv = IV.fromUtf8(ivValue);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(plainText, iv: iv);
      return encrypted.base64;
    } catch (err) {
      print("aes encode error:$err");
      return plainText;
    }
  }

  //AES解密
  static dynamic aesDecrypt(String encrypted, String password, [String ivValue = _IV]) {
    try {
      final key = Key.fromUtf8(password);
      final iv = IV.fromUtf8(_IV);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final decrypted = encrypter.decrypt64(encrypted, iv: iv);
      return decrypted;
    } catch (err) {
      print("aes decode error:$err");
      return encrypted;
    }
  }
}
