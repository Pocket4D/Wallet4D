import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';

class JhQrCodeUtils {
  // 调起二维码扫描页
  static Future<String> scan() async {
    try {
      const ScanOptions options = ScanOptions(
        strings: {
          'cancel': 'cancel',
          'flash_on': 'Light On',
          'flash_off': 'Light Off',
        },
      );
      final ScanResult result = await BarcodeScanner.scan(options: options);
      return result.rawContent;
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == BarcodeScanner.cameraAccessDenied) {
          Fluttertoast.showToast(
              msg: "You don't have permission",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
    return null;
  }

  // 生成二维码（中间带图片）
  static Widget createQRCode(String data, double size,
      {Color backgroundColor,
      Color foregroundColor,
      EdgeInsets padding,
      ImageProvider image,
      Size imageSize}) {
    return QrImage(
      data: data,
      size: size,
      backgroundColor: backgroundColor == null ? Color(0x00FFFFFF) : backgroundColor,
      foregroundColor: foregroundColor == null ? Color(0xFF000000) : foregroundColor,
      padding: padding == null ? EdgeInsets.all(10.0) : padding,
      embeddedImage: image,
      embeddedImageStyle: QrEmbeddedImageStyle(size: imageSize),
    );
  }
}
