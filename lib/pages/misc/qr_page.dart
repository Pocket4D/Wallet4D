import 'package:flutter/material.dart';

import 'package:wallet4d/utils/jh_qrcode_util.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatefulWidget {
  QRPage({Key key, this.title, this.name, this.params}) : super(key: key);
  final String title;
  final String name;
  final dynamic params;
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  var _textStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("二维码扫描"),
              onPressed: () {
//          QRCodeUtils.scan().then((value) =>print(value);
//          _scan();
                JhQrCodeUtils.scan().then((value) => setState(() {
                      print(value);
                      _textStr = value;
                    }));
              },
            ),
            SizedBox(
              height: 50,
            ),
            Text('扫描到的信息：'),
            SizedBox(
              height: 10,
            ),
            Text(
              _textStr,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 50,
            ),
            //生成二维码
            JhQrCodeUtils.createQRCode("生成二维码生成二维码生成二维码", 100, foregroundColor: Colors.yellow),
            JhQrCodeUtils.createQRCode("生成二维码生成二维码生成二维码", 100, backgroundColor: Colors.yellow),
            SizedBox(
              height: 10,
            ),
            JhQrCodeUtils.createQRCode("生成二维码生成二维码生成二维码2222", 100,
                image: NetworkImage('https://gitee.com/iotjh/Picture/raw/master/lufei.png'),
                imageSize: Size(20, 20)),
            Center(
              child: QrImage(
                data: '这是二维码的内容',
                size: 200,
                embeddedImage: NetworkImage('https://gitee.com/iotjh/Picture/raw/master/lufei.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(50, 50),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void _scan() async {
    var code = await JhQrCodeUtils.scan();
    if (code != null) {
      print(code);
    }
  }
}
